class ApiSuccess {
  int? statusCode;
  bool? success;
  String? message;
  dynamic data;
}

class ApiSuccessWithPagination {
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
