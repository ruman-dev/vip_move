class VehicleModel {
  bool? success;
  String? message;
  VehicleResult? result;

  VehicleModel({this.success, this.message, this.result});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result = json['result'] != null ? VehicleResult.fromJson(json['result']) : null;
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

class VehicleResult {
  List<Vehicles>? vehicles;

  VehicleResult({this.vehicles});

  VehicleResult.fromJson(Map<String, dynamic> json) {
    if (json['vehicles'] != null) {
      vehicles = <Vehicles>[];
      json['vehicles'].forEach((v) {
        vehicles!.add(Vehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehicles != null) {
      data['vehicles'] = vehicles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicles {
  String? id;
  String? capacity;
  String? vehicleName;
  String? imageUrl;
  int? cost;
  String? createdAt;
  String? updatedAt;

  Vehicles({this.id, this.capacity, this.vehicleName, this.imageUrl, this.cost, this.createdAt, this.updatedAt});

  Vehicles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    capacity = json['capacity'];
    vehicleName = json['vehicleName'];
    imageUrl = json['imageUrl'];
    cost = json['cost'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['capacity'] = capacity;
    data['vehicleName'] = vehicleName;
    data['imageUrl'] = imageUrl;
    data['cost'] = cost;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
