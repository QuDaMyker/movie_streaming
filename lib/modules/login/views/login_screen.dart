import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/modules/login/controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double? deviceHeight;

  late double? deviceWidth;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -deviceWidth! * 0.5,
            child: Container(
              width: deviceWidth! * 1,
              height: deviceWidth! * 1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            right: -deviceWidth! * 0.6,
            child: Container(
              width: deviceWidth! * 1,
              height: deviceWidth! * 1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellowAccent.withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            bottom: -deviceWidth! * 0.6,
            child: Container(
              width: deviceWidth! * 1,
              height: deviceWidth! * 1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellowAccent.withOpacity(0.1),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth! * 0.05,
                  vertical: deviceHeight! * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.yellow.shade300,
                        fontSize: 64,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Let\'s get started',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Movie Streaming',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight! * 0.05,
                    ),
                    Form(
                      key: loginController.keyForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight! * 0.01,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.words,
                            autocorrect: false,
                            autofocus: true,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            onChanged: (value) {},
                            onSaved: (newValue) {},
                            validator: (value) {},
                            controller: loginController.emailTextController,
                            decoration: InputDecoration(
                              counterText: '',
                              focusColor: Colors.yellow,
                              fillColor: Colors.yellow,
                              hoverColor: Colors.yellow,
                              iconColor: Colors.yellow,
                              prefixIconColor: Colors.yellow,
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth! * 0.04,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  deviceWidth! * 0.01,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.yellow.withOpacity(0.9),
                                  width: deviceWidth! * 0.001,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  deviceWidth! * 0.01,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.yellow.withOpacity(0.7),
                                  width: deviceWidth! * 0.001,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  deviceWidth! * 0.01,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.yellow.withOpacity(0.7),
                                  width: deviceWidth! * 0.001,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.yellow,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceWidth! * 0.04,
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight! * 0.03,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight! * 0.01,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            autocorrect: false,
                            autofocus: true,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            onChanged: (value) {},
                            onSaved: (newValue) {},
                            validator: (value) {},
                            controller: loginController.passwordTextController,
                            decoration: InputDecoration(
                              counterText: '',
                              focusColor: Colors.yellow,
                              fillColor: Colors.yellow,
                              hoverColor: Colors.yellow,
                              iconColor: Colors.yellow,
                              prefixIconColor: Colors.yellow,
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth! * 0.04,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  deviceWidth! * 0.01,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.yellow.withOpacity(0.9),
                                  width: deviceWidth! * 0.001,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  deviceWidth! * 0.01,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.yellow.withOpacity(0.7),
                                  width: deviceWidth! * 0.001,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  deviceWidth! * 0.01,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.yellow.withOpacity(0.7),
                                  width: deviceWidth! * 0.001,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.password_outlined,
                                color: Colors.yellow,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceWidth! * 0.04,
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight! * 0.05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: OutlinedButton(
                        onPressed: () {
                          loginController.keyForm.currentState!.save();
                          loginController.requestLoginWithEmail();
                        },
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight! * 0.02,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: OutlinedButton(
                        onPressed: () {
                          loginController.requestLoginWithGoogle();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.golf_course),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
