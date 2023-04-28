// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_field_management_demo/blocs/login_bloc/myapp_event.dart';
import 'package:football_field_management_demo/blocs/login_bloc/myapp_state.dart';

class MyAppBLoc extends Bloc<MyAppEvent, MyAppState> {
  MyAppState stateInitial;
  MyAppBLoc(this.stateInitial) : super(stateInitial) {
    on<LoginEvent>(login);
    on<RegistorEvent>(registor);
    on<LoginAndRegistorEvent>(loginAndRegistor);
    on<LogoutEnvent>(logout);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void login(LoginEvent event, Emitter<MyAppState> emit) {
    emit(HomeState());
  }

  void registor(RegistorEvent event, Emitter<MyAppState> emit) {
    emit(InformationState(event.uid, event.permission));
  }

  void loginAndRegistor(LoginAndRegistorEvent event, Emitter<MyAppState> emit) {
    if (state is LoginState) {
      emit(const RegistorState());
    } else if (state is RegistorState) {
      emit(const LoginState());
    }
  }

  void logout(LogoutEnvent event, Emitter<MyAppState> emit) {
    emit(const LoginState());
  }
}
