import 'package:flutter/material.dart';
import 'package:flutter_catalog/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // final name; is public which is usefulness entire the program
  // final _name; is private which is not usefulness entire the program
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  // ignore: strict_top_level_inference
  navigateToPage(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      changedButton = true;
    });
    await Future.delayed(Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changedButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70),
            Image.asset(
              "assets/images/signup.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(height: 10, width: 20, child: Text("Spacing")),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else if (value.length < 8) {
                          return "Value must be at least 8 characters";
                        }

                        return null; // ✅ Input is valid
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else if (value.length < 8) {
                          return "Value must be at least 8 characters";
                        }

                        return null; // ✅ Input is valid
                      },
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.deepPurple,
              child: InkWell(
                onTap: () => navigateToPage(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: changedButton ? 50 : 140,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  child: changedButton
                      ? Icon(Icons.done, color: Colors.yellow)
                      : Text(
                          "Login Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
