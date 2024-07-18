import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0, top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 40.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forgot Your Password?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Input Your Email',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB8B8B8),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFFB8B8B8),
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF30A47B)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF30A47B)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF30A47B)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        isCollapsed: true,
                      ),
                    ),
                    const SizedBox(height: 400.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add your logic here for sending password reset email
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(430, 60),
                        backgroundColor: const Color(0xFF19A082),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
