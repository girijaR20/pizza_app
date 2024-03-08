part of 'get_pizza_bloc.dart';

abstract class GetPizzaEvent extends Equatable {
  const GetPizzaEvent();
}

class GetPizza extends GetPizzaEvent {
  @override
  List<Object?> get props => [];
}