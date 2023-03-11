import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/user.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            emailTextFormField(),
              const SizedBox(
              height: 30,
            ),
            passwordTextFormField(),
            const SizedBox(
              height: 30,
            ),
            confirmTextFormField(),

            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  if (_registerFormKey.currentState!.validate()) {
                    Navigator.pop(
                        context,
                        User(
                            username: _emailController.text,
                            password: _confirmController.text));
                  }
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
              height: 30,
            ),
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              // child: SvgPicture.asset("assets/icons/facebook-2.svg"),
            ),
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              // child: SvgPicture.asset("assets/icons/facebook-2.svg"),
            ),
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              // child: SvgPicture.asset("assets/icons/facebook-2.svg"),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined),
      ),
      // validator: Utils.validateEmail,
      onSaved: (value) {
        setState(() {
          _emailController.text = value!;
        });
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      controller: _passwordController,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      // validator: (passwordKey){
      //   return Utils.validatePassword(passwordKey);
      // },
    );
  }

  TextFormField confirmTextFormField() {
    return TextFormField(
      controller: _confirmController,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      validator: (confirmPassword) {
        var pass = _passKey.currentState!.value;
        // return Utils.conformPassword(confirmPassword, pass);
      },
      onSaved: (value) {
        setState(() {
          _confirmController.text = value!;
        });
      },
    );
  }
}
