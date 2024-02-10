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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sign'] = sign;
    data['description_daily'] = descriptionDaily;
    data['description_weekly'] = descriptionWeekly;
    data['description_yearly'] = descriptionYearly;
    data['description_monthly'] = descriptionMonthly;
    data['date'] = date;
    return data;
  }

}