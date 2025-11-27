class AppUser {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? photoUrl;
  final DateTime createdAt;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.photoUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "role": role,
      "photoUrl": photoUrl,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      role: map["role"],
      photoUrl: map["photoUrl"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}
