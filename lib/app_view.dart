import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/auth/views/welcome_screen.dart';
import 'package:pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white
        ),
        // useMaterial3: false,
      ),
      title: 'Pizza',
      debugShowCheckedModeBanner: false,

      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if(state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(providers: [
              BlocProvider(create: (context) => SignInBloc(context.read<AuthenticationBloc>().userRepository),),
              BlocProvider(create: (context) => GetPizzaBloc(FirebasePizzaRepo())..add(GetPizza()))
            ],
                child: const HomeScreen());
          } else {
            return const WelcomeScreen();
          }
        },
      )
    );
  }
}
