class YearRespone {
  List<String> year = [];

  YearRespone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      year = <String>[];
      json['data'].forEach((v) {
        year.add(v);
      });
    }
  }
}
