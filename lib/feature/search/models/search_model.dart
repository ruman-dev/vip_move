class SearchModel {
  final bool? success;
  final String? message;
  final SearchResult? result;

  SearchModel({this.success, this.message, this.result});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      success: json['success'],
      message: json['message'],
      result: json['result'] != null
          ? SearchResult.fromJson(json['result'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'result': result?.toJson(),
    };
  }
}

class SearchResult {
  final List<SearchItem>? searches;

  SearchResult({this.searches});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      searches: json['searches'] != null
          ? List<SearchItem>.from(
          json['searches'].map((item) => SearchItem.fromJson(item)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'searches': searches?.map((e) => e.toJson()).toList(),
    };
  }
}

class SearchItem {
  final String? id;
  final String? userId;
  final String? searchTerm;
  final String? createdAt;

  SearchItem({this.id, this.userId, this.searchTerm, this.createdAt});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      id: json['id'],
      userId: json['userId'],
      searchTerm: json['searchTerm'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'searchTerm': searchTerm,
      'createdAt': createdAt,
    };
  }
}
