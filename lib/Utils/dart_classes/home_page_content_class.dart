class HomePageContent {
  String? sign;
  String? todayLove;
  String? todayCareer;
  String? todayHealth;
  String? todayDescription;
  String? yearDescription;
  String? yearHealth;
  String? yearCareer;
  String? yearLove;
  String? todayMoto;
  String? yearMoto;

  HomePageContent(
      {required this.sign,
      required this.todayLove,
      required this.todayCareer,
      required this.todayHealth,
      required this.todayDescription,
      required this.yearDescription,
      required this.yearHealth,
      required this.yearCareer,
      required this.yearLove,
      required this.todayMoto,
      required this.yearMoto});

  HomePageContent.fromFireBase(Map<String, dynamic> json) {
    sign = json['sign'];
    todayLove = json['today_love'];
    todayCareer = json['today_career'];
    todayHealth = json['today_health'];
    todayDescription = json['today_description'];
    yearDescription = json['year_description'];
    yearHealth = json['year_health'];
    yearCareer = json['year_career'];
    yearLove = json['year_love'];
    todayMoto = json['today_moto'];
    yearMoto = json['year_moto'];
  }

  factory HomePageContent.fromError() {
    return HomePageContent(
        sign: "Error Occurred",
        todayLove: "Error Occurred",
        todayCareer: "Error Occurred",
        todayHealth: "Error Occurred",
        todayDescription: "Error Occurred",
        yearDescription: "Error Occurred",
        yearHealth: "Error Occurred",
        yearCareer: "Error Occurred",
        yearLove: "Error Occurred",
        todayMoto: "Error Occurred",
        yearMoto: "Error Occurred");
  }
}
