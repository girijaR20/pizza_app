class MyUserEntity {
  String id;
  String email;
  String name;
  bool hasActiveCart;

  MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.hasActiveCart
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        id: doc['id'],
        email: doc['email'],
        name: doc['name'],
        hasActiveCart: doc['hasActiveCart']
    );
  }
}