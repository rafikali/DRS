class CardData {
  int? myMissingCheckoutCount;
  int? myGhostCount;
  double? myLeaveBalanceCount;
  String? myNoDailyUpdatesCount;
  String? myNotAcknowledgeDailyUpdatesCount;

  CardData(
      {this.myMissingCheckoutCount,
      this.myGhostCount,
      this.myLeaveBalanceCount,
      this.myNoDailyUpdatesCount,
      this.myNotAcknowledgeDailyUpdatesCount});

  CardData.fromJson(Map<String, dynamic> json) {
    myMissingCheckoutCount = json['my_missing_checkout_count'];
    myGhostCount = json['my_ghost_count'];
    myLeaveBalanceCount = json['my_leave_balance_count'];
    myNoDailyUpdatesCount = json['my_no_dailyUpdates_count'];
    myNotAcknowledgeDailyUpdatesCount =
        json['my_not_acknowledge_dailyUpdates_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['my_missing_checkout_count'] = this.myMissingCheckoutCount;
    data['my_ghost_count'] = this.myGhostCount;
    data['my_leave_balance_count'] = this.myLeaveBalanceCount;
    data['my_no_dailyUpdates_count'] = this.myNoDailyUpdatesCount;
    data['my_not_acknowledge_dailyUpdates_count'] =
        this.myNotAcknowledgeDailyUpdatesCount;
    return data;
  }
}
