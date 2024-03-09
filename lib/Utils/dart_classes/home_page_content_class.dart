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
    todayLove = json['TodayLove'];
    todayCareer = json['TodayCareer'];
    todayHealth = json['TodayHealth'];
    todayDescription = json['TodayDescription'];
    yearDescription = json['YearDescription'];
    yearHealth = json['YearHealth'];
    yearCareer = json['YearCareer'];
    yearLove = json['YearLove'];
    todayMoto = json['TodayMoto'];
    yearMoto = json['YearMoto'];
  }

  factory HomePageContent.fromError(int sign) {
    return HomePageContent(
        sign: sign.toString(),
        todayLove: "0",
        todayCareer: "0",
        todayHealth: "0",
        todayDescription: "The information for today isn't updated yet , check back later",
        yearDescription: "",
        yearHealth: "0",
        yearCareer: "0",
        yearLove: "0",
        todayMoto: "",
        yearMoto: "");
  }
}
