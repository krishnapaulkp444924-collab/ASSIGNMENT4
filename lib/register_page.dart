import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  bool _obscurePassword = true;

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
                          const Icon(
                            Icons.person_add,
                            size: 70,
                            color: Colors.blue,
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            "Register to continue",
                            style: TextStyle(color: Colors.blue),
                          ),

                          const SizedBox(height: 25),

                          // NAME
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.blue.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onSaved: (v) => name = v!,
                          ),

                          const SizedBox(height: 15),

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
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
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

                          // REGISTER BUTTON
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
                                      content: Text("Registration Successful "),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },

                              child: const Text(
                                "Register",
                                style: TextStyle(fontSize: 18),
                              ),
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
    );
  }
}
