class Musteri {
  String id;
  String adSoyad;
  String telefon;
  String adres;
  String vergiDairesi;
  String vergiNo;
  String eMail;

  Musteri(String id, String adSoyad, String telefon, String adres,
      String vergiDairesi, String vergiNo, String eMail) {
    this.id = id;
    this.adSoyad = adSoyad;
    this.telefon = telefon;
    this.adres = adres;
    this.vergiDairesi = vergiDairesi;
    this.vergiNo = vergiNo;
    this.eMail = eMail;
  }

  Musteri.fromJson(Map json) {
    id = json["Id"];
    adSoyad = json["AdSoyad"];
    telefon = json["Telefon"];
    adres = json["Adres"];
    vergiDairesi = json["VergiDairesi"];
    vergiNo = json["VergiNo"];
    eMail = json["Email"];
  }

  Map toJson() {
    return {
      "Id": id,
      "AdSoyad": adSoyad,
      "Telefon": telefon,
      "Adres": adres,
      "VergiDairesi": vergiDairesi,
      "VergiNo": vergiNo,
      "Email": eMail
    };
  }
}
