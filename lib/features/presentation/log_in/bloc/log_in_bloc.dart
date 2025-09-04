import 'package:flutter_bloc/flutter_bloc.dart';

import 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  // final LogInUserCase logInUserCase;

  LogInCubit() : super(LogInInitial());

  Future<void> login(String email, String password) async {
    // emit(LogInLoading());
    // try {
    //   final user = await logInUserCase(email, password);
    //   emit(LogInSuccess("Đăng nhập thành công", [user]));
    // } catch (e) {
    //   emit(LogInError("Lỗi: ${e.toString()}"));
    // }
  }

  void changeFlag(String? url) {
    emit(state.copyWith(urlFlag: url));
  }

  void statusEye() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void isSaveInfo(bool? isSave) {
    emit(state.copyWith(isSaveInfo: isSave));
  }
}
