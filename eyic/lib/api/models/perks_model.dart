import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerksModel {
  String id;
  String companyName;
  String description;
  String tagline;
  String link;
  String offerDetails;
  String imageUrl;

  PerksModel({
    required this.id,
    required this.companyName,
    required this.description,
    required this.tagline,
    required this.link,
    required this.offerDetails,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyName': companyName,
      'description': description,
      'tagline': tagline,
      'link': link,
      'offerDetails': offerDetails,
      'imageUrl': imageUrl,
    };
  }

  factory PerksModel.fromMap(Map<String, dynamic> map) {
    return PerksModel(
      id: map['id'] as String,
      companyName: map['companyName'] as String,
      description: map['description'] as String,
      tagline: map['tagline'] as String,
      link: map['link'] as String,
      offerDetails: map['offerDetails'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerksModel.fromJson(String source) =>
      PerksModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
