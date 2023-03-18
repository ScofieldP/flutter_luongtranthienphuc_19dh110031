import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/user.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/home_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/register/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
    _getData();
  }

  void _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username").isEmpty) {
      _usernameController.text = prefs.getString('username');
      _passwordController.text = prefs.getString("password");
      _value = prefs.getBool('check');
      // print(_value.toString());
    }
  }

  void navigateToHomeScreen() {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Food Now",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign in with your email and password \nor continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value) {
                        // return Utils.validatePassword(value);
                      },
                      onSaved: (_value) {
                        setState(() {
                          _usernameController.text = _value!;
                        });
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        // return Utils.validatePassword(value);
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_value) {
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'username', _usernameController.text);
                            prefs.setString(
                                "password", _passwordController.text);
                            prefs.setBool('check', _value);
                          } else {
                            prefs.remove("check");
                          }
                          navigateToHomeScreen;
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            // child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            // child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            // child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?", style: TextStyle(color: Colors.green, fontSize: 14),),
                        GestureDetector(
                          onTap: () async {
                           Navigator.pushNamed(context, RegisterScreen.routeName) ;
                            // User user = result;
                            // _usernameController.text = user.username;
                          },
                          child: const Text("Sign Up", style: TextStyle(color: Colors.redAccent, fontSize: 14), ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
