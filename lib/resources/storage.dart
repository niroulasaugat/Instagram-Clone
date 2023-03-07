import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class StorageMethods{
  

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

 Future<String> uploadImageToStorage(String childname, Uint8List file, bool ispost) async{
   Reference ref = _storage.ref(childname).child(_auth.currentUser!.uid);
   String postid =Uuid().v1();


   if(ispost){
    ref = ref.child(postid);
   }
   UploadTask task = ref.putData(file);
   TaskSnapshot snap =  await task;
  String newurl =await snap.ref.getDownloadURL();
   return newurl;
  }
}