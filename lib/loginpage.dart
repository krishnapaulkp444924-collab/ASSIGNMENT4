import 'package:flutter/material.dart';
import 'package:assignment4/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.purple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),

                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(25),

                      child: Form(
                        key: _formKey,

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),

                            const Icon(
                              Icons.lock_outline,
                              size: 80,
                              color: Colors.blue,
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const Text(
                              "Login to your account",
                              style: TextStyle(color: Colors.blue),
                            ),

                            const SizedBox(height: 25),

                            // EMAIL
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.black),
                                prefixIcon: const Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSaved: (v) => email = v!,
                            ),

                            const SizedBox(height: 15),

                            // PASSWORD
                            TextFormField(
                              obscureText: _obscure,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscure = !_obscure;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSaved: (v) => password = v!,
                            ),

                            const SizedBox(height: 25),

                            // LOGIN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),

                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Login Successful "),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                },

                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // NAVIGATION
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Don't have an account? Create Account",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
