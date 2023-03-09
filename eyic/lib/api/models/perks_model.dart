import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerksModel {
  String companyName;
  String description;
  String tagline;
  String link;
  String offerdetails;

  PerksModel({
    required this.companyName,
    required this.description,
    required this.tagline,
    required this.offerdetails,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Company Name': companyName,
      'Description': description,
      'Tagline': tagline,
      'Offer Details': offerdetails ,
      'link': link,
    };
  }

  factory PerksModel.fromMap(Map<String, dynamic> map) {
    return PerksModel(
      companyName: map['companyName'] as String,
      tagline: map['tagline'] as String,
      offerdetails: map['offerdetails'] as String,
      description: map['description'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerksModel.fromJson(String source) =>
      PerksModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
