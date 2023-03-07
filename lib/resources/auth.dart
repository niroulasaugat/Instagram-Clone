// import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart' as model;
import 'storage.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

 Future<model.user> getUserDetails()async{
    // User newUser = _firebaseAuth.currentUser!;
   User newuser = _firebaseAuth.currentUser!;

   DocumentSnapshot snapshot = await _fireStore.collection('Users').doc(newuser.uid).get();

   return model.user.fromSnap(snapshot);
   

  }

  Future<String> signUPUser(String name, String email, String password,
      String bio, Uint8List file) async {
    String res = 'Some Error Occured';
    // return res
    try {
      if (name.isNotEmpty ||
          password.isNotEmpty ||
          email.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        print((cred.user!.uid));
        String imageurl =
            await StorageMethods().uploadImageToStorage('Profile-Pic', file, false);

        model.user user = model.user(
            name: name,
            uid: cred.user!.uid,
            bio: bio,
            email: email,
            password: password,
            imageurl: imageurl,
            followers: [],
            following: []
            );

        _fireStore
            .collection('Users')
            .doc(cred.user!.uid)
            .set(user.usertoJson());
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(String email, String password) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
