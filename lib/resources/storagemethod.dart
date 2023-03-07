
import 'dart:typed_data';

import 'package:insatclone/model/post.dart';
import 'package:insatclone/resources/storage.dart';
import 'package:uuid/uuid.dart';
import '../resources/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class firebaseStorage{
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> postImage( Uint8List _file, String username, String description, String uid, String profileimg )async{
    String res = "some Error Occured";
   
    try{
      //uploadto storage
    String photourl = await  StorageMethods().uploadImageToStorage('Posts', _file, true);
  String postid =  Uuid().v1();

    Post post = Post(username: username, uid: uid, description: description, postid: postid, dateposted: DateTime.now(),
     posturl: photourl , profileimg: profileimg, likes: []);


     //upload to firebase;
     _fireStore.collection('posts').doc(postid).set(post.posttoJson());

     res = 'success';




    }catch(e){
      res = e.toString();
    }
    return res;

  }
}