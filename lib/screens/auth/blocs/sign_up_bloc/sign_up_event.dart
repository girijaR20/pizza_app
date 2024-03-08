part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}


class SignUpRequired extends SignUpEvent {
  final MyUser user;
  final String password;

  const SignUpRequired(this.user, this.password);

  @override
  List<Object?> get props => [user, password];
}