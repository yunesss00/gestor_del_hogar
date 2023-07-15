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

  // Getter para id
  int get getId => id;

  // Setter para id
  set setId(int newId) {
    id = newId;
  }

  // Getter para firstName
  String get getFirstName => firstName;

  // Setter para firstName
  set setFirstName(String newFirstName) {
    firstName = newFirstName;
  }

  // Getter para lastName1
  String get getLastName1 => lastName1;

  // Setter para lastName1
  set setLastName1(String newLastName1) {
    lastName1 = newLastName1;
  }

  // Getter para lastName2
  String get getLastName2 => lastName2;

  // Setter para lastName2
  set setLastName2(String newLastName2) {
    lastName2 = newLastName2;
  }

  // Getter para email
  String get getEmail => email;

  // Setter para email
  set setEmail(String newEmail) {
    email = newEmail;
  }

  // Getter para photo
  String get getPhoto => photo;

  // Setter para photo
  set setPhoto(String newPhoto) {
    photo = newPhoto;
  }
}
