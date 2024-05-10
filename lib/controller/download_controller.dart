import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DownloadController extends GetxController {
  var progres = 0.0.obs;

  Future<void> downloadPDF(String pdfUrl, String fileName) async {
    var request = http.Request(
      'GET',
      Uri.parse(pdfUrl),
    );
    var response = await request.send();
    var contentLength = response.contentLength;

    if (response.statusCode == 200) {
      var dir = await getApplicationCacheDirectory();
      var file = File('${dir.path}/$fileName');
      var bytes = <int>[];

      response.stream.listen(
        (List<int> chunk) {
          bytes.addAll(chunk);
          var downloadLength = bytes.length;
          var progresPrecentage = (downloadLength / contentLength!) * 100;
          progres.value = progresPrecentage;
        },
        onDone: () async {
          await file.writeAsBytes(bytes);
          print('Direktori aplikasi: ${dir.path}');

          Get.snackbar('Download Selesai', 'Buku teleah berhasil di download');
        },
        onError: (error, StackTrace stackTrace) {
          // Menambahkan parameter StackTrace
          Get.snackbar('Error', 'Failed to download PDF: $error');
        },
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to download PDF: Server responded with status ${response.statusCode}',
      );
    }
  }
}
