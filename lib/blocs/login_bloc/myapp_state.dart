import 'package:equatable/equatable.dart';

class MyAppState extends Equatable {
  const MyAppState() : super();

  @override
  List<Object?> get props => [];
}

class LoginState extends MyAppState {
  const LoginState();
}

class RegistorState extends MyAppState {
  const RegistorState();
}

class InformationState extends MyAppState {
  InformationState(this.username, this.permission);
  bool permission;
  String username;
}

class HomeState extends MyAppState {
  HomeState(this.username, this.permission);
  String username;
  bool permission;
}
