class FireBaseDetails {
  String? descriptionDaily;
  String? descriptionWeekly;
  String? descriptionMonthly;
  String? descriptionYearly;
  String? todayMoto;
  String? yearlyMoto;
  String? yearHealth;
  String? yearCareer;
  String? yearLove;
  String? todayLove;
  String? todayCareer;
  String? todayHealth;

  FireBaseDetails(
      {required this.descriptionDaily,
      required this.descriptionWeekly,
      required this.descriptionMonthly,
      required this.descriptionYearly,
      required this.todayMoto,
      required this.yearlyMoto,
      required this.yearHealth,
      required this.yearCareer,
      required this.yearLove,
      required this.todayLove,
      required this.todayCareer,
      required this.todayHealth});

  FireBaseDetails.fromFireBase(Map<String, dynamic> json) {
    descriptionDaily = json['description_daily'];
    descriptionWeekly = json['description_weekly'];
    descriptionMonthly = json['description_monthly'];
    descriptionYearly = json['description_yearly'];
    todayMoto = json['today_moto'];
    yearlyMoto = json['yearly_moto'];
    yearHealth = json['year_health'];
    yearCareer = json['year_career'];
    yearLove = json['year_love'];
    todayLove = json['today_love'];
    todayCareer = json['today_career'];
    todayHealth = json['today_health'];
  }

  factory FireBaseDetails.fromError() {
    return FireBaseDetails(
        descriptionDaily: "Error Occurred",
        descriptionWeekly: "Error Occurred",
        descriptionMonthly: "Error Occurred",
        descriptionYearly: "Error Occurred",
        todayMoto: "Error Occurred",
        yearlyMoto: "Error Occurred",
        yearHealth: "Error Occurred",
        yearCareer: "Error Occurred",
        yearLove: "Error Occurred",
        todayLove: "Error Occurred",
        todayCareer: "Error Occurred",
        todayHealth: "Error Occurred");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description_daily'] = descriptionDaily;
    data['description_weekly'] = descriptionWeekly;
    data['description_monthly'] = descriptionMonthly;
    data['description_yearly'] = descriptionYearly;
    data['today_moto'] = todayMoto;
    data['yearly_moto'] = yearlyMoto;
    data['year_health'] = yearHealth;
    data['year_career'] = yearCareer;
    data['year_love'] = yearLove;
    data['today_love'] = todayLove;
    data['today_career'] = todayCareer;
    data['today_health'] = todayHealth;
    return data;
  }
}
