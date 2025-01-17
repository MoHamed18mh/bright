import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splachViewTimer() {
    Future.delayed(
      Duration(seconds: 4),
      () {
        emit(SplashNavigate());
      },
    );
  }
}
