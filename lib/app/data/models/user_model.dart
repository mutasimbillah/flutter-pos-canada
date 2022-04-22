class UserModel {
  final int id;
  final String name;
  final String address;
  final String stateId;

  UserModel({
    required this.id,
    required this.name,
    required this.address,
    required this.stateId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      stateId: json["state_id"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel? model) {
    return id == model?.id;
  }

  @override
  String toString() => name;
}
