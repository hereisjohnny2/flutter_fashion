import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();
  bool isLoading = false;

  static User of(BuildContext context) {
    return ScopedModel.of<User>(context);
  }

  @override
  void addListener(listener) {
    super.addListener(listener);
    _loadUserData();
  }

  void signUp({
    @required Map<String, dynamic> userData,
    @required String password,
    @required VoidCallback onSuccess,
    @required VoidCallback onFailed,
  }) async {
    _invertLoadingState();
    try {
      firebaseUser = await _auth.createUserWithEmailAndPassword(
        email: userData['email'],
        password: password,
      );

      await _saveUserData(userData);

      onSuccess();
      _invertLoadingState();
    } catch (e) {
      onFailed();
      _invertLoadingState();
    }
  }

  void signIn({
    @required String email,
    @required String password,
    @required VoidCallback onSuccess,
    @required VoidCallback onFailed,
  }) async {
    _invertLoadingState();
    try {
      firebaseUser = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _loadUserData();
      onSuccess();
      _invertLoadingState();
    } catch (e) {
      onFailed();
      _invertLoadingState();
    }
  }

  void signOut() async {
    _invertLoadingState();
    await _auth.signOut();
    userData = Map();
    firebaseUser = null;
    _invertLoadingState();
  }

  void recoveryPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData(userData);
  }

  Future<Null> _loadUserData() async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser();
    }
    if (userData['name'] == null) {
      DocumentSnapshot document = await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get();
      userData = document.data;
    }
    notifyListeners();
  }

  void _invertLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
