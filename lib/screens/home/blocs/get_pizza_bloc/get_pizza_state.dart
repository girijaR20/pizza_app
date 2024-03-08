
part of 'get_pizza_bloc.dart';

abstract class GetPizzaState extends Equatable {
  const GetPizzaState();
}

class GetPizzaInitial extends GetPizzaState {
  @override
  List<Object> get props => [];
}
final class GetPizzaFailure extends GetPizzaState {
  @override
  List<Object?> get props => [];
}
final class GetPizzaLoading extends GetPizzaState {
  @override
  List<Object?> get props => [];
}
final class GetPizzaSuccess extends GetPizzaState {
  final List<Pizza> pizzas;
  const GetPizzaSuccess(this.pizzas);
  @override
  List<Object> get props => [pizzas];
}