import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_api_udemy/Screen/login/regester.dart';
import 'package:shop_app_api_udemy/component.dart';
import 'package:shop_app_api_udemy/cubit/cubit.dart';
import 'package:shop_app_api_udemy/cubit/states.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if(state is ShopLoginSuccessState){
            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.date.token);
            }else{
              print(state.loginModel.message);
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('welcome'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LogIn',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5,
                        ),
                        Text(
                          'Login now to browse our hot offer',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your email address';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter your Password';
                            }
                          },
                          onSubmit: (v) {
                            if (formKey.currentState.validate()) {
                              ShopCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text
                              );
                            }
                          },
                          suffix: ShopCubit.get(context).suffix,
                          isPassword:ShopCubit.get(context).isPasswordShown,
                          suffixPressed: () {
                            ShopCubit.get(context).changePasswordVissablity();
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        // defaultButton(
                        //     function: () {
                        //
                        //       ShopCubit.get(context).userLogin(
                        //           email: emailController.text,
                        //           password: passwordController.text);
                        //
                        //     },
                        //     text: 'Login',
                        //     isUpperCase: true),

                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>state is! ShopLoginLoadingState,
                          widgetBuilder: (context) =>
                              defaultButton(
                                  function: () {
                                    if (formKey.currentState.validate()) {
                                      ShopCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text
                                      );
                                    }
                                  },
                                  text: 'Login',
                                  isUpperCase: true
                              ),
                          fallbackBuilder: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\`t have an account'),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, RegisterScreen());
                              },
                              text: 'Register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
