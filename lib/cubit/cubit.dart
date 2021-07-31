import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api_udemy/Nerwork/end_point.dart';
import 'package:shop_app_api_udemy/Nerwork/remote/dio_helper.dart';
import 'package:shop_app_api_udemy/mnodel/login_model.dart';
import 'states.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  LoginModel loginModel;

  static ShopCubit get(context) => BlocProvider.of(context);

  void userLogin({@required String email, @required String password}) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(url: LOGIN, date: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.status);
      print(loginModel.message);

      emit(ShopLoginSuccessState(loginModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopLoginErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVissablity() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShopChangePasswordState());
  }
}
