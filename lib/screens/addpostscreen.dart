import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insatclone/provider/userprovider.dart';
import 'package:insatclone/resources/storagemethod.dart';
import 'package:insatclone/utils/colors.dart';
import 'package:insatclone/utils/imagesource.dart';
import 'package:insatclone/widgets/postcard.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}


class _AddPostState extends State<AddPost> {
  TextEditingController _statusController = TextEditingController();

  Uint8List? _file;


 postImage( String username,String uid,String profileimg )async{
  try{
// 
    String res = await firebaseStorage().postImage(_file!, username, _statusController.text, uid, profileimg );
    // String res = await firebaseStorage().postImage(_file, username, description, uid, profileimg)

 if(res == 'success'){
  showSnackbar(context, 'The Image is Posted');
  
 }
 else{
  showSnackbar(context, res.toString());
 }
  } catch(e){
    showSnackbar(context, e.toString());
  }
  }

   _selectImage(BuildContext ctx) async{
    print('hi');
    print(_file);
  return showDialog(context: ctx, builder: (ctx){
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          padding: EdgeInsets.all(20),
          child: Text('Take a Photo'),
          onPressed: () async{
            Navigator.of(context).pop();
           Uint8List file = await getImage(ImageSource.camera);
           print(file);
           setState(() {
             _file = file;
             print(_file);
           });
          },

        ),
        SimpleDialogOption(
          padding: EdgeInsets.all(20),
          child: Text('Pick Image from Gallery'),
          onPressed: () async{
            Navigator.of(context).pop();
          Uint8List file = await getImage(ImageSource.gallery);
          print('0mg');
           print(file);
          setState(() {
            _file = file;
            print('newonmg');
            print(_file);
            
          });
          },

        ),
        SimpleDialogOption(
          padding: EdgeInsets.all(20),
          child: Text('Cancel'),
          onPressed: () async{
            Navigator.of(context).pop();
          },

        )

      ],
    );
  
  }
  );
  }
  @override
  void dispose() {
    _statusController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    
    

    
    user? _newuser = Provider.of<UserProvider>(context).getuser;
    if(_newuser == null){
      return Center(child: CircularProgressIndicator(color: Colors.white,),);

    }
    // print(_newuser.imageurl.toString());
    return Scaffold(
      
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: Center(child: IconButton(onPressed: (){
        
        }, icon: Icon(Icons.arrow_back_ios, color: primaryColor,))),
        title: Text('Posts', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),

        actions: [
          TextButton(onPressed: (){
              postImage(_newuser.name, _newuser.uid, _newuser.imageurl);

          }, child: Text('Posts', style: TextStyle(color: Colors.blueAccent, fontSize: 18),))
        ],

      ),
      // body: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo, color: primaryColor,)),),
      body:
      _file == null?  Center(child: IconButton(onPressed: ()=> _selectImage(context), icon: Icon(Icons.add_a_photo, color: primaryColor,))):
       Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _file !=null?  CircleAvatar(
                backgroundImage: NetworkImage(_newuser.imageurl),
                
                  // netw
                // backgroundImage: MemoryImage(_file!)
                
                
              ): CircleAvatar(),
              
              Container(
                // color: mobileSearchColor,
                // color: Colors.red,
                
                width: MediaQuery.of(context).size.width* 0.50,
                child: TextField(
                  controller: _statusController,
                  style: TextStyle(color: primaryColor),
                  // maxLines: 7,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: mobileSearchColor),
                    
                    hintText: 'Write a caption',
                    border: InputBorder.none,
                  ),
                ),
              ), 
              SizedBox(height: 45, width: 45, 
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(
                  image: MemoryImage(_file!,
                  ),
                  fit: BoxFit.cover
                  ))
              ),)

            ],
          ),
          Divider(),
          // postCard(),

          // SizedBox(height: 100,),
         



        ],
      )

    );
  }
}