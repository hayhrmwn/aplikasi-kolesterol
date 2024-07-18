import 'package:flutter/material.dart';
import 'package:kolestrol/HomePage/HomePage2.dart';
import 'package:kolestrol/Information/info.dart';
import 'package:kolestrol/profile/FAQ.dart';
import 'package:kolestrol/profile/PP.dart';
import 'package:kolestrol/profile/ToF.dart';
import 'package:firebase_database/firebase_database.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfilePage();
}

class ProfilePage extends State<Profile> {
  var nama = "";
  var namainput = TextEditingController();

  @override
  void initState() {
    super.initState();
    tampilanama();
  }

  @override
  void dispose() {
    namainput.dispose();
    super.dispose();
  }

  void insertdata() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("name");
    await ref.set({"Name": namainput.text}).then((_) {
      Navigator.pop(context);
      namainput.clear();
      tampilanama();
    }).catchError((error) {
      print("Error: $error");
    });
  }

  void tampilanama() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('name').child('Name').get();
    if (snapshot.exists) {
      setState(() {
        nama = snapshot.value.toString();
      });
    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            SizedBox(
              height: 60,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Hallo, ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: nama,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFADE2D8),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                'Personal',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDADADA).withOpacity(0.31),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: ListTile(
                  title: const Text('Edit name:'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: const Color(0xFFD8EDEA),
                          content: SingleChildScrollView(
                            child: SizedBox(
                              width: 300,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Edit Profile Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    controller: namainput,
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      insertdata();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2BA88A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 40),
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFADE2D8),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                'Communication',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDADADA).withOpacity(0.31),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 5.0),
                      child: ListTile(
                        title: const Text('FAQ'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FAQ()),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 5.0),
                      child: ListTile(
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PP()),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 5.0),
                      child: ListTile(
                        title: const Text('Term of Services'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ToF()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('versi apl'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF41A190),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon:
                  const Icon(Icons.home_rounded, size: 33, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info, size: 30, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.grid_view_rounded,
                  size: 30, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
