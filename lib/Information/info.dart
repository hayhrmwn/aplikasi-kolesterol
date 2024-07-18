import 'package:flutter/material.dart';
import 'package:kolestrol/HomePage/HomePage2.dart';
import 'package:kolestrol/profile/Profile.dart';
import 'package:kolestrol/Information/info/CTI.dart';
//Di Scroll
import 'package:kolestrol/Information/info/AIK.dart';
import 'package:kolestrol/Information/info/DKB.dart';
import 'package:kolestrol/Information/info/ITIK.dart';
import 'package:kolestrol/Information/info/KHTK.dart';
import 'package:kolestrol/Information/info/PTK.dart';
import 'package:kolestrol/Information/info/TDS.dart';
import 'package:firebase_database/firebase_database.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  var nama = "";
  void namainput() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('name').child('Name').get();
    if (snapshot.exists) {
      nama = snapshot.value.toString();
    } else {
      print('No data available.');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    namainput();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Hi, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                nama,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: 327,
            height: 50,
            decoration: ShapeDecoration(
              color: const Color(0xFF41A190),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Cholesterol Test Indicators',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: -0.28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IndicatorTes()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  buildInfoCard(
                    backgroundColor: const Color(0xFFFFF8C0),
                    title: 'Apa itu kolesterol ?',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AIK()),
                      );
                    },
                  ),
                  buildInfoCard(
                    backgroundColor: const Color(0xFFC7FF7F),
                    title: 'Darimana kolesterol berasal ?',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DKB()),
                      );
                    },
                  ),
                  buildInfoCard(
                    backgroundColor: const Color(0xFF5AFFB0),
                    title: 'Informasi tentang indikator kolesterol',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ITIK()),
                      );
                    },
                  ),
                  buildInfoCard(
                    backgroundColor: const Color(0xFF7EEFFF),
                    title: 'Pengukuran tes kolesterol',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PTK()),
                      );
                    },
                  ),
                  buildInfoCard(
                    backgroundColor: const Color(0xFF6691FF),
                    title: 'Kenapa harus tes kolesterol ?',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const KHTK()),
                      );
                    },
                  ),
                  // buildInfoCard(
                  //   backgroundColor: const Color(0xFFFFF8C0),
                  //   title: 'Tips dan Saran',
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const TDS()),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
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
                // Do nothing, already on the InfoPage
              },
            ),
            IconButton(
              icon: const Icon(Icons.grid_view_rounded,
                  size: 30, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required Color backgroundColor,
    required String title,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            Container(
              width: 327,
              height: 75,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: Colors.white),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 15,
              top: 15,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ), // Warna putih
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              bottom: 20,
              top: 20,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    height: 0.11,
                    letterSpacing: -0.28,
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
