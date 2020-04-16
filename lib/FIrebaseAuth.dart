import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<String> signIn({String email,String password})async{

    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;

}

Future<String> signUp({String email, String password}) async {

  AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;

}

Future<void> signOut()async{
  return _firebaseAuth.signOut();
}

Future<FirebaseUser> getCurrentUser()async{

  FirebaseUser user = await _firebaseAuth.currentUser();
  return user;
}

Future<void> resetPassword(String email) async {
  await _firebaseAuth.sendPasswordResetEmail(email: email);
}