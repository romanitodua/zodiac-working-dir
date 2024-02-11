class CompatibilityResult {
  String? firstSign;
  String? secondSign;
  String? relationshipsPerc;
  String? careerWorkPerc;
  String? marriagePerc;
  String? friendshipPerc;
  String? relationshipDisc;
  String? careerWorkDisc;
  String? marriageDisc;
  String? friendshipDisc;

  CompatibilityResult(
      {this.firstSign,
      this.secondSign,
      this.relationshipsPerc,
      this.careerWorkPerc,
      this.marriagePerc,
      this.friendshipPerc,
      this.relationshipDisc,
      this.careerWorkDisc,
      this.marriageDisc,
      this.friendshipDisc});

  CompatibilityResult.fromJson(Map<String, dynamic> json) {
    firstSign = json['first_sign'];
    secondSign = json['second_sign'];
    relationshipsPerc = json['relationships_perc'];
    careerWorkPerc = json['career_work_perc'];
    marriagePerc = json['marriage_perc'];
    friendshipPerc = json['friendship_perc'];
    relationshipDisc = json['relationship_disc'];
    careerWorkDisc = json['career_work_disc'];
    marriageDisc = json['marriage_disc'];
    friendshipDisc = json['friendship_disc'];
  }

}
