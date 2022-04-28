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
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['project'] = project;
    data['acknowledge_at'] = acknowledgeAt;
    data['dailyupdate_for'] = dailyupdateFor;
    return data;
  }
}
