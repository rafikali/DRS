class Schedule {
  String? checkIn;
  String? checkOut;
  int? lateEarlyBy;
  int? officeEndTime;

  Schedule({this.checkIn, this.checkOut, this.lateEarlyBy, this.officeEndTime});

  Schedule.fromJson(Map<String, dynamic> json) {
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    lateEarlyBy = json['late_early_by'];
    officeEndTime = json['office_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checkIn'] = checkIn;
    data['checkOut'] = checkOut;
    data['late_early_by'] = lateEarlyBy;
    data['office_end_time'] = officeEndTime;
    return data;
  }
}
