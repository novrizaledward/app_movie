import 'package:app_movie/src/data/models/info_eps_model.dart';

class EpsDetailRespone {
  EpsDetailModel? data;

  EpsDetailRespone({this.data});

  EpsDetailRespone.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? EpsDetailModel.fromJson(json['data']) : null;
  }
}

class EpsDetailModel {
  InfoEpsModel? info;

  EpsDetailModel({this.info});

  EpsDetailModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? InfoEpsModel.fromJson(json['info']) : null;
  }
}
