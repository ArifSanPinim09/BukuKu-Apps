import 'package:book_store_apps/model/buku_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<BukuModel>> search(String query) {
    return _firestore
        .collection('Book')
        .where('judul', isGreaterThanOrEqualTo: query)
        .where('judul', isLessThan: '$query\uf8ff')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => BukuModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
