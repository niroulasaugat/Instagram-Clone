import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final String username, description, postid,  posturl, uid, profileimg;
  final likes;
  final dateposted;

  Post({
    required this.username,
    required this.uid,
    required this.description,
    required this.postid,
    required this.dateposted,
    required this.posturl,
    required this.profileimg,
    required this.likes,
    // required this.following
  });

  Map<String, dynamic> posttoJson()=>{
    'username':username,
    'description':description,
    'uid': uid,
    'dateposted': dateposted,
    'posturl': posturl,
    'postid': postid,
    'profilepic': profileimg,
    'likes':likes
  
};

  static Post fromSnap(DocumentSnapshot newsnap){
  var snapshot =   newsnap.data() as Map<String, dynamic>;

  return Post(username: snapshot['username'], uid: snapshot['uid'], description: snapshot['description'],
   dateposted: snapshot['dateposted'], posturl: snapshot['posturl'], 
   postid: snapshot['postid'], profileimg: snapshot['profilepic'], likes: snapshot['likes']);


}
}