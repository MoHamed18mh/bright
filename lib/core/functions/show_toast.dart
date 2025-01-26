import 'package:bright/core/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg} ){
  Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.white,
        fontSize: 16.0
    );
}