import 'package:flutter/material.dart';
import 'package:shop_app_api_udemy/Screen/login/regester.dart';
import 'package:shop_app_api_udemy/component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LogIn',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Login now to browse our hot offer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
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
                    suffixPressed: () {},
                    label: 'Password',
                    prefix: Icons.visibility_outlined,
                    ),
                SizedBox(
                  height: 30.0,
                ),
                defaultButton(function: () {}, text: 'Login', isUpperCase: true),
                SizedBox(
                  height: 15.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Don\`t have an account'
                    ),
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
    );
  }
}
