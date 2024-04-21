import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  //sign up
  Future<UserCredential>signUpWithEmailPassword(String email, password, name, phone, location) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      String userUid = userCredential.user!.uid;

      await _usersCollection.doc(email).set({
        'email': email,
        'name': name,
        'phone': phone,
        'location': location,
        'uid': userUid,
      });

      return userCredential;
    } on  FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //sign in
  Future<UserCredential>signInWithEmailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on  FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //check email
  Future<bool> isEmailAlreadyRegistered(String email) async {
    final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot =
    await usersCollection.where('email', isEqualTo: email).get();

    return querySnapshot.docs.isNotEmpty;
  }


  //sign out
  Future<void> signOut()async{
    return await _auth.signOut();
  }

  //fetch user data
  Future<Map<String, dynamic>> getUserData(String email) async {
    try {
      DocumentSnapshot userSnapshot =
      await _usersCollection.doc(email).get();

      if (userSnapshot.exists) {
        return userSnapshot.data() as Map<String, dynamic>;
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  //current user
  Future<String?> getCurrentUserEmail() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        return user.email;
      }

      return null; // User is not logged in
    } catch (e) {
      print('Error getting current user email: $e');
      return null;
    }
  }

//errors

}