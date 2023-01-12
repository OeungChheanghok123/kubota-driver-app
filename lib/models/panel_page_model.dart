enum PanelPageStatus { dashboard, driver, carBooking, carRequest, logout }

class PanelPageValue<T> {
  final PanelPageStatus status;
  T? data;

  PanelPageValue({
    required this.status,
    this.data,
  });
}
