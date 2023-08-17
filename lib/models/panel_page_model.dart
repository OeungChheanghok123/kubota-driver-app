enum PanelPageStatus {
  dashboard,
  driverAdd,
  driverView,
  driverManage,
  carRegisterAdd,
  carRegisterView,
  carRegisterManage,
  userRegistation,
  bookings,
  logout,
}

class PanelPageValue<T> {
  final PanelPageStatus status;
  T? data;

  PanelPageValue({
    required this.status,
    this.data,
  });
}
