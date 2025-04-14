class LocalAreasModel {
  bool? success;
  String? message;
  Result1? result;

  LocalAreasModel({this.success, this.message, this.result});

  LocalAreasModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result = json['result'] != null ? Result1.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result1 {
  List<LocalAreas>? localAreas;

  Result1({this.localAreas});

  Result1.fromJson(Map<String, dynamic> json) {
    if (json['localAreas'] != null) {
      localAreas = <LocalAreas>[];
      json['localAreas'].forEach((v) {
        localAreas!.add(LocalAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (localAreas != null) {
      data['localAreas'] = localAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocalAreas {
  String? id;
  String? imageUrl;
  String? placeName;
  String? createdAt;

  LocalAreas({this.id, this.imageUrl, this.placeName, this.createdAt});

  LocalAreas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    placeName = json['placeName'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['placeName'] = placeName;
    data['createdAt'] = createdAt;
    return data;
  }
}
