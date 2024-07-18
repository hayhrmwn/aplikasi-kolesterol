import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:kolestrol/Bluetooth/Bluetooth.dart';
import 'package:kolestrol/Bluetooth/Bluetooth2.dart';
import 'package:kolestrol/Bluetooth/globalbluetooth.dart';
import 'package:kolestrol/HomePage/grafiktoggeltabel/tabel.dart';
import 'package:kolestrol/HomePage/level/colestrole.dart';
import 'package:kolestrol/Information/info.dart';
import 'package:kolestrol/Tools/Tools.dart';
import 'package:kolestrol/profile/profile.dart';
import 'package:firebase_database/firebase_database.dart';

// plugins
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  FlutterBluetoothSerial flutterBluetoothSerial =
      FlutterBluetoothSerial.instance;
  late DateTime currentDate;
  int? cholesterolLevel;
  static DatabaseReference ref = FirebaseDatabase.instance.ref("sensor");
  var nama = "";
  @override
  void initState() {
    super.initState();
    if (globalBluetoothConnection != null) {
      globalBluetoothConnection
          ?.close()
          .then((value) => {globalBluetoothConnection = null});
    }

    namainput();
    tampilanlevel();
    currentDate = DateTime.now();
  }

  Future<bool> checkBluetoothConnection() async {
    if (globalBluetoothConnection != null) {
      return true;
    }
    return false;
  }

  void tampilanlevel() {
    // Mendengarkan perubahan data secara real-time pada child 'Total Kolesterol'
    ref.child('Total Kolesterol').onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.exists) {
        setState(() {
          cholesterolLevel = int.parse(snapshot.value.toString());
        });
        print('Total Kolesterol: ${snapshot.value}');
      } else {
        setState(() {
          cholesterolLevel = null;
        });
        print('No data available for Total Kolesterol.');
      }
    }, onError: (error) {
      print('Error getting data for Total Kolesterol: $error');
    });

    // Debugging: Print the entire snapshot when there are any changes in 'sensor' node
    ref.onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.exists) {
        print('Full snapshot: ${snapshot.value}');
      } else {
        print('No data available at all.');
      }
    }, onError: (error) {
      print('Error getting data: $error');
    });
  }

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

  // Fungsi untuk menampilkan tanggal sebelumnya
  void showPreviousDate() {
    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 7));
    });
  }

  // Fungsi untuk menampilkan tanggal sesudahnya
  void showNextDate() {
    setState(() {
      currentDate = currentDate.add(const Duration(days: 7));
    });
  }

  void showCalendar(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  bool isWeekSelected = true;

  bool isOn = false;

  void toggleIsOn() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime startDate = isWeekSelected
        ? currentDate
        : DateTime(currentDate.year, currentDate.month, 1);
    DateTime endDate = isWeekSelected
        ? startDate.add(const Duration(days: 6))
        : DateTime(currentDate.year, currentDate.month + 1, 0);

    String formattedDate = DateFormat('d MMM').format(startDate) +
        ' - ' +
        DateFormat('d MMM').format(endDate);

    return Scaffold(
      backgroundColor: const Color(0xFFE1FFFA),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              height: 20,
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
              width: 310,
              height: 48,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF41A190)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: cholesterolLevel == null
                  ? const CircularProgressIndicator()
                  : CholesterolStatusWidget(
                      cholesterolLevel: cholesterolLevel!,
                    ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(61),
                    topRight: Radius.circular(61),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0), // Optional padding
                  child: Tabel(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool isConnected = await checkBluetoothConnection();
          if (isConnected) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Tools(),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Padding(
                    padding: EdgeInsets.only(
                        top: 50, bottom: 20, left: 30, right: 30),
                    child: Text(
                      'To check cholesterol, you need to connect via Bluetooth.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        height:
                            1.2, // Mengatur tinggi teks agar menjorok ke bawah
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BluetoothSearch()),
                        );
                      },
                      child: const Text(
                        'Click here',
                        style: TextStyle(
                          color: Color(0xFFADE2D8),
                          fontSize: 14,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
        backgroundColor: const Color(0xFF41A190),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
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
              onPressed: () {},
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
}

class ShapeDecorationWidget extends StatelessWidget {
  final String formattedDate;
  final VoidCallback onLeftArrowPressed;
  final VoidCallback onRightArrowPressed;
  final VoidCallback onCalendarPressed;

  const ShapeDecorationWidget({
    required this.formattedDate,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
    required this.onCalendarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded,
                size: 17, color: Colors.black),
            onPressed: onLeftArrowPressed,
          ),
          const SizedBox(width: 5.0),
          InkWell(
            onTap: onCalendarPressed,
            child: Row(
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 11.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5.0),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_rounded,
                size: 17, color: Colors.black),
            onPressed: onRightArrowPressed,
          ),
        ],
      ),
    );
  }
}
