import 'package:flutter_task/Models/LoginRepositery.dart';
import 'package:flutter_task/Screens/Auth/Login.dart';

import '/Constants/const.dart';
import 'Screens/Home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final _authProvider = AuthProvider();
        return FutureBuilder(
          future: _authProvider.autoLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                home: const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else {
              if (snapshot.hasError) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,

                  home: Scaffold(
                    body: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ),
                );
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,

                  home: _authProvider.token.isEmpty
                      ? const LoginScreen()
                      : const Home(),
                );
              }
            }
          },
        );
      },
    );
  }
}
