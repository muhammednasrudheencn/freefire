import 'package:flutter/material.dart';
import 'package:freefire/Screens/home.dart';
import 'package:freefire/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('LOGIN'),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _usernamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Username'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  controller: _passwordcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        checklogin(context);
                      }
                    },
                    icon: const Icon(Icons.chevron_right),
                    label: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext context) async {
    if (_usernamecontroller.text == _passwordcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(30),
          backgroundColor: Colors.green,
          content: Text('Login success')));
      final sharedprefs = await SharedPreferences.getInstance();
      await sharedprefs.setBool(savekey, true);
      //go to home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return Homescreen();
      }));
    } else {
      final _error = 'username and password does not match';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(30),
          content: Text(_error)));
    }
  }
}
