import '../../../data/models/user.dart';

class ConfirmState {
  const ConfirmState();

  ConfirmState copyWith({bool? obscureText}) {
    return ConfirmState();
  }
}

class ConfirmInitial extends ConfirmState {}

class ConfirmLoading extends ConfirmState {}

class ConfirmSuccess extends ConfirmState {
  final String message;
  final List<UserModel> users;

  ConfirmSuccess(this.message, this.users);

  @override
  List<Object?> get props => [users];
}

class ConfirmError extends ConfirmState {
  final String error;

  ConfirmError(this.error);
}
