import 'package:flutter_bloc/flutter_bloc.dart';

import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  // final VerificationUserCase logInUserCase;

  VerificationCubit() : super(VerificationInitial());
}
