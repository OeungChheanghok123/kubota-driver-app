import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.only(left: defaultPaddin * 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/kbc-logo.png'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/klc-logo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Text(
                'Sign In',
                style: AppTextStyle.headline1.copyWith(fontSize: 32),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Text(
                  'Here is a free creative sign-in template design that you can utilize for heaps of different projects and intentions. The tool sports both email/password and social media sign-ins, so the user chooses what suits them best.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.headline1,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: AppWidgets.textField(
                  context,
                  emailController,
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: defaultPaddin),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: AppWidgets.textField(
                  context,
                  passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: AppWidgets.button(
                  'Sign In',
                  leftIcon: Icons.login,
                  borderRadius: defaultPaddin,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}