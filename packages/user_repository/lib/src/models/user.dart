import 'package:user_repository/src/entities/entities.dart';

class MyUser {
  String id;
  String email;
  String name;
  bool hasActiveCart;

  MyUser({
    required this.id,
    required this.email,
    required this.name,
    required this.hasActiveCart
  });

  static final empty = MyUser(id: '', email: '', name: '', hasActiveCart: false);

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      hasActiveCart: entity.hasActiveCart
    );
  }

  @override
  String toString() {
    return 'MyUser{id: $id, email: $email, name: $name, hasActiveCart: $hasActiveCart}';
  }
}