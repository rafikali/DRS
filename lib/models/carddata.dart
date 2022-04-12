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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['my_missing_checkout_count'] = myMissingCheckoutCount;
    data['my_ghost_count'] = myGhostCount;
    data['my_leave_balance_count'] = myLeaveBalanceCount;
    data['my_no_dailyUpdates_count'] = myNoDailyUpdatesCount;
    data['my_not_acknowledge_dailyUpdates_count'] =
        myNotAcknowledgeDailyUpdatesCount;
    return data;
  }
}
