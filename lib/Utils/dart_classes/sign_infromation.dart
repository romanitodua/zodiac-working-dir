class SignInformation {
  String? sign;
  String? descriptionDaily;
  String? descriptionWeekly;
  String? descriptionYearly;
  String? descriptionMonthly;
  String? date;

  SignInformation(
      {this.sign,
        this.descriptionDaily,
        this.descriptionWeekly,
        this.descriptionYearly,
        this.descriptionMonthly,
        this.date});

  SignInformation.fromJson(Map<String, dynamic> json) {
    sign = json['sign'];
    descriptionDaily = json['description_daily'];
    descriptionWeekly = json['description_weekly'];
    descriptionYearly = json['description_yearly'];
    descriptionMonthly = json['description_monthly'];
    date = json['date'];
  }
}