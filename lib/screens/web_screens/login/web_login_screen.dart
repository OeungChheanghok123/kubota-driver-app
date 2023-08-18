import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/kbc-logo.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/klc-logo.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text(
                    'Login to your account',
                    style: WebAppTextStyle.headline1.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6.sp,
                    child: AppWidgets.textField(
                      context,
                      emailController,
                      hintText: "Username",
                    ),
                  ),
                  const SizedBox(height: defaultPaddin),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6.sp,
                    child: AppWidgets.textField(
                      context,
                      passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6.sp,
                    child: AppWidgets.button(
                      'Login',
                      leftIcon: Icons.login,
                      borderRadius: defaultPaddin,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
