import 'dart:io';
import 'dart:typed_data';
import 'package:book_store_apps/common/message/message.dart';
import 'package:book_store_apps/model/buku_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class BookCreateController extends GetxController {
  TextEditingController judul = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController bahasa = TextEditingController();
  TextEditingController penulis = TextEditingController();
  TextEditingController format = TextEditingController();
  TextEditingController penerbit = TextEditingController();
  TextEditingController taggalTerbit = TextEditingController();
  TextEditingController halaman = TextEditingController();
  final storage = FirebaseStorage.instance;
  RxBool isImageUploading = false.obs;
  RxBool isPostUploading = true.obs;
  ImagePicker imagePicker = ImagePicker();
  RxString imageUrl = "".obs;
  RxString pdfUrl = "".obs;
  var bookData = RxList<BukuModel>();
  var db = FirebaseFirestore.instance;
  final fAuth = FirebaseAuth.instance;
  int index = 0;
  RxBool isPdfUploading = false.obs;
  List bookList = List.empty(growable: true).obs;
  List searchList = List.empty(growable: true).obs;
  var currentUserBooks = RxList<BukuModel>();
  // Future<LisResult> futureFiles;
  @override
  void onInit() {
    super.onInit();
    getAllBook();
  }

  void getAllBook() async {
    final books = await db.collection("Book").get();
    for (var book in books.docs) {
      bookData.add(BukuModel.fromJson(book.data()));
    }
  }

  void downloadPDF(String pdfUrl) async {
    var response = await http.get(Uri.parse(pdfUrl));
    var documentDirectory = await getApplicationDocumentsDirectory();
    var filePath = '${documentDirectory.path}/Pdf/';
    File pdfFile = File(filePath);
    pdfFile.writeAsBytesSync(response.bodyBytes, flush: true);
    successMessage("PDF berhasil diunduh");
  }

  void getUserBook() async {
    currentUserBooks.clear();
    var books = await db
        .collection("userBook")
        .doc(fAuth.currentUser!.uid)
        .collection("Books")
        .get();
    for (var book in books.docs) {
      currentUserBooks.add(BukuModel.fromJson(book.data()));
    }
  }

  void pickImage() async {
    isImageUploading.value = true;
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      uploadImageToFirebase(File(image.path));
    }
    isImageUploading.value = false;
  }

  void uploadImageToFirebase(File image) async {
    var uuid = const Uuid();
    var filename = uuid.v1();
    var storageRef = storage.ref().child("Images/$filename");
    var response = await storageRef.putFile(image);
    String downloadURL = await storageRef.getDownloadURL();
    imageUrl.value = downloadURL;
    print("Download URL: $downloadURL");
    isImageUploading.value = false;
  }

  void createBook() async {
    var db = FirebaseFirestore.instance;
    isPostUploading.value = true;
    var currentUser = FirebaseAuth.instance.currentUser;
    var createBook = BukuModel(
      id: index++,
      judul: judul.text,
      category: category.text,
      deskripsi: deskripsi.text,
      penulis: penulis.text,
      penerbit: penerbit.text,
      bahasa: bahasa.text,
      price: int.parse(price.text),
      rating: double.parse(rating.text),
      format: format.text,
      taggalTerbit: taggalTerbit.text,
      coverUrl: imageUrl.value,
      halaman: halaman.text,
      userId: currentUser!.uid,
      pdfUrl: pdfUrl.value,
    );

    await db.collection("Book").add(createBook.toJson());

    isPostUploading.value = false;
    judul.clear();
    deskripsi.clear();
    category.clear();
    price.clear();
    rating.clear();
    bahasa.clear();
    penulis.clear();
    format.clear();
    penerbit.clear();
    taggalTerbit.clear();
    halaman.clear();
    imageUrl.value = "";
    pdfUrl.value = "";
    successMessage("Buku Berhasil Ditambahkan");
    getAllBook();
  }

  void pickPDF() async {
    isPdfUploading.value = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.first.path!);

      if (file.existsSync()) {
        Uint8List fileBytes = await file.readAsBytes();
        String fileName = result.files.first.name;
        print("File Bytes: $fileBytes");

        final response =
            await storage.ref().child("Pdf/$fileName").putData(fileBytes);

        final downloadURL = await response.ref.getDownloadURL();
        pdfUrl.value = downloadURL;
      } else {
        print("File does not exist");
      }
    } else {
      print("No file selected");
    }
    isPdfUploading.value = false;
  }

  void searchBook(String query) {
    db.collection("Book").where("judul", isEqualTo: query).get().then(
          (value) => searchList.assignAll(
            value.docs.map(
              (doc) => BukuModel.fromJson(
                doc.data(),
              ),
            ),
          ),
        );
  }
}
