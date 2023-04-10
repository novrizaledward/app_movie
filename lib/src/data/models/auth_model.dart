import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required bool? isOpen,
    required AdModel? ad,
    required SystemAdModel? systemAds,
    required SystemAppModel? systemApp,
  }) : super(
          isOpen: isOpen,
          ad: ad,
          systemAds: systemAds,
          systemApp: systemApp,
        );

  AuthModel.fromJson(Map<String, dynamic> json)
      : super(
          isOpen: json['isOpen'],
          ad: json['ad'] != null ? AdModel.fromJson(json['ad']) : null,
          systemAds: json['system_ads'] != null
              ? SystemAdModel.fromJson(json['system_ads'])
              : null,
          systemApp: json['system_app'] != null
              ? SystemAppModel.fromJson(json['system_app'])
              : null,
        );
}

class AdModel {
  final String? adActive;
  final int? adInterval;
  final AdmobModel? admob;
  final FanModel? fan;
  final ApplovinModel? applovin;

  const AdModel(
      {this.adActive, this.adInterval, this.admob, this.fan, this.applovin});

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      adActive: json['ad_active'],
      adInterval: json['ad_interval'],
      admob: json['admob'] != null ? AdmobModel.fromJson(json['admob']) : null,
      fan: json['fan'] != null ? FanModel.fromJson(json['fan']) : null,
      applovin: json['applovin'] != null
          ? ApplovinModel.fromJson(json['applovin'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_active'] = adActive;
    data['ad_interval'] = adInterval;
    if (admob != null) {
      data['admob'] = admob!.toJson();
    }
    if (fan != null) {
      data['fan'] = fan!.toJson();
    }
    if (applovin != null) {
      data['applovin'] = applovin!.toJson();
    }
    return data;
  }
}

class AdmobModel {
  BannerModel? banner;
  InterstitialModel? interstitial;
  NativeModel? nativeId;

  AdmobModel({this.banner, this.interstitial, this.nativeId});

  AdmobModel.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? BannerModel.fromJson(json['banner']) : null;
    interstitial = json['interstitial'] != null
        ? InterstitialModel.fromJson(json['interstitial'])
        : null;
    nativeId =
        json['native'] != null ? NativeModel.fromJson(json['native']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (interstitial != null) {
      data['interstitial'] = interstitial!.toJson();
    }
    if (nativeId != null) {
      data['native'] = nativeId!.toJson();
    }
    return data;
  }
}

class FanModel {
  BannerModel? banner;
  InterstitialModel? interstitial;
  NativeModel? nativeId;

  FanModel({this.banner, this.interstitial, this.nativeId});

  FanModel.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? BannerModel.fromJson(json['banner']) : null;
    interstitial = json['interstitial'] != null
        ? InterstitialModel.fromJson(json['interstitial'])
        : null;
    nativeId =
        json['native'] != null ? NativeModel.fromJson(json['native']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (interstitial != null) {
      data['interstitial'] = interstitial!.toJson();
    }
    if (nativeId != null) {
      data['native'] = nativeId!.toJson();
    }
    return data;
  }
}

class ApplovinModel {
  BannerModel? banner;
  InterstitialModel? interstitial;
  NativeModel? nativeId;
  MrecModel? mrec;

  ApplovinModel({this.banner, this.interstitial, this.nativeId, this.mrec});

  ApplovinModel.fromJson(Map<String, dynamic> json) {
    banner =
        json['banner'] != null ? BannerModel.fromJson(json['banner']) : null;
    interstitial = json['interstitial'] != null
        ? InterstitialModel.fromJson(json['interstitial'])
        : null;
    nativeId =
        json['native'] != null ? NativeModel.fromJson(json['native']) : null;
    mrec = json['mrec'] != null ? MrecModel.fromJson(json['mrec']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (interstitial != null) {
      data['interstitial'] = interstitial!.toJson();
    }
    if (nativeId != null) {
      data['native'] = nativeId!.toJson();
    }
    if (mrec != null) {
      data['mrec'] = mrec!.toJson();
    }
    return data;
  }
}

class BannerModel {
  bool? status;
  String? adUnit;

  BannerModel({this.status, this.adUnit});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adUnit = json['ad_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ad_unit'] = adUnit;
    return data;
  }
}

class InterstitialModel {
  bool? status;
  String? adUnit;

  InterstitialModel({this.status, this.adUnit});

  InterstitialModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adUnit = json['ad_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ad_unit'] = adUnit;
    return data;
  }
}

class NativeModel {
  bool? status;
  String? adUnit;

  NativeModel({this.status, this.adUnit});

  NativeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adUnit = json['ad_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ad_unit'] = adUnit;
    return data;
  }
}

class MrecModel {
  bool? status;
  String? adUnit;

  MrecModel({this.status, this.adUnit});

  MrecModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adUnit = json['ad_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ad_unit'] = adUnit;
    return data;
  }
}

class SystemAdModel {
  bool? status;
  String? title;
  String? content;
  String? image;
  String? url;

  SystemAdModel({this.status, this.title, this.content, this.image, this.url});

  SystemAdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class SystemAppModel {
  bool? status;
  String? title;
  String? content;
  String? image;
  String? url;

  SystemAppModel({this.status, this.title, this.content, this.image, this.url});

  SystemAppModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}
