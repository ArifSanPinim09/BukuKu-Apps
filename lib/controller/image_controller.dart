import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageController extends GetxController {
  ImagePicker imagePicker = ImagePicker();

  void pickImage() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var uuid = const Uuid();
      var fileName = uuid.v1();
      var response = FirebaseStorage.instance.ref().child("Image/$fileName");
      print(response.storage.ref().getDownloadURL());
    }
  }
}
