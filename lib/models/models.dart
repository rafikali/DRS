class LoginResponse {
  String? status;
  String? message;
  String? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}

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

class DailyUpdatesModel {
  List<Data>? data;

  DailyUpdatesModel({this.data});

  DailyUpdatesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  String? description;
  String? project;
  String? acknowledgeAt;
  String? dailyupdateFor;

  Data(
      {this.title,
      this.description,
      this.project,
      this.acknowledgeAt,
      this.dailyupdateFor});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    project = json['project'];
    acknowledgeAt = json['acknowledge_at'];
    dailyupdateFor = json['dailyupdate_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['project'] = this.project;
    data['acknowledge_at'] = this.acknowledgeAt;
    data['dailyupdate_for'] = this.dailyupdateFor;
    return data;
  }
}
