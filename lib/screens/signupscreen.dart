import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insatclone/utils/colors.dart';
import '../widgets/textfieldinput.dart';
import '../widgets/button.dart';
import '../resources/auth.dart';
import '../utils/imagesource.dart';
import 'package:image_picker/image_picker.dart';
import '../responsive/responsive_screen.dart';
import '../responsive/web_layout.dart';
import '../responsive/mob_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  Uint8List? _img;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUPUser(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _bioController.text,
        _img!);

        if(res == 'success'){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
     Responsivelayout(webscreenlayout: WebScreenLayout(), mobscreenlayout: MobScreenLayout()),));
          
        }

       setState(() {
        _isLoading = false;
      });

    if (res != 'success') {
      showSnackbar(context, res);

     
    }
  }

  void onselectImage() async {
    Uint8List newImg = await getImage(ImageSource.gallery);
    setState(() {
      _img = newImg;
    });
    //  Uint8List newimg = await getImage(ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      backgroundColor: mobileBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Stack(
                children: [
                  _img != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_img!)
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg'),
                        ),
                  Positioned(
                      left: 80,
                      bottom: -10,
                      child: IconButton(
                          onPressed: onselectImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            color: primaryColor,
                          )))
                ],
              ),
              SizedBox(
                height: 25,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 200,
              //       width: 200,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(image: NetworkImage('https://1000logos.net/wp-content/uploads/2017/02/Instagram-Logo-2010-2011.png'))
              //       ),
              //     ),
              //   ],
              // ),
              TextFieldInput(
                  textEditingController: _nameController,
                  hintText: 'Enter User Name',
                  textInputType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter Email',
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter Password',
                textInputType: TextInputType.number,
                isPass: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: 'Enter Bio',
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: signUpUser,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    // width: 2000,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : Center(
                            child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                  )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget newbutton(BuildContext context, String title, bool _isLoading) {
//   return Container(
//     padding: EdgeInsets.all(12),
//     // width: 2000,
//     decoration: BoxDecoration(
//       color: blueColor,
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//     ),
//     child: Center(
//         child: Text(
//       title,
//       style: TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//     )),
//   );
// }
