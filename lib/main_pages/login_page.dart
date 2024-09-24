// import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:provider/provider.dart';
import '../styles.dart';
import '../main.dart';
import 'home_page.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;
// import '../constants.dart';

// Removed Face ID authentication for Demo Purposes
//
// class BiometricAuth {
//   final LocalAuthentication _localAuthentication = LocalAuthentication();

//   Future<bool> authenticate() async {
//     bool isAuthenticated = false;

//     try {
//       isAuthenticated = await _localAuthentication.authenticate(
//         localizedReason: 'Authenticate using Face ID',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           useErrorDialogs: false,
//         ),
//       );
//     } catch (e) {
//       if (kDebugMode) {
//         print('Face validation failed');
//       }
//     }

//     return isAuthenticated;
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginFailed = false;
  // Removed Persistent Storage for Demo Purposes
  // FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool themeCheck = false;
  Map<String, dynamic> loginData = {};

  // Removed Face ID authentication for Demo Purposes
  // late bool _enableFaceID = false;
  // late int checkedID = 0;

  // Removed Persistent Storage for Demo Purposes
  // Future<void> _handleTheme(ThemeProvider themeProvider) async {
  //   String storedTheme = await secureStorage.read(key: 'themeMode') ?? '';
  //   if ((storedTheme == 'true') &&
  //       (themeProvider.themeMode != ThemeMode.dark)) {
  //     themeProvider.toggleTheme();
  //   }
  //   if ((storedTheme == 'false') &&
  //       (themeProvider.themeMode == ThemeMode.dark)) {
  //     themeProvider.toggleTheme();
  //   }
  //   return;
  // }

  // Removed Face ID authentication for Demo Purposes
  //
  // Future<void> _getFaceIDSetting() async {
  //   String faceIdOption = await secureStorage.read(key: 'faceID') ?? '';
  //   if (faceIdOption.contains('false')) {
  //     setState(() {
  //       _enableFaceID = false;
  //     });
  //   } else {
  //     setState(() {
  //       _enableFaceID = true;
  //     });
  //   }
  //   return;
  // }

  // Future<void> _handleFaceID() async {
  //   String storedEmail = await secureStorage.read(key: 'email') ?? '';
  //   String storedPass = await secureStorage.read(key: 'password') ?? '';
  //   if ((storedEmail == '') && (storedPass == '')) {
  //   } else {
  //     final BiometricAuth biometricAuth = BiometricAuth();

  //     bool isAuthenticated = await biometricAuth.authenticate();
  //     if (isAuthenticated) {
  //       _emailController.text = storedEmail;
  //       _passwordController.text = storedPass;
  //       await _login(navigatorKey);
  //     }
  //   }
  //   return;
  // }

  Future<void> _login(GlobalKey<NavigatorState> navigatorKey) async {
    // Removed API Calls for Demo Purposes
    // http.Response response = await http.post(
    //   Uri.parse('$urlRoot/auth/login'),
    //   headers: {'accept': '*/*', 'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     'email': _emailController.text,
    //     'password': _passwordController.text,
    //   }),
    // );
    // if (response.statusCode == 200) {
    if ((_emailController.text == 'demo') &&
        (_passwordController.text == 'demo')) {
      // await secureStorage.write(key: 'email', value: _emailController.text);
      // await secureStorage.write(
      //   key: 'password',
      //   value: _passwordController.text,
      // );

      // Map<String, dynamic> responseData = json.decode(response.body);

      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => const HomePage(
              // responseData: responseData['data'],
              // secureStorage: secureStorage,
              ),
        ),
      );
    } else {
      setState(() {
        _isLoginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // _handleTheme(themeProvider);
    // _getFaceIDSetting();
    // Removed Face ID authentication for Demo Purposes
    // if (_enableFaceID && (checkedID == 0)) {
    //   _handleFaceID();
    //   checkedID = 1;
    // }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                vertical:
                    (MediaQuery.of(context).orientation.name == 'portrait')
                        ? 60
                        : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  './lib/assets/reach.png', // Replace with your image path
                  height:
                      (MediaQuery.of(context).orientation.name == 'portrait')
                          ? 200
                          : 125,
                  width: 300,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                (MediaQuery.of(context).orientation.name == 'portrait')
                    ? const SizedBox(height: 16)
                    : const SizedBox(),
                Text(
                  'Welcome!', // Replace with your headliner text
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Sign in to continue to Reach', // Replace with your subheadliner text
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      constraints: BoxConstraints(
                        maxWidth: 350,
                      )),
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    constraints: BoxConstraints(
                      maxWidth: 350,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: borderButtonStyle(context, false).copyWith(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isLoginFailed = false; // Reset the login failed state
                    });
                    await _login(navigatorKey);
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 32),
                // Removed Face ID authentication for Demo Purposes
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       _enableFaceID ? 'Disable Face ID' : 'Enable Face ID',
                //       style: Theme.of(context).textTheme.bodySmall,
                //     ),
                //     Switch(
                //       value: _enableFaceID,
                //       onChanged: (_) {
                //         setState(() {
                //           _enableFaceID = !_enableFaceID;
                //         });
                //         if (_enableFaceID == true) {
                //           checkedID = 0;
                //         }
                //         secureStorage.write(
                //             key: 'faceID', value: _enableFaceID.toString());
                //       },
                //     ),
                //   ],
                // ),
                const SizedBox(height: 32),
                if (_isLoginFailed)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                    child: Text(
                      'Login failed. Improper Request.',
                      style: Theme.of(context).textTheme.labelSmall!,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
