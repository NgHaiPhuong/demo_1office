
import '../../../data/models/user.dart';

class LogInState {
  final bool obscureText;
  final bool isSaveInfo;
  final String urlFlag;

  const LogInState({this.obscureText = true, this.isSaveInfo = true, this.urlFlag = "assets/flags/vn_flag.png"});

  LogInState copyWith({bool? obscureText, bool? isSaveInfo, String? urlFlag}) {
    return LogInState(
      obscureText: obscureText ?? this.obscureText,
      isSaveInfo: isSaveInfo ?? this.isSaveInfo,
      urlFlag: urlFlag ?? this.urlFlag,
    );
  }
}

class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {
  final String message;
  final List<UserModel> users;

  LogInSuccess(this.message, this.users);

  @override
  List<Object?> get props => [users];
}

class LogInError extends LogInState {
  final String error;

  LogInError(this.error);
}
