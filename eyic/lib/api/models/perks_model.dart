import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerksModel {
  String companyName;
  String description;
  String tagline;
  String link;
  String offerDetails;

  PerksModel({
    required this.companyName,
    required this.description,
    required this.tagline,
    required this.offerDetails,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'description': description,
      'tagline': tagline,
      'offerDetails': offerDetails,
      'link': link,
    };
  }

  factory PerksModel.fromMap(Map<String, dynamic> map) {
    return PerksModel(
      companyName: map['companyName'] as String,
      tagline: map['tagline'] as String,
      offerDetails: map['offerDetails'] as String,
      description: map['description'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerksModel.fromJson(String source) =>
      PerksModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
