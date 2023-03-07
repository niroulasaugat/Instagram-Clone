import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insatclone/utils/colors.dart';
import 'package:insatclone/widgets/postcard.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Instagram', style: TextStyle(color: primaryColor, fontSize: 20),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline, color: primaryColor,))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: primaryColor,));
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index)=> postCard(newsnap: 
            snapshot.data!.docs[index].data()
            )
            
            );
          // return postCard()
        }),
    );
    
  }
}