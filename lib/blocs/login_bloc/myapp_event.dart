abstract class MyAppEvent {
  const MyAppEvent();
}

class LoginEvent extends MyAppEvent {
  LoginEvent(this.uid);
  String uid;
}

class LoginAndRegistorEvent extends MyAppEvent {
  const LoginAndRegistorEvent();
}

class RegistorEvent extends MyAppEvent {
  RegistorEvent(this.uid, this.permission);
  String uid;
  String permission;
}

class LogoutEnvent extends MyAppEvent {
  const LogoutEnvent();
}
