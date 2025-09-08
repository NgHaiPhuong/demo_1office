import '../../../data/models/user.dart';

class VerificationState {
  const VerificationState();

  VerificationState copyWith({bool? obscureText}) {
    return VerificationState();
  }
}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {
  final String message;
  final List<UserModel> users;

  VerificationSuccess(this.message, this.users);

  @override
  List<Object?> get props => [users];
}

class VerificationError extends VerificationState {
  final String error;

  VerificationError(this.error);
}
