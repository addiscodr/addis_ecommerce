import 'package:addis_ecommerce/admin/home_admin.dart';
import 'package:addis_ecommerce/widgets/support_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Column(
            children: [
              Image.asset("images/login_image.png"),
              SizedBox(height: 40),
              Text("Admin Panel", style: AppWidget.btnTextStyle()),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xfff4f5f9),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
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
                  obscureText: true,
                  controller: _passwordController,
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
                  onTap: () => loginAdmin(),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginAdmin() {
    FirebaseFirestore.instance
        .collection("Admin")
        .get()
        .then(
          (snapshot) => {
            snapshot.docs.forEach((result) {
              if (result.data()['username'] !=
                  _usernameController.text.trim()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Incorrect ID!",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                );
              } else if (result.data()['password'] !=
                  _passwordController.text.trim()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Incorrect Password!",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAdmin()),
                );
              }
            }),
          },
        );
  }
}
