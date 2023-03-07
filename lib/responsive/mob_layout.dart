import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../resources/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insatclone/model/user.dart';
import 'package:insatclone/provider/userprovider.dart';
import 'package:insatclone/utils/colors.dart';
import 'package:insatclone/utils/dimension.dart';
import 'package:provider/provider.dart';
import '../model/user.dart' as model;

class MobScreenLayout extends StatefulWidget {
  const MobScreenLayout({ Key? key }) : super(key: key);

  @override
  State<MobScreenLayout> createState() => _MobScreenLayoutState();
}

class _MobScreenLayoutState extends State<MobScreenLayout> {
  // String username = '';

  

//   getUserDetais() async{
//  DocumentSnapshot snap = await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();
//     setState(() {
//       username = (snap.data() as Map<String, dynamic>)['name'];
//     });
//   }

//   @override
//   void initState() {
//     getUserDetais();
//     // TODO: implement initState
//     super.initState();
//   }

  // @override
  // Widget build(BuildContext context){
  //  model.user? refresheduser  =  Provider.of<UserProvider>(context).getuser;
  //   return Scaffold(
  //     body: refresheduser== null? Center(child: CircularProgressIndicator()): Center(child: Text(refresheduser.uid),),
      
  //   );
  // }


 int _currentIndex = 0;
  final tabs = homescreenitems;
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: tabs[_currentIndex],
      
      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        backgroundColor: mobileBackgroundColor,
        selectedFontSize: 16,
        unselectedFontSize:12,
        
        
        // backgroundColor: Theme.of(context).primaryColor,
        // backgroundColor: Color.fromARGB(107, 30, 2, 59),

        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '', ),
           BottomNavigationBarItem(icon: Icon(Icons.search), label: '', ),
            BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: '', ),
             BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '', ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '', ),
        ],
        onTap: ((value) {
          setState(() {
          _currentIndex = value;
          });
          
        }),
        
        ),
    );
  }
}