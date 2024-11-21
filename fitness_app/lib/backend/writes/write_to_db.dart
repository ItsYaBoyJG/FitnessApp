import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/user.dart';

class WriteToDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void saveUserData(UserProfile user) {
    _firebaseFirestore.collection('users').doc(user.id).set(user.toJson());
  }

  void updateUserData(UserProfile user) {
    _firebaseFirestore.collection('users').doc(user.id).update(user.toJson());
  }

  void deleteUserData(String id) {
    _firebaseFirestore.collection('users').doc(id).delete();
  }

  addUserToFriendsList(String id, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(id)
        .collection('friends')
        .doc(name)
        .set({});
  }

  addUserToFollowingList(String id, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(id)
        .collection('friends')
        .doc(name)
        .set({});
  }
}
