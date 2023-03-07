import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insatclone/provider/userprovider.dart';
import 'package:insatclone/responsive/mob_layout.dart';
import 'package:insatclone/responsive/responsive_screen.dart';
import 'package:insatclone/responsive/web_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insatclone/screens/loginscreen.dart';
import 'package:insatclone/screens/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCzu_nKLRCz2L9911ilCAM6wQIJhb9COfY',
         appId: '1:668040891241:web:322181c933d8be7cff0bf8', 
         messagingSenderId: '668040891241',
          projectId: 'insta-clone-c818c', 
         storageBucket: 'insta-clone-c818c.appspot.com')
    );

  }else
  await Firebase .initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProvider())
      ],
      child: MaterialApp(
        
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return Responsivelayout(webscreenlayout: WebScreenLayout(), mobscreenlayout: MobScreenLayout());
              }
              else if(snapshot.hasError){
                return Center(child: Text('${snapshot.error}'),);
              }
            }
            else if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator( color: primaryColor,);
            }
            return LoginScreen();
          })
        
         
      ),
    );
  }
}
