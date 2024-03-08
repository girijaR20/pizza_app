part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInFailure extends SignInState {
  @override
  List<Object?> get props => [];
}

final class SignInProcess extends SignInState {
  @override
  List<Object?> get props => [];
}

final class SignInSuccess extends SignInState {
  @override
  List<Object?> get props => [];

}