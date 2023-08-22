import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<dynamic> filteredData = [];
List<dynamic> columnHeader = [];
List<dynamic> rowData = [];

class DataTableWidget extends StatefulWidget {
  final TextEditingController con;
  final List<dynamic> scourceData;
  final List<dynamic> columnHeader;
  final List<dynamic> rowData;
  final String fillterBy;
  final String hintText;

  const DataTableWidget({
    super.key,
    required this.con,
    required this.scourceData,
    required this.hintText,
    required this.fillterBy,
    required this.columnHeader,
    required this.rowData,
  });

  @override
  State<DataTableWidget> createState() => _DataTableWidget();
}

class _DataTableWidget extends State<DataTableWidget> {
  @override
  void initState() {
    filteredData = widget.scourceData;
    columnHeader = widget.columnHeader;
    rowData = widget.rowData;
    super.initState();
  }

  @override
  void dispose() {
    widget.con.text = "";
    super.dispose();
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filteredData = text.isEmpty
          ? widget.scourceData
          : widget.scourceData
              .where((item) => item[widget.fillterBy]
                  .toLowerCase()
                  .contains(text.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 25.sp,
            child: TextField(
              controller: widget.con,
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 14.sp),
                contentPadding: EdgeInsets.only(left: defaultPaddin * 4.sp),
                border: const OutlineInputBorder(),
              ),
              onChanged: onSearchTextChanged,
            ),
          ),
          _paginatedDataTable(context),
        ],
      ),
    );
  }

  Widget _paginatedDataTable(BuildContext context) {
    return PaginatedDataTable(
      source: _TableData(),
      showCheckboxColumn: true,
      horizontalMargin: 20,
      columnSpacing: 18.sp,
      rowsPerPage: filteredData.length < 5
          ? filteredData.length
          : filteredData.length >= 5
              ? 5
              : 1,
      columns: List.generate(
        widget.columnHeader.length,
        (index) {
          return _dataColumn(widget.columnHeader[index]);
        },
      ),
    );
  }

  DataColumn _dataColumn(String txt) {
    return DataColumn(
      label: Text(
        txt,
        style: WebAppTextStyle.headline1.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class _TableData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    filteredData.length,
    (index) => filteredData[index],
  );

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int rowIndex) {
    return DataRow(
      cells: List.generate(
        rowData.length,
        (index) {
          return _dataCell(
            rowIndex,
            rowData[index],
          );
        },
      ),
    );
  }

  DataCell _dataCell(int index, String txt) {
    return DataCell(
      Text(
        _data[index][txt],
        overflow: TextOverflow.ellipsis,
        style: WebAppTextStyle.title1.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
