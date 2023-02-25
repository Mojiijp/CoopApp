import 'package:cloud_firestore/cloud_firestore.dart';

class ScanlistModel {
  final Timestamp crateAt;
  final String image;


  const ScanlistModel({
    required this.crateAt,
    required this.image,
  });

  toJson() {
    return {
      "crateAt" : crateAt,
      "image" : image
    };
  }

  /////Map user fetch from firebase
  factory ScanlistModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ScanlistModel (
        crateAt : data["crateAt"],
        image: data["image"]
    );
  }
}