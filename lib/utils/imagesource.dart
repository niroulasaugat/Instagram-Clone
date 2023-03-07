import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

 getImage(ImageSource sour)async{
  final ImagePicker _image = ImagePicker();
 XFile? _file = await _image.pickImage(source: sour);

if(_file != null){
  return await _file.readAsBytes();
}

}

showSnackbar(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}