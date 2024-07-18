import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:kolestrol/Tools/Tools.dart';
import 'package:kolestrol/Bluetooth/bluetooth.dart';

import '../Bluetooth2.dart'; // Import the file where permissions function is

class SelectBondedDevicePage extends StatefulWidget {
  final bool checkAvailability;
  final Function onCahtPage;

  const SelectBondedDevicePage(
      {this.checkAvailability = true, required this.onCahtPage});

  @override
  _SelectBondedDevicePageState createState() => _SelectBondedDevicePageState();
}

class _SelectBondedDevicePageState extends State<SelectBondedDevicePage> {
  List<_DeviceWithAvailability> devices = List<_DeviceWithAvailability>.empty();

  // Availability
  late StreamSubscription<BluetoothDiscoveryResult>
      _discoveryStreamSubscription;
  bool _isDiscovering = false;

  _SelectBondedDevicePageState();

  @override
  void initState() {
    super.initState();
    BluetoothHelper.requestPermissions().then((_) {
      _isDiscovering = widget.checkAvailability;
      if (_isDiscovering) {
        _startDiscovery();
      }

      FlutterBluetoothSerial.instance
          .getBondedDevices()
          .then((List<BluetoothDevice> bondedDevices) {
        setState(() {
          devices = bondedDevices
              .map((device) => _DeviceWithAvailability(
                  device,
                  widget.checkAvailability
                      ? _DeviceAvailability.maybe
                      : _DeviceAvailability.yes))
              .toList();
        });
      });
    });
  }

  void _restartDiscovery() {
    setState(() {
      _isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _discoveryStreamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        for (var _device in devices) {
          if (_device.device == r.device) {
            _device.availability = _DeviceAvailability.yes;
            _device.rssi = r.rssi;
          }
        }
      });
    });

    _discoveryStreamSubscription.onDone(() {
      setState(() {
        _isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    _discoveryStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BluetoothDeviceListEntry> list = devices
        .map((_device) => BluetoothDeviceListEntry(
              device: _device.device,
              onTap: () {
                widget.onCahtPage(_device.device);
              },
            ))
        .toList();
    return ListView(
      children: list,
    );
  }
}

enum _DeviceAvailability {
  no,
  maybe,
  yes,
}

class _DeviceWithAvailability extends BluetoothDevice {
  BluetoothDevice device;
  _DeviceAvailability availability;
  int rssi;

  _DeviceWithAvailability(this.device, this.availability, {this.rssi = 0})
      : super(address: device.address);
}

class BluetoothDeviceListEntry extends StatelessWidget {
  final BluetoothDevice device;
  final GestureTapCallback? onTap;

  const BluetoothDeviceListEntry({required this.device, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(device.name ?? "Unknown device"),
      subtitle: Text(device.address),
      onTap: onTap,
    );
  }
}
