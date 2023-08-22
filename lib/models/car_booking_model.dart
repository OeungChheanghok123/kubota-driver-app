import 'dart:convert';

class CarBookingModel {
  final String dateBook;
  final String location;
  final String lastLocation;
  final String detail;
  final String people;
  final String departureDate;
  final String returnDate;
  final String bookBy;
  final String statusDate;
  final String status;

  CarBookingModel({
    this.dateBook = 'dateBook',
    this.location = 'location',
    this.lastLocation = 'lastLocation',
    this.detail = 'detail',
    this.people = 'people',
    this.departureDate = 'departureDate',
    this.returnDate = 'returnDate',
    this.bookBy = 'bookBy',
    this.statusDate = 'statusDate',
    this.status = 'status',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateBook': dateBook,
      'location': location,
      'lastLocation': lastLocation,
      'detail': detail,
      'people': people,
      'departureDate': departureDate,
      'returnDate': returnDate,
      'bookBy': bookBy,
      'statusDate': statusDate,
      'status': status,
    };
  }

  factory CarBookingModel.fromMap(Map<String, dynamic> map) {
    return CarBookingModel(
      dateBook: map['dateBook'] as String,
      location: map['location'] as String,
      lastLocation: map['lastLocation'] as String,
      detail: map['detail'] as String,
      people: map['people'] as String,
      departureDate: map['departureDate'] as String,
      returnDate: map['returnDate'] as String,
      bookBy: map['bookBy'] as String,
      statusDate: map['statusDate'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarBookingModel.fromJson(String source) => CarBookingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
