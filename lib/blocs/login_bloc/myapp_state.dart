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
  InformationState(this.uid, this.permission);
  String uid;
  String permission;
}

class HomeState extends MyAppState {
  HomeState(this.uid);
  String? uid;
}
