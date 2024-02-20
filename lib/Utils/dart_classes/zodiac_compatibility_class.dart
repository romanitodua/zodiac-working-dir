class ZodiacCompatibilityTemp {
  final int secondSign;
  final String friendshipPerc;
  final String friendshipDesc;
  final String marriagePerc;
  final String marriageDesc;
  final String careerWorkDesc;
  final String careerWorkPerc;
  final String relationshipPerc;
  final String relationshipDesc;

  ZodiacCompatibilityTemp({
    required this.secondSign,
    required this.friendshipPerc,
    required this.friendshipDesc,
    required this.marriagePerc,
    required this.marriageDesc,
    required this.careerWorkDesc,
    required this.careerWorkPerc,
    required this.relationshipPerc,
    required this.relationshipDesc,
  });

  factory ZodiacCompatibilityTemp.fromJson(Map<String, dynamic> json) {
    return ZodiacCompatibilityTemp(
      secondSign: json['second_sign'],
      friendshipPerc: json['friendship_perc'],
      friendshipDesc: json['friendship_desc'],
      marriagePerc: json['marriage_perc'],
      marriageDesc: json['marriage_desc'],
      careerWorkDesc: json['careerWork_desc'],
      careerWorkPerc: json['careerWork_perc'],
      relationshipPerc: json['relationship_perc'],
      relationshipDesc: json['relationship_desc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'second_sign': secondSign,
      'friendship_perc': friendshipPerc,
      'friendship_desc': friendshipDesc,
      'marriage_perc': marriagePerc,
      'marriage_desc': marriageDesc,
      'careerWork_desc': careerWorkDesc,
      'careerWork_perc': careerWorkPerc,
      'relationship_perc': relationshipPerc,
      'relationship_desc': relationshipDesc,
    };
  }

  Map<int, List<ZodiacCompatibilityTemp>> compatibilityData(jsonMap) {
    Map<int, List<ZodiacCompatibilityTemp>> zodiacDataMap = jsonMap.map(
        (key, value) => MapEntry(
            int.parse(key),
            List<Map<String, dynamic>>.from(value)
                .map((e) => ZodiacCompatibilityTemp.fromJson(e))
                .toList()));

    return zodiacDataMap;
  }
}
