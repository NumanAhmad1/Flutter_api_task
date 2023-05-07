import 'package:flutter_task/Screens/Home.dart';
import 'package:flutter_task/Widgets/InputTextField.dart';

import '/Models/LoginRepositery.dart';
import '/Constants/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: kgreycolor,
      appBar: AppBar(
        backgroundColor: kyellowcolor,
        title: Text(
          'Login',
          style: TextStyle(
              color: kwhitecolor, fontSize: 25.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),

            //Email InputField

            InputTextField(
              text: 'Enter Your Email',
              controller: emailController,
              obsecuretext: false,
              keyboardType: TextInputType.emailAddress,
            ),

            //Password InputField
            SizedBox(
              height: 30.h,
            ),

            InputTextField(
              text: 'Enter Your Password',
              controller: passwordController,
              obsecuretext: true,
              keyboardType: TextInputType.visiblePassword,
            ),

            // Login Button
            const Spacer(),

            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                height: 50.h,
                width: double.infinity,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final isLoggedIn = await authProvider.login(
                    emailController.text,
                    passwordController.text,
                  );
                  print(emailController.text.toString());
                  print(passwordController.text.toString());

                  print('printing isloggedIn ${isLoggedIn}');

                  if (isLoggedIn == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          'Login Success',
                          style: TextStyle(
                            fontSize: 25.sp,
                          ),
                        ),
                        content: Text(
                          'User Authenticated Successfully!',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ok',
                              style: TextStyle(
                                color: kwhitecolor,
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                        ],
                        backgroundColor: kgreycolor,
                      ),
                    );

                    print('The Login value is  $isLoggedIn');
                  }
                  // else {
                  //   // ignore: use_build_context_synchronously
                  //   showDialog(
                  //     context: context,
                  //     builder: (_) => AlertDialog(
                  //       title: Text(
                  //         'Login Failed',
                  //         style: TextStyle(
                  //           fontSize: 25.sp,
                  //         ),
                  //       ),
                  //       content: Text(
                  //         'Login Failed, Incorrect Credentials Provided!',
                  //         style: TextStyle(
                  //           fontSize: 20.sp,
                  //         ),
                  //       ),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Text(
                  //             'ok',
                  //             style: TextStyle(
                  //               color: kwhitecolor,
                  //               fontSize: 22.sp,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //       backgroundColor: kgreycolor,
                  //     ),
                  //   );
                  //
                  //   print('The Login value is  $isLoggedIn');
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kyellowcolor, //background color of button
                  side: BorderSide(width: 3.w, color: kwhitecolor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: authProvider.isloading
                    ? const CircularProgressIndicator(
                        color: kwhitecolor,
                      )
                    : Text(
                        'Log In',
                        style: TextStyle(
                            color: kwhitecolor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),

            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
