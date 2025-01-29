import 'package:bright/features/drop_down_menu/cubit/drop_down_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownInitial());

  // ********* the variable of current screen from drop down menu ***********
  int currrentScrren = 0;

  // ********* change current screen *************
  void setCurrentScreen(int index) {
    currrentScrren = index;
  }

  // ********* change state of drop down menu 'open and close' ************
  void changeMnueVisibility() {
    emit((state is MenuIsVisible) ? MenuIsNotVisible() : MenuIsVisible());
  }
}
