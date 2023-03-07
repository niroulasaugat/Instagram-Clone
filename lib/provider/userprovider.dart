
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:insatclone/resources/auth.dart';
import '../model/user.dart';

class UserProvider extends ChangeNotifier{
  final AuthMethods _authMethods = AuthMethods();

  user? _user;

  user? get getuser => _user;


  Future<void> refreshUser()async{
    final newuser = await _authMethods.getUserDetails();
    _user = newuser;
    notifyListeners();


  }

  

}