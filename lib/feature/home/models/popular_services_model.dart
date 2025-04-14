import 'dart:convert';

PopularServicesModel popularServicesModelFromJson(String str) => PopularServicesModel.fromJson(json.decode(str));

String popularServicesModelToJson(PopularServicesModel data) => json.encode(data.toJson());

class PopularServicesModel {
  bool? success;
  String? message;
  PopServiceResult? result;

  PopularServicesModel({this.success, this.message, this.result});

  factory PopularServicesModel.fromJson(Map<String, dynamic> json) => PopularServicesModel(
    success: json["success"],
    message: json["message"],
    result: json["result"] == null ? null : PopServiceResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {"success": success, "message": message, "result": result?.toJson()};
}

class PopServiceResult {
  List<PopularService>? popularServices;

  PopServiceResult({this.popularServices});

  factory PopServiceResult.fromJson(Map<String, dynamic> json) => PopServiceResult(
    popularServices:
        json["popularServices"] == null
            ? []
            : List<PopularService>.from(json["popularServices"]!.map((x) => PopularService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "popularServices": popularServices == null ? [] : List<dynamic>.from(popularServices!.map((x) => x.toJson())),
  };
}

class PopularService {
  String? id;
  String? serviceName;
  String? providerName;
  String? serviceIcon;
  List<String>? mediaUrls;
  String? location;
  String? description;
  num? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Booking>? bookings;
  List<Review>? reviews;
  num? averageRating;

  PopularService({
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

  factory PopularService.fromJson(Map<String, dynamic> json) => PopularService(
    id: json["id"],
    serviceName: json["serviceName"],
    providerName: json["providerName"],
    serviceIcon: json["serviceIcon"],
    mediaUrls: json["mediaUrls"] == null ? [] : List<String>.from(json["mediaUrls"]!.map((x) => x)),
    location: json["location"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    bookings: json["bookings"] == null ? [] : List<Booking>.from(json["bookings"]!.map((x) => Booking.fromJson(x))),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    averageRating: json["averageRating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "serviceName": serviceName,
    "providerName": providerName,
    "serviceIcon": serviceIcon,
    "mediaUrls": mediaUrls == null ? [] : List<dynamic>.from(mediaUrls!.map((x) => x)),
    "location": location,
    "description": description,
    "price": price,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x.toJson())),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "averageRating": averageRating,
  };
}

class Booking {
  String? id;

  Booking({this.id});

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id};
}

class Review {
  String? id;
  String? userId;
  String? serviceId;
  num? rating;
  String? comment;
  DateTime? createdAt;

  Review({this.id, this.userId, this.serviceId, this.rating, this.comment, this.createdAt});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    userId: json["userId"],
    serviceId: json["serviceId"],
    rating: json["rating"],
    comment: json["comment"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "serviceId": serviceId,
    "rating": rating,
    "comment": comment,
    "createdAt": createdAt?.toIso8601String(),
  };
}
