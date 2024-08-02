import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:kolestrol/Bluetooth/globalbluetooth.dart';
import 'package:kolestrol/HomePage/HomePage2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:async/async.dart';
import 'package:tuple/tuple.dart';

class Tools extends StatefulWidget {
  const Tools({Key? key}) : super(key: key);

  @override
  State<Tools> createState() => _Tools();
}

class _Tools extends State<Tools> {
  late BluetoothConnection connection;
  final _formKey = GlobalKey<FormState>();
  final _cholesterolController = TextEditingController();
  final _hdlController = TextEditingController();
  final _heartrateController = TextEditingController();
  final _SPO2Controller = TextEditingController();
  final _noteController = TextEditingController();
  StreamController<BluetoothDiscoveryResult>? _streamController;
  static int ratarataheartrate = 0;
  static int rataratakolestrol = 0;
  static int ratarataspo = 0;
  bool _isLoading = false;
  bool _isChecked = false;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";

  Timer? _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  bool _autoAcceptPairingRequests = false;
  late StreamSubscription<Uint8List> _streamSubscription;

  bool _listeningEnabled =
      false; // Flag to enable listening to Bluetooth stream

  List<int> _heartRateValues = [];
  List<int> _spo2Values = [];
  List<int> _cholesterolValues = [];

  // To store the unit or attribute part of the string
  String _heartRateUnit = '';
  String _spo2Unit = '';
  String _cholesterolUnit = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeBluetoothListeners();
  }

  void _initializeBluetoothListeners() {
    // Initialize Bluetooth state listener
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    // Listen for Bluetooth state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
        // Reset discoverable mode timer when Bluetooth state changes
        _discoverableTimeoutTimer = null;
        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startListeningToStream() async {
    _streamSubscription =
        globalBluetoothConnection!.input!.listen((Uint8List data) {
      String decodedData = utf8.decode(data);
      print('Received data: $decodedData');
      // Handle received data here
      try {
        var values = _parseData(decodedData);

        String? heartRate = values['Heart Rate'];
        String? spo2 = values['SpO2'];
        String? cholesterol = values['Cholesterol'];

        if (heartRate != null) {
          var result = extractAndConvert(heartRate);
          _heartRateValues.add(result.item1);
          _heartRateUnit = result.item2;
        }
        if (spo2 != null) {
          var result = extractAndConvert(spo2);
          _spo2Values.add(result.item1);
          _spo2Unit = result.item2;
        }
        if (cholesterol != null) {
          var result = extractAndConvert(cholesterol);
          _cholesterolValues.add(result.item1);
          _cholesterolUnit = result.item2;
        }
      } catch (e) {
        print('Error parsing data: $e');
      }
    });
  }

  Map<String, String> _parseData(String data) {
    Map<String, String> values = {};
    List<String> parts = data.split(', ');

    for (var part in parts) {
      List<String> keyValue = part.split(':');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        values[key] = value;
      }
    }

    return values;
  }

  Tuple2<int, String> extractAndConvert(String input) {
    RegExp regExp = RegExp(r'(\d+)');
    Match? match = regExp.firstMatch(input);

    if (match != null) {
      String matchedDigits = match.group(0)!;
      int number = int.parse(matchedDigits);
      String unit = input.replaceFirst(matchedDigits, '').trim();
      return Tuple2(number, unit);
    } else {
      throw FormatException("No digits found in input string");
    }
  }

  void performCheck() async {
    // Set loading state
    setState(() {
      _isLoading = true;
    });

    // Enable listening to stream
    if (!_listeningEnabled) {
      _startListeningToStream();
      _listeningEnabled = true;
    }

    // Clear previous values
    _heartRateValues.clear();
    _spo2Values.clear();
    _cholesterolValues.clear();

    // Listen to stream for 10 seconds
    await Future.delayed(Duration(seconds: 10));

    // Calculate averages of the 4 best values
    int averageHeartRate =
        _calculateBestAverage(_heartRateValues, 'Heart Rate');
    int averageSpO2 = _calculateBestAverage(_spo2Values, 'SpO2');
    int averageCholesterol =
        _calculateBestAverage(_cholesterolValues, 'Cholesterol');

    setState(() {
      ratarataheartrate = averageHeartRate;
      rataratakolestrol = averageCholesterol;
      ratarataspo = averageSpO2;
    });

    // Update text controllers with averages and unit/attribute
    _heartrateController.text =
        '${averageHeartRate.toStringAsFixed(0)} $_heartRateUnit';
    _SPO2Controller.text = '${averageSpO2.toStringAsFixed(0)} $_spo2Unit';
    _cholesterolController.text =
        '${averageCholesterol.toStringAsFixed(0)} $_cholesterolUnit';

    // Reset loading state and set checked flag
    setState(() {
      _isLoading = false;
      _isChecked = true;
    });
  }

  int _calculateBestAverage(List<int> values, String type) {
    if (values.length < 4) return 0;

    values.sort((a, b) => b.compareTo(a)); // Sorting in descending order
    List<int> bestValues = values.take(4).toList();
    print('Best 4 values for $type: $bestValues');
    double sum = bestValues.fold(0, (previous, current) => previous + current);
    int average = (sum / bestValues.length).floor();

    // Print average of best values for debugging
    print('Average of best 4 values for $type: $average');
    return average;
  }

  Future<void> saveToFirestore(
      int heartRate, int spo2, int cholesterol, String note) async {
    try {
      await FirebaseFirestore.instance.collection('health_measurements').add({
        'heart_rate': heartRate,
        'spo2': spo2,
        'cholesterol': cholesterol,
        'note': note,
        'timestamp': FieldValue.serverTimestamp(),
        'dateTime': DateTime.now(), // Menambahkan field DateTime
      });
      print("Data berhasil disimpan ke Firestore");
    } catch (e) {
      print("Gagal menyimpan data ke Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1FFFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20, top: MediaQuery.of(context).padding.top + 30),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFADE2D8),
                    ),
                    child: Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE1FFFA),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded,
                              size: 18, color: Color(0xFFADE2D8)),
                          onPressed: () {
                            globalBluetoothConnection = null;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isLoading)
                            const SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF19A082),
                                ),
                                strokeWidth: 8.0,
                              ),
                            )
                          else if (_isChecked)
                            const Image(
                              image: AssetImage('assets/image/check.png'),
                              width: 130,
                              height: 130,
                            )
                          else
                            const Image(
                              image: AssetImage('assets/image/check-first.png'),
                              width: 130,
                              height: 130,
                            ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      ElevatedButton(
                        onPressed: () {
                          performCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          minimumSize: const Size(95, 40),
                          backgroundColor: const Color(0xFF19A082),
                        ),
                        child: const Text(
                          'Check',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Kolestrol Total mg/dl',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 180.0,
                                      child: TextFormField(
                                        controller: _cholesterolController,
                                        decoration: const InputDecoration(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Kolestrol tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Heart Rate',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 180.0,
                                      child: TextFormField(
                                        controller: _heartrateController,
                                        decoration: const InputDecoration(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Heart Rate tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'SPO2',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 180.0,
                                      child: TextFormField(
                                        controller: _SPO2Controller,
                                        decoration: const InputDecoration(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'SPO2 tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40.0),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _streamSubscription.cancel();
                                      if (_formKey.currentState!.validate()) {
                                        // Lakukan tindakan setelah form valid
                                        print(
                                            'Kolestrol: ${_cholesterolController.text}');
                                        print(
                                            'Heart rate: ${_heartrateController.text}');
                                        print('SPO2: ${_SPO2Controller.text}');
                                        print('Note: ${_noteController.text}');
                                      }
                                      DatabaseReference ref = FirebaseDatabase
                                          .instance
                                          .ref("sensor");
                                      ref.set({
                                        "Total Kolesterol": rataratakolestrol,
                                        "Heart Rate": ratarataheartrate,
                                        "SPO2": ratarataspo,
                                      }).then((value) {
                                        saveToFirestore(
                                            ratarataheartrate,
                                            ratarataspo,
                                            rataratakolestrol,
                                            "whatever");
                                        DatabaseReference ref2 =
                                            FirebaseDatabase.instance
                                                .ref("kolesterol");
                                        ref2.push().set({
                                          "Date":
                                              "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                                          "Time":
                                              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                                          "Total Kolesterol": rataratakolestrol,
                                          "Heart Rate": ratarataheartrate,
                                          "SPO2": ratarataspo,
                                        }).then((value) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ),
                                          );
                                        });
                                      }).catchError((e) => {
                                            print(
                                                "data tidak masuk ke firebase")
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      minimumSize: const Size(390, 80),
                                      backgroundColor: const Color(0xFF19A082),
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
