import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> PickImage() async{
try{
final xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
if (xFile!=null){
  return File(xFile.path);
}
return null;

}
catch(e){
  print("catch");

  return null;
}
}