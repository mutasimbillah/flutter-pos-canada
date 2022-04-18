class Api200 {
  int? statusCode;
  bool? success;
  String? message;
  dynamic data;
}

class Api200WithPagination {
  int? statusCode;
  bool? success;
  String? message;
  int? currentPage;
  dynamic data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
}
