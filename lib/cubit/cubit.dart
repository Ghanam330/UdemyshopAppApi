import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api_udemy/Nerwork/local/cach_helper.dart';
import 'states.dart';

class ShopCubit extends Cubit<ShopStates> {

  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context)=> BlocProvider.of(context);
void userLogin(){

}
}
