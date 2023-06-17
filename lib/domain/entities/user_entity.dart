class UserEntity {
  int id;
  String firstName;
  String lastName1;
  String lastName2;
  String email;
  String photo;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName1,
    required this.lastName2,
    required this.email,
    this.photo = '',
  });
}
