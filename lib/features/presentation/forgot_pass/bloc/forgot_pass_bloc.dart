import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  // final ForgotPassUserCase logInUserCase;

  ForgotPassCubit() : super(ForgotPassInitial());


}
