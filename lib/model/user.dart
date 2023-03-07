import 'package:cloud_firestore/cloud_firestore.dart';

class user{
  final String name, bio, email, password, imageurl, uid;
  final List followers, following;


  user({
    required this.name,
    required this.uid,
    required this.bio,
    required this.email,
    required this.password,
    required this.imageurl,
    required this.followers,
    required this.following
  });

  Map<String, dynamic> usertoJson()=>{
    'name':name,
    'Bio':bio,
    'email': email,
    'password': password,
    'imageurl': imageurl,
    'followers': followers,
    'following': following,
    'uid':uid
  
};

  static user fromSnap(DocumentSnapshot newsnap){
  var snapshot =   newsnap.data() as Map<String, dynamic>;

  return user(name: snapshot['name'], uid: snapshot['uid'], bio: snapshot['Bio'], email: snapshot['email'],
   password: snapshot['password'], 
   imageurl: snapshot['imageurl'], followers: snapshot['followers'], following: snapshot['following']);


}
}