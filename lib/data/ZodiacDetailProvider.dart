class ZodiacDetailProvider {
  String? sign;
  String? descriptionDaily;
  String? descriptionWeekly;
  String? descriptionYearly;
  String? descriptionMonthly;
  String? date;

  ZodiacDetailProvider(
      {this.sign,
        this.descriptionDaily,
        this.descriptionWeekly,
        this.descriptionYearly,
        this.descriptionMonthly,
        this.date});

  ZodiacDetailProvider.fromJson(Map<String, dynamic> json) {
    sign = json['sign'];
    descriptionDaily = json['description_daily'];
    descriptionWeekly = json['description_weekly'];
    descriptionYearly = json['description_yearly'];
    descriptionMonthly = json['description_monthly'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sign'] = this.sign;
    data['description_daily'] = this.descriptionDaily;
    data['description_weekly'] = this.descriptionWeekly;
    data['description_yearly'] = this.descriptionYearly;
    data['description_monthly'] = this.descriptionMonthly;
    data['date'] = this.date;
    return data;
  }

}