import 'package:book_store_apps/model/buku_model.dart';
import 'package:get/get.dart';
import '../repository/search_repository.dart';

class SearchControllers extends GetxController {
  final SearchRepository _repository = SearchRepository();
  final RxList<BukuModel> _searchResults = RxList<BukuModel>([]);

  List<BukuModel> get searchResults => _searchResults.value;

  search(String query) async {
    try {
      _searchResults.value = await _repository.search(query).first;
    } catch (e) {
      print(e);
    }
  }
}
