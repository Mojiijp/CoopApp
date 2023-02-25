class Menu {
  String nameEng;
  String nameTH;
  String image;
  // String ingredients;
  // String recipe;
  double calories;
  bool isliked;
  bool isSelected;
  String category;

  Menu(
    {
      required this.nameEng,
      required this.nameTH,
      required this.image,
      // required this.ingredients,
      // required this.recipe,
      required this.calories,
      required this.isliked,
      this.isSelected = false,
      required this.category,
    }
  );
}
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Menu {
//   final String nameEng;
//   final String nameTH;
//   final double calories;
//
//   final DocumentReference reference;
//
//   Menu.fromMap(Map<String, dynamic> map, {required this.reference})
//       : assert(map['nameEng'] != null),
//         assert(map['nameTH'] != null),
//         assert(map['calories'] != null),
//         nameEng = map['nameEng'],
//         nameTH = map['nameTH'],
//         calories = map['calories'];
//
//   Menu.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data as Map<String, dynamic>, reference: snapshot.reference);
//
//   @override
//   String toString() => "Menu<$nameEng:$nameTH:$calories>";
// }
