abstract class MyAppEvent {
  const MyAppEvent();
}

class LoginEvent extends MyAppEvent {
  LoginEvent(this.username, this.permission);
  String username;
  bool permission;
}

class LoginAndRegistorEvent extends MyAppEvent {
  const LoginAndRegistorEvent();
}

class RegistorEvent extends MyAppEvent {
  RegistorEvent(this.permission, this.username);
  bool permission;
  String username;
}

class LogoutEnvent extends MyAppEvent {
  const LogoutEnvent();
}
