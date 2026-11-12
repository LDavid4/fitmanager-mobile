/// Uloge korisnika u sistemu.
enum UserRole { registered, trainer, admin }

UserRole roleFromString(String? value) {
  switch (value) {
    case 'trainer':
      return UserRole.trainer;
    case 'admin':
      return UserRole.admin;
    default:
      return UserRole.registered;
  }
}

/// Korisnik sistema.
class User {
  final String id;
  final String name;
  final String email;
  final UserRole role;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: roleFromString(json['role'] as String?),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'role': role.name,
      };
}
