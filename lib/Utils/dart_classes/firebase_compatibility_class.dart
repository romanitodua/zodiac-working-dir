class FireBaseCompatibility {
  String? friendshipDesc;
  String? friendshipPerc;
  String? relationshipDesc;
  String? careerWorkPerc;
  String? marriagePerc;
  String? marriageDesc;
  String? careerWorkDesc;
  String? relationshipPerc;

  FireBaseCompatibility({required this.friendshipDesc,
    required this.friendshipPerc,
    required this.relationshipDesc,
    required this.careerWorkPerc,
    required this.marriagePerc,
    required this.marriageDesc,
    required this.careerWorkDesc,
    required this.relationshipPerc});


  factory FireBaseCompatibility.fromError(){
    return FireBaseCompatibility(friendshipDesc: "Error Occurred",
        friendshipPerc: "Error Occurred",
        relationshipDesc: "Error Occurred",
        careerWorkPerc: "Error Occurred",
        marriagePerc: "Error Occurred",
        marriageDesc: "Error Occurred",
        careerWorkDesc: "Error Occurred",
        relationshipPerc: "Error Occurred");
  }

  FireBaseCompatibility.fromFireBase(Map<String, dynamic> json) {
    friendshipDesc = json['friendship_desc'];
    friendshipPerc = json['friendship_perc'];
    relationshipDesc = json['relationship_desc'];
    careerWorkPerc = json['careerWork_perc'];
    marriagePerc = json['marriage_perc'];
    marriageDesc = json['marriage_desc'];
    careerWorkDesc = json['careerWork_desc'];
    relationshipPerc = json['relationship_perc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['friendship_desc'] = friendshipDesc;
    data['friendship_perc'] = friendshipPerc;
    data['relationship_desc'] = relationshipDesc;
    data['careerWork_perc'] = careerWorkPerc;
    data['marriage_perc'] = marriagePerc;
    data['marriage_desc'] = marriageDesc;
    data['careerWork_desc'] = careerWorkDesc;
    data['relationship_perc'] = relationshipPerc;
    return data;
  }
}

