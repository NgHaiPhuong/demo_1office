import 'package:flutter_bloc/flutter_bloc.dart';

import 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmState> {
  // final ConfirmUserCase logInUserCase;

  ConfirmCubit() : super(ConfirmInitial());
}
