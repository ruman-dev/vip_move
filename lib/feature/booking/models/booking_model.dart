class BookingModel {
  bool? success;
  String? message;
  Result? result;

  BookingModel({this.success, this.message, this.result});

  BookingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
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

class Result {
  List<Booking>? booking;

  Result({this.booking});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['booking'] != null) {
      booking = <Booking>[];
      json['booking'].forEach((v) {
        booking!.add(Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (booking != null) {
      data['booking'] = booking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Booking {
  String? id;
  String? userId;
  String? serviceId;
  String? serviceName;
  num? serviceCost;
  num? distanceCost;
  String? paymentIntentId;
  bool? isPaid;
  num? addHour;
  num? addHourCost;
  num? vehicleCost;
  num? totalCost;
  String? scheduledAt;
  String? vehicle;
  num? distance;
  String? cancellationReason;
  String? status;
  String? createdAt;
  String? updatedAt;
  Service? service;

  Booking({
    this.id,
    this.userId,
    this.serviceId,
    this.serviceName,
    this.serviceCost,
    this.distanceCost,
    this.paymentIntentId,
    this.isPaid,
    this.addHour,
    this.addHourCost,
    this.vehicleCost,
    this.totalCost,
    this.scheduledAt,
    this.vehicle,
    this.distance,
    this.cancellationReason,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    serviceCost = json['serviceCost'];
    distanceCost = json['distanceCost'];
    paymentIntentId = json['paymentIntentId'];
    isPaid = json['isPaid'];
    addHour = json['addHour'];
    addHourCost = json['addHourCost'];
    vehicleCost = json['vehicleCost'];
    totalCost = json['totalCost'];
    scheduledAt = json['scheduledAt'];
    vehicle = json['vehicle'];
    distance = json['distance'];
    cancellationReason = json['cancellationReason'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['serviceId'] = serviceId;
    data['serviceName'] = serviceName;
    data['serviceCost'] = serviceCost;
    data['distanceCost'] = distanceCost;
    data['paymentIntentId'] = paymentIntentId;
    data['isPaid'] = isPaid;
    data['addHour'] = addHour;
    data['addHourCost'] = addHourCost;
    data['vehicleCost'] = vehicleCost;
    data['totalCost'] = totalCost;
    data['scheduledAt'] = scheduledAt;
    data['vehicle'] = vehicle;
    data['distance'] = distance;
    data['cancellationReason'] = cancellationReason;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    return data;
  }
}

class Service {
  String? providerName;
  String? serviceIcon;
  List<String>? mediaUrls;

  Service({this.providerName, this.serviceIcon, this.mediaUrls});

  Service.fromJson(Map<String, dynamic> json) {
    providerName = json['providerName'];
    serviceIcon = json['serviceIcon'];
    mediaUrls = json['mediaUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['providerName'] = providerName;
    data['serviceIcon'] = serviceIcon;
    data['mediaUrls'] = mediaUrls;
    return data;
  }
}
