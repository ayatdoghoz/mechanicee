import "dart:io";

import "package:image_picker/image_picker.dart";

imageUpload(ImageSource source) async {
  final XFile? file = await ImagePicker().pickImage(source: source);

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}



// fileUploadGallery(){
//   FilePickerResult? result = await FilePicker.platform.pickFiels(
// type : FileType
//   )

//   if(result != null){
//     return File(result.files.single.path!);
//   }
//   else{
//     return null;
//   }
// }