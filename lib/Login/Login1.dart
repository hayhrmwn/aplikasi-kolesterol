// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:kolestrol/HomePage/homepage2.dart';
import 'package:kolestrol/Login/Login2.dart';
import 'package:kolestrol/Register/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false; // State untuk menyimpan nilai Checkbox
  bool obscureText = true; // State untuk mengontrol visibilitas password

  // Fungsi yang akan dipanggil ketika nilai Checkbox berubah
  void onChangedCheckbox(bool? newValue) {
    if (newValue != null) {
      setState(() {
        rememberMe = newValue;
      });

      // Misalnya, jika rememberMe bernilai true, lakukan sesuatu
      if (rememberMe) {
        print('Remember me is checked');
        // Lakukan sesuatu di sini...
      } else {
        print('Remember me is unchecked');
        // Lakukan sesuatu di sini...
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/splash-screen.png',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(height: 59.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFFB8B8B8),
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: TextField(
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
                              vertical: 15.0,
                              horizontal: 20.0), // Inner padding
                          isCollapsed: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFFB8B8B8),
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: TextField(
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                              vertical: 15.0,
                              horizontal: 20.0), // Inner padding
                          isCollapsed: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0), // Icon padding
                            child: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          customCheckbox(rememberMe, onChangedCheckbox),
                          const SizedBox(width: 10.0),
                          const Text(
                            'Remember',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 64.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(390, 60),
                    backgroundColor: const Color(0xFF19A082),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(390, 60),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.0, color: Colors.green),
                  ),
                  child: const Text('Create Account',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customCheckbox(bool value, Function(bool?) onChanged) {
  return InkWell(
    onTap: () {
      onChanged(!value);
    },
    child: Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 2.0,
        ),
        color:
            value ? Colors.grey : Colors.transparent, // Fill color when checked
      ),
      child: value
          ? const Icon(
              Icons.check,
              size: 16.0,
              color: Colors.white, // Checkmark color
            )
          : null,
    ),
  );
}
