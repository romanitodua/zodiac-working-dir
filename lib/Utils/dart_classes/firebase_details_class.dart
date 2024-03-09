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
    descriptionDaily = json['DescriptionDaily'];
    descriptionWeekly = json['DescriptionWeekly'];
    descriptionMonthly = json['DescriptionMonthly'];
    descriptionYearly = json['DescriptionYearly'];
    todayMoto = json['TodayMoto'];
    yearlyMoto = json['YearlyMoto'];
    yearHealth = json['YearHealth'];
    yearCareer = json['YearCareer'];
    yearLove = json['YearLove'];
    todayLove = json['TodayLove'];
    todayCareer = json['TodayCareer'];
    todayHealth = json['TodayHealth'];
  }

  factory FireBaseDetails.fromError() {
    return FireBaseDetails(
        descriptionDaily:
            "The information isn't updated yet , check back later",
        descriptionWeekly:
            "The information  isn't updated yet , check back later",
        descriptionMonthly:
            "The information  isn't updated yet , check back later",
        descriptionYearly:
            "The information isn't updated yet , check back later",
        todayMoto: "",
        yearlyMoto: "",
        yearHealth: "",
        yearCareer: "",
        yearLove: "",
        todayLove: "",
        todayCareer: "",
        todayHealth: "");
  }
}
