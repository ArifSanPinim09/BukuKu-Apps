// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BukuModel {
  final String userId;
  final int? id;
  final String? judul;
  final String? deskripsi;
  final String? category;
  final int? price;
  final double? rating;
  final String? bahasa;
  final String? penulis;
  final String? format;
  final String? penerbit;
  final String? taggalTerbit;
  final String? coverUrl;
  final String? halaman;
  final String? pdfUrl;

  BukuModel({
    required this.userId,
    this.id,
    this.judul,
    this.deskripsi,
    this.category,
    this.price,
    this.rating,
    this.bahasa,
    this.penulis,
    this.format,
    this.penerbit,
    this.taggalTerbit,
    this.coverUrl,
    this.halaman,
    this.pdfUrl,
  });

  factory BukuModel.fromRawJson(String str) =>
      BukuModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BukuModel.fromJson(Map<String, dynamic> json) => BukuModel(
        userId: json["user_id"],
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        category: json["category"],
        price: json["price"],
        rating: json["rating"],
        bahasa: json["bahasa"],
        penulis: json["penulis"],
        format: json["format"],
        penerbit: json["penerbit"],
        taggalTerbit: json["taggal_terbit"],
        coverUrl: json["cover_url"],
        halaman: json["halaman"],
        pdfUrl: json["pdf_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "category": category,
        "price": price,
        "rating": rating,
        "bahasa": bahasa,
        "penulis": penulis,
        "format": format,
        "penerbit": penerbit,
        "taggal_terbit": taggalTerbit,
        "cover_url": coverUrl,
        "halaman": halaman,
        "pdf_url": pdfUrl,
      };
}
