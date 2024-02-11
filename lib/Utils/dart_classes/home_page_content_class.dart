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
      {this.sign,
      this.todayLove,
      this.todayCareer,
      this.todayHealth,
      this.todayDescription,
      this.yearDescription,
      this.yearHealth,
      this.yearCareer,
      this.yearLove,
      this.todayMoto,
      this.yearMoto});

  HomePageContent.fromJson(Map<String, dynamic> json) {
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
}
