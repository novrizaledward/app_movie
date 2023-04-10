// import 'package:app_movie/src/domain/entities/movie_entity.dart';

// import 'meta_model.dart';

// class ByYearRespone {
//   List<ByYearModel>? itemByYear = [];
//   MetaModel? meta;

//   ByYearRespone({this.itemByYear, this.meta});

//   ByYearRespone.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       itemByYear = <ByYearModel>[];
//       json['data'].forEach((v) {
//         itemByYear!.add(ByYearModel.fromJson(v));
//       });
//     }
//     meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
//   }
// }

// class ByYearModel extends MovieEntity {
//   const ByYearModel(
//       {required String? title,
//       required String? release,
//       required String? quality,
//       required String? slug,
//       required String? image})
//       : super(
//             title: title,
//             release: release,
//             quality: quality,
//             slug: slug,
//             image: image);

//   ByYearModel.fromJson(Map<String, dynamic> json)
//       : super(
//           title: json['title'],
//           release: json['release'],
//           quality: json['quality'],
//           slug: json['slug'],
//           image: json['image'],
//         );
// }
