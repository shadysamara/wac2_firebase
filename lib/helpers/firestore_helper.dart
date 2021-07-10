// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:wac2_firebase/models/user_model.dart';

// class FirestoreHelper {
//   FirestoreHelper._();
//   static FirestoreHelper firestoreHelper = FirestoreHelper._();
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   addUserToFirestore(UserModel userModel) async {
//     // DocumentReference<Map<String, dynamic>> documentReference =
//     //     await firestore.collection('Users').add(userModel.toMap());
//     // print(documentReference.id);
//     firestore.collection('Users').doc(userModel.id).set(userModel.toMap());
//   }

//   updateUserInFirestore(Map map, String userId) async {
//     firestore.collection('Users').doc(userId).update({...map});
//   }

//   deleteUserFromFirestore(String id) async {
//     firestore.collection('Users').doc(id).delete();
//   }

//   Future<UserModel> getUserFromFirestore(String id) async {
//     DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
//         await firestore.collection('Users').doc(id).get();
//     return UserModel.fromDocumentSnapShot(documentSnapshot);
//   }
// }
