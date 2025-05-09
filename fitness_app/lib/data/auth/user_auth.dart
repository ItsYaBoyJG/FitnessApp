import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? getUserId() {
    return _firebaseAuth.currentUser!.uid;
  }

  void userSignIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  void registerUser(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
