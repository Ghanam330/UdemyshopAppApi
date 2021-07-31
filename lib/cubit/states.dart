import 'package:shop_app_api_udemy/mnodel/login_model.dart';

abstract class ShopStates {}
class ShopInitialState extends ShopStates{}
class ShopLoginLoadingState extends ShopStates{}
class ShopLoginSuccessState extends ShopStates{
  final LoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopStates{
  final String error;
  ShopLoginErrorState(this.error);
}





class ShopChangePasswordState extends ShopStates{}

