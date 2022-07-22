import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserRepository({required this.firebaseAuth});

  //sign up with email and password

  Future<void> signUp(String email, String password) async{
    try {
      var auth = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }
  //sign in with email and password
   Future<void> signIn(String email, String password) async{
    try {
      var auth = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  // sign out 
   Future<void> signOut() async{
    await firebaseAuth.signOut();
  }

  //check sign in
   Future<bool> isSignedIn() async{
    var currentUser = await firebaseAuth.currentUser;
    return currentUser != null;
  }

  //get current user
   Future<FirebaseAuth> getUser() async{
    return await firebaseAuth;
  }
}