import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:kolestrol/Bluetooth/globalbluetooth.dart';
import 'package:kolestrol/Tools/Tools.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothHelper {
  static Future<void> requestPermissions() async {
    await Permission.bluetooth.request();
    await Permission.bluetoothConnect.request();
    await Permission.bluetoothScan.request();
  }
}

class BluetoothSearch extends StatefulWidget {
  const BluetoothSearch({super.key});

  @override
  _BluetoothSearchPage createState() => _BluetoothSearchPage();
}

class _BluetoothSearchPage extends State<BluetoothSearch> {
  FlutterBluetoothSerial flutterBluetoothSerial =
      FlutterBluetoothSerial.instance;
  List<BluetoothDevice> pairedDevicesList = [];
  List<BluetoothDiscoveryResult> availableDevicesList = [];
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  StreamController<BluetoothDiscoveryResult>? _streamController;
  Map<String, bool> isConnecting = {};

  @override
  void initState() {
    super.initState();
    fetchPairedDevices();
    startScan();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamController?.close();
    super.dispose();
  }

  void fetchPairedDevices() async {
    List<BluetoothDevice> devices = [];
    try {
      devices = await flutterBluetoothSerial.getBondedDevices();
    } catch (e) {
      print("Error fetching paired devices: $e");
    }
    setState(() {
      pairedDevicesList = devices;
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    setState(() {
      isConnecting[device.address] = true;
    });

    try {
      BluetoothConnection.toAddress(device.address).then((connection) {
        globalBluetoothConnection = connection;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Connection Status'),
              content: const Text('Device connected successfully'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tools(),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      });
    } catch (e) {
      setState(() {
        isConnecting[device.address] = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Connection Status'),
            content: const Text('Failed to connect to device'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    const reloadDuration = Duration(seconds: 3);
    Future.delayed(reloadDuration, () {
      setState(() {
        isConnecting[device.address] = false;
      });
    });
  }

  void startScan() {
    _streamSubscription?.cancel(); // Cancel previous subscription if exists
    _streamController = StreamController<BluetoothDiscoveryResult>.broadcast();
    _streamSubscription =
        flutterBluetoothSerial.startDiscovery().listen((result) {
      _streamController?.add(result);
    }, onError: (error) {
      print("Error during scan: $error");
    });

    Future.delayed(const Duration(seconds: 30), () {
      _streamSubscription?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Device List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Paired Device List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (pairedDevicesList.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: pairedDevicesList.length,
                  itemBuilder: (context, index) {
                    var device = pairedDevicesList[index];
                    return ListTile(
                      title: Text(device.name ?? 'Unknown device'),
                      subtitle: Text(device.address.toString()),
                      trailing: ElevatedButton(
                        onPressed: () {
                          connectToDevice(device);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF41A190),
                          minimumSize: const Size(100, 45),
                        ),
                        child: isConnecting[device.address] == true
                            ? const CircularProgressIndicator(
                                strokeCap: StrokeCap.round,
                                strokeWidth: 5,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                'Connect',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Available Device List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (_streamController != null)
              Expanded(
                child: StreamBuilder<BluetoothDiscoveryResult>(
                  stream: _streamController!.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      availableDevicesList.add(snapshot.data!);
                    }
                    return ListView.builder(
                      itemCount: availableDevicesList.length,
                      itemBuilder: (context, index) {
                        var result = availableDevicesList[index];
                        var device = result.device;
                        return ListTile(
                          title: Text(device.name ?? 'Unknown device'),
                          subtitle: Text(device.address.toString()),
                          trailing: ElevatedButton(
                            onPressed: () {
                              connectToDevice(device);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF41A190),
                              minimumSize: const Size(100, 45),
                            ),
                            child: isConnecting[device.address] == true
                                ? const CircularProgressIndicator(
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 5,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    'Connect',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
