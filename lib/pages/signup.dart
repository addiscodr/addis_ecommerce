import 'package:addis_ecommerce/pages/bottom_nav.dart';
import 'package:addis_ecommerce/pages/home.dart';
import 'package:addis_ecommerce/pages/login.dart';
import 'package:addis_ecommerce/widgets/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  String? name, email, password;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _confirmPwController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void registration() async {
    if (name != null && email != null && password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Registration Successful!",
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Password is too weak!",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Account already exists!",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("images/login_image.png"),
                SizedBox(height: 40),
                Text("Sign Up", style: AppWidget.btnTextStyle()),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required!";
                      }
                      return null;
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "First Name",
                      prefixIcon: Icon(Icons.person_2_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required!";
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required!";
                      }
                      return null;
                    },
                    controller: _pwController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required!";
                      }
                      return null;
                    },
                    controller: _confirmPwController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Color(0xfffd6f3e),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = _nameController.text.trim();
                          email = _emailController.text.trim();
                          password = _pwController.text.trim();
                        });
                      }
                      registration();
                    },
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
