import 'package:timeago/timeago.dart' as timeago;

class ServiceDetailsModel {
  bool? success;
  String? message;
  Result? result;

  ServiceDetailsModel({this.success, this.message, this.result});

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Service? service;
  int? averageRating;

  Result({this.service, this.averageRating});

  Result.fromJson(Map<String, dynamic> json) {
    service = json['service'] != null ? new Service.fromJson(json['service']) : null;
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['averageRating'] = this.averageRating;
    return data;
  }
}

class Service {
  String? id;
  String? serviceName;
  String? providerName;
  String? serviceIcon;
  List<String>? mediaUrls;
  String? location;
  int? labors;
  int? hours;
  int? addHourCharge;
  bool? truckNeeded;
  String? description;
  int? price;
  String? createdAt;
  String? updatedAt;
  List<Reviews>? reviews;

  Service({
    this.id,
    this.serviceName,
    this.providerName,
    this.serviceIcon,
    this.mediaUrls,
    this.location,
    this.labors,
    this.hours,
    this.addHourCharge,
    this.truckNeeded,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.reviews,
  });

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    providerName = json['providerName'];
    serviceIcon = json['serviceIcon'];
    mediaUrls = json['mediaUrls'].cast<String>();
    location = json['location'];
    labors = json['labors'];
    hours = json['hours'];
    addHourCharge = json['addHourCharge'];
    truckNeeded = json['truckNeeded'];
    description = json['description'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceName'] = this.serviceName;
    data['providerName'] = this.providerName;
    data['serviceIcon'] = this.serviceIcon;
    data['mediaUrls'] = this.mediaUrls;
    data['location'] = this.location;
    data['labors'] = this.labors;
    data['hours'] = this.hours;
    data['addHourCharge'] = this.addHourCharge;
    data['truckNeeded'] = this.truckNeeded;
    data['description'] = this.description;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? id;
  String? userId;
  String? comment;
  int? rating;
  String? createdAt;
  User? user;

  Reviews({this.id, this.userId, this.comment, this.rating, this.createdAt, this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

  String get timeRemaining {
    if (createdAt == null) return 'Unknown time';
    try {
      final dateTime = DateTime.parse(createdAt!);

      return timeago.format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }
}

class User {
  String? username;
  String? profileImage;

  User({this.username, this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profileImage'] = this.profileImage;
    return data;
  }
}
