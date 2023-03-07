import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insatclone/screens/signupscreen.dart';
import 'package:insatclone/utils/colors.dart';
import 'package:insatclone/widgets/textfieldinput.dart';
import '../widgets/button.dart';
import '../resources/auth.dart';
import '../utils/imagesource.dart';
// import './homescreen.dart';
import '../responsive/responsive_screen.dart';
import '../responsive/web_layout.dart';
import '../responsive/mob_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   bool _isLoading = false;

   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  void onPressedLogin() async{
    setState(() {
      _isLoading = true;
    });
  String res = await  AuthMethods().loginUser(_emailController.text, _passwordController.text);

  if(res == 'success'){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
     Responsivelayout(webscreenlayout: WebScreenLayout(), mobscreenlayout: MobScreenLayout()),));
    

    setState(() {
      _isLoading = false;
    });

  }
  else{
    setState(() {
      _isLoading = true;
    });
    showSnackbar(context, res);
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      
      backgroundColor: mobileBackgroundColor,
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://1000logos.net/wp-content/uploads/2017/02/Instagram-Logo-2010-2011.png'))
                    ),
                  ),
                ],
              ),
              TextFieldInput(textEditingController: _emailController, hintText: 'Enter Email', textInputType: TextInputType.name),
              SizedBox(height: 20,),
              TextFieldInput(textEditingController: _passwordController, hintText: 'Enter Password', textInputType: TextInputType.number, isPass: true,),
              SizedBox(height: 30,),
              //  TextFieldInput(textEditingController: _passwordController, hintText: 'Enter Password', textInputType: TextInputType.number, isPass: true,),
              InkWell(
                onTap: onPressedLogin,
                child: newbutton(context, _isLoading? 'Loading': 'Log In')),
               SizedBox(height: 15,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Dont have an account?', style: TextStyle(color: primaryColor, fontSize: 18),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen()
                        ),
                      ),
                      child: Container(
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold, color: primaryColor
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ],
                ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}

