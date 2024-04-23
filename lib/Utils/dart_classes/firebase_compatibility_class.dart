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
    friendshipDesc = json['FriendshipDisc'];
    friendshipPerc = json['FriendshipPerc'];
    relationshipDesc = json['RelationshipDisc'];
    careerWorkPerc = json['CareerWorkPerc'];
    marriagePerc = json['MarriagePerc'];
    marriageDesc = json['MarriageDisc'];
    careerWorkDesc = json['CareerWorkDisc'];
    relationshipPerc = json['RelationshipPerc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FriendshipDisc'] = friendshipDesc;
    data['FriendshipPerc'] = friendshipPerc;
    data['RelationshipDisc'] = relationshipDesc;
    data['CareerWorkPerc'] = careerWorkPerc;
    data['MarriagePerc'] = marriagePerc;
    data['MarriageDisc'] = marriageDesc;
    data['CareerWorkDisc'] = careerWorkDesc;
    data['RelationshipPerc'] = relationshipPerc;
    return data;
  }
}

