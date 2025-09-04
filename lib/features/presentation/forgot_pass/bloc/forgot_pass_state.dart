
import '../../../data/models/user.dart';

class ForgotPassState {
  final bool obscureText;

  const ForgotPassState({this.obscureText = true});

  ForgotPassState copyWith({bool? obscureText}) {
    return ForgotPassState(
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassLoading extends ForgotPassState {}

class ForgotPassSuccess extends ForgotPassState {
  final String message;
  final List<UserModel> users;

  ForgotPassSuccess(this.message, this.users);

  @override
  List<Object?> get props => [users];
}

class ForgotPassError extends ForgotPassState {
  final String error;

  ForgotPassError(this.error);
}
