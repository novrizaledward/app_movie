class MetaModel {
  int? currentPage;
  int? lastPage;
  int? perPage;

  MetaModel({this.currentPage, this.lastPage, this.perPage});

  MetaModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
  }
}
