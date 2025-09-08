import '../../../data/models/user.dart';

class ForgotPassState {
  const ForgotPassState();

  ForgotPassState copyWith({bool? obscureText}) {
    return ForgotPassState();
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
