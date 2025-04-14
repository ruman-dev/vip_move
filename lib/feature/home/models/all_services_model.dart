class AllServicesModel {
  bool? success;
  String? message;
  Result? result;

  AllServicesModel({this.success, this.message, this.result});

  AllServicesModel.fromJson(Map<String, dynamic> json) {
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
  List<UpdatedServices>? updatedServices;

  Result({this.updatedServices});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['updatedServices'] != null) {
      updatedServices = <UpdatedServices>[];
      json['updatedServices'].forEach((v) {
        updatedServices!.add(UpdatedServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (updatedServices != null) {
      data['updatedServices'] = updatedServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdatedServices {
  String? id;
  String? serviceName;
  String? providerName;
  String? serviceIcon;
  List<String>? mediaUrls;
  String? location;
  String? description;
  num? price;
  String? createdAt;
  String? updatedAt;
  List<Bookings>? bookings;
  List<Reviews>? reviews;
  num? averageRating;

  UpdatedServices({
    this.id,
    this.serviceName,
    this.providerName,
    this.serviceIcon,
    this.mediaUrls,
    this.location,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.bookings,
    this.reviews,
    this.averageRating,
  });

  UpdatedServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    providerName = json['providerName'];
    serviceIcon = json['serviceIcon'];
    mediaUrls = json['mediaUrls'].cast<String>();
    location = json['location'];
    description = json['description'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(Bookings.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serviceName'] = serviceName;
    data['providerName'] = providerName;
    data['serviceIcon'] = serviceIcon;
    data['mediaUrls'] = mediaUrls;
    data['location'] = location;
    data['description'] = description;
    data['price'] = price;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['averageRating'] = averageRating;
    return data;
  }
}

class Bookings {
  String? userId;
  String? id;
  num? totalCost;
  String? scheduledAt;
  String? status;
  String? vehicle;
  num? distance;

  Bookings({this.userId, this.id, this.totalCost, this.scheduledAt, this.status, this.vehicle, this.distance});

  Bookings.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    totalCost = json['totalCost'];
    scheduledAt = json['scheduledAt'];
    status = json['status'];
    vehicle = json['vehicle'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['totalCost'] = totalCost;
    data['scheduledAt'] = scheduledAt;
    data['status'] = status;
    data['vehicle'] = vehicle;
    data['distance'] = distance;
    return data;
  }
}

class Reviews {
  String? id;
  String? userId;
  String? serviceId;
  num? rating;
  String? comment;
  String? createdAt;

  Reviews({this.id, this.userId, this.serviceId, this.rating, this.comment, this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    serviceId = json['serviceId'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['serviceId'] = serviceId;
    data['rating'] = rating;
    data['comment'] = comment;
    data['createdAt'] = createdAt;
    return data;
  }
}
