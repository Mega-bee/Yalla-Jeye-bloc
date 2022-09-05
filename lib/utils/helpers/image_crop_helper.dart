

import 'package:image_picker/image_picker.dart';

class ImageCropHelper{

  static Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }
  static Future<XFile?> pickImageFromCamera() async {
    return await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 80,preferredCameraDevice:  CameraDevice.front);
  }
  /// Pick Image From Gallery and return a File
//   static Future<CroppedFile?> cropSelectedImage(String filePath) async {
//     ImageCropper imge = ImageCropper();
//     return await imge.cropImage(
//         sourcePath: filePath,
//         aspectRatioPresets: [
//           CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio3x2,
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.ratio4x3,
//           CropAspectRatioPreset.ratio16x9,
//         ],
// //        androidUiSettings: AndroidUiSettings(
// //            toolbarTitle: 'Edit photo',
// //            toolbarColor: Colors.brown.shade600,
// //            toolbarWidgetColor: Colors.white,
// //            initAspectRatio: CropAspectRatioPreset.original,
// //            lockAspectRatio: false),
// //        iosUiSettings: IOSUiSettings(
// //          minimumAspectRatio: 1.0,
// //        )
//     );
//   }
}

