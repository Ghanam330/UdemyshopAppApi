abstract class ShopStates {}
class ShopInitialState extends ShopStates{}
class ShopLoginLoadingState extends ShopStates{}
class ShopLoginSuccessState extends ShopStates{}
class ShopLoginErrorState extends ShopStates{
  final String error;
  ShopLoginErrorState(this.error);
}





