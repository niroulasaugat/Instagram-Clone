import 'package:flutter/material.dart';
import 'package:insatclone/provider/userprovider.dart';
import '../utils/dimension.dart';
import 'package:provider/provider.dart';


class Responsivelayout extends StatefulWidget {
  final Widget webscreenlayout;
  final Widget mobscreenlayout;
  const Responsivelayout({ Key? key, required this.webscreenlayout, required this.mobscreenlayout}) : super(key: key);

  @override
  State<Responsivelayout> createState() => _ResponsivelayoutState();
}

class _ResponsivelayoutState extends State<Responsivelayout> {
  

  adddata()async{
  UserProvider _userprovider =  await Provider.of<UserProvider>(context,listen: false);
  _userprovider.refreshUser();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adddata();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints)
      {
        if(constraints.maxWidth>webscreensze){
         return widget.webscreenlayout;
          //webscreen
        }
        else{
         return widget.mobscreenlayout;
          //mobscreen
        }
      }

      
    );
  }
}