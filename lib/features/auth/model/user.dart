
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final int phone;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final String cardId;
  final String sex;
  String? token; // Optional token field

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.cardId,
    required this.sex,
    this.token,
  });

  // Factory method to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      email: json['Email'] as String,
      password: json['Password'] as String,
      phone: json['Phone'] as int,
      dateOfBirth: DateTime.parse(json['DateOfBirth']),
      placeOfBirth: json['PlaceofBirth'] as String,
      cardId: json['cardId'] as String,
      sex: json['Sex'] as String,
      token: json['Token'] as String?,
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'Password': password,
      'Phone': phone,
      'DateOfBirth': dateOfBirth.toIso8601String(),
      'PlaceofBirth': placeOfBirth,
      'cardId': cardId,
      'Sex': sex,
      if (token != null) 'Token': token,
    };
  }
}