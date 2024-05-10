import 'package:book_store_apps/model/buku_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetBookByCategory extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<BukuModel> books = <BukuModel>[].obs;
  var bookData = RxList<BukuModel>();
  RxBool isCategoriesLoaded = false.obs;

  RxList<String> categories = <String>[].obs; // List to store categories
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    showAllBooks();
    super.onInit();
  }

  Future<void> getBooksByCategory(String category) async {
    isLoading.value = true; // Set isLoading to true before loading data
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('Book')
          .where('category', isEqualTo: category)
          .get();

      books.value = querySnapshot.docs
          .map((doc) => BukuModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      // Handle error if any
    } finally {
      isLoading.value = false; // Set isLoading back to false after loading
    }
  }

  Future<void> showAllBooks() async {
    // Show all books regardless of category
    try {
      isLoading.value = true;
      QuerySnapshot querySnapshot = await _firestore.collection('Book').get();

      books.value = querySnapshot.docs
          .map((doc) => BukuModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }
}
