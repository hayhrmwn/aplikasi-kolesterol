import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice server;

  const ChatPage({required Key key, required this.server}) : super(key: key);

  @override
  _ChatPageState createState() => new _ChatPageState();
}

class _Message {
  int whom;
  String text;

  _Message(this.whom, this.text);
}

class _ChatPageState extends State<ChatPage> {
  static final clientID = 0;
  late BluetoothConnection connection;

  List<_Message> messages = [];
  String _messageBuffer = '';

  final TextEditingController textEditingController =
      new TextEditingController();
  final ScrollController listScrollController = new ScrollController();

  late StreamSubscription<BluetoothDiscoveryResult>
      _discoveryStreamSubscription;

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection.input?.listen(_onDataReceived).onDone(() {
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occurred');
      print(error);
    });
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null!;
    }
    _discoveryStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isConnecting
            ? 'Connecting chat to ${widget.server.name}...'
            : isConnected
                ? 'Live chat with ${widget.server.name}'
                : 'Chat log with ${widget.server.name}'),
      ),
      body: SafeArea(
        child: isConnecting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : isConnected
                ? buildChat()
                : Center(
                    child: Text('Chat got disconnected'),
                  ),
      ),
    );
  }

  Widget buildChat() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          child: FittedBox(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: isConnected ? () => _sendMessage('1') : null,
                  child: ClipOval(child: Image.asset('images/ledOn.png')),
                ),
                ElevatedButton(
                  onPressed: isConnected ? () => _sendMessage('0') : null,
                  child: ClipOval(child: Image.asset('images/ledOff.png')),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.all(12.0),
            controller: listScrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      message.text.trim() == '/shrug'
                          ? '¯\\_(ツ)_/¯'
                          : message.text,
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    width: 222.0,
                    decoration: BoxDecoration(
                      color: message.whom == clientID
                          ? Colors.blueAccent
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ],
                mainAxisAlignment: message.whom == clientID
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
              );
            },
          ),
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  style: const TextStyle(fontSize: 15.0),
                  controller: textEditingController,
                  decoration: InputDecoration.collapsed(
                    hintText: isConnected
                        ? 'Type your message...'
                        : 'Chat got disconnected',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  enabled: isConnected,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: isConnected
                    ? () => _sendMessage(textEditingController.text)
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onDataReceived(Uint8List data) {
    // Implementation of data processing
  }

  void _sendMessage(String text) async {
    text = text.trim();
    textEditingController.clear();

    if (text.length > 0 && connection != null) {
      try {
        connection!.output.add(utf8.encode(text + "\r\n"));
        await connection!.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        Future.delayed(Duration(milliseconds: 333)).then((_) {
          listScrollController.animateTo(
            listScrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 333),
            curve: Curves.easeOut,
          );
        });
      } catch (e) {
        // Handle error
        print(e.toString());
      }
    }
  }
}
