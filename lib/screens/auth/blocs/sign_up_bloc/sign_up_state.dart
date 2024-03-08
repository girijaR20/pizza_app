part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpFailure extends SignUpState {
  @override
  List<Object?> get props => [];
}

final class SignUpProcess extends SignUpState {
  @override
  List<Object?> get props => [];
}

final class SignUpSuccess extends SignUpState {
  @override
  List<Object?> get props => [];

}