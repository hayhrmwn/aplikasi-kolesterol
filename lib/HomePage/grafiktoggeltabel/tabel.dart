import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class Tabel extends StatefulWidget {
  const Tabel({Key? key}) : super(key: key);

  @override
  _TabelState createState() => _TabelState();
}

class _TabelState extends State<Tabel> {
  List<DataRow> data = [];

  @override
  void initState() {
    super.initState();
    statuslevel();
  }

  Future<void> _showDeleteConfirmationDialog(String itemKey) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan mengetuk di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Anda yakin ingin menghapus data ini?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: const Text('Hapus'),
              onPressed: () {
                // Hapus item dari Firebase menggunakan key
                DatabaseReference ref =
                    FirebaseDatabase.instance.ref("kolesterol");
                ref.child(itemKey).remove();
                Navigator.of(context)
                    .pop(); // Tutup dialog setelah penghapusan berhasil
              },
            ),
          ],
        );
      },
    );
  }

  void statuslevel() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("kolesterol");
    ref.onValue.listen((event) {
      final dataSnapshot = event.snapshot;
      final newData = <Map<String, dynamic>>[];

      // Assuming your data structure is a list of maps
      Map<dynamic, dynamic> values =
          dataSnapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        newData.add({
          'Key': key,
          'Date': value['Date'] ?? '',
          'Time': value['Time'] ?? '',
          'Total Kolesterol': value['Total Kolesterol'],
          'Heart Rate': value['Heart Rate'],
          'SPO2': value['SPO2'],
        });
      });

      // Convert Date and Time strings to DateTime objects and sort
      newData.sort((a, b) {
        DateTime dateTimeA = parseDateTime('${a['Date']} ${a['Time']}');
        DateTime dateTimeB = parseDateTime('${b['Date']} ${b['Time']}');
        return dateTimeB.compareTo(dateTimeA); // Sort in descending order
      });

      // Map sorted data to DataRow list
      final sortedDataRows = newData.map<DataRow>((value) {
        return DataRow(
          color: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (value['Total Kolesterol'] > 240) {
              return Colors.red.withOpacity(
                  0.2); // Set row background color to red with some opacity
            }
            return null; // Use default background color
          }),
          cells: [
            DataCell(Text(value['Date'])),
            DataCell(Text(value['Time'])),
            DataCell(
              Text(
                value['Total Kolesterol'].toString(),
                style: TextStyle(
                  color: getColorForCholesterol(value['Total Kolesterol']),
                ),
              ),
            ),
            DataCell(Text(value['Heart Rate'].toString())),
            DataCell(Text(value['SPO2'].toString())),
            DataCell(
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  String itemKey =
                      value['Key']; // Mengambil key dari data yang ditampilkan
                  _showDeleteConfirmationDialog(
                      itemKey); // Tampilkan dialog konfirmasi sebelum penghapusan
                },
              ),
            ),
          ],
        );
      }).toList();

      setState(() {
        data = sortedDataRows;
      });
    });
  }

  DateTime parseDateTime(String dateTimeStr) {
    final dateFormat = DateFormat('yyyy-M-d H:m:s');
    try {
      return dateFormat.parse(dateTimeStr);
    } catch (e) {
      print('Error parsing date: $e');
      return DateTime.now(); // Return current time if parsing fails
    }
  }

  Color getColorForCholesterol(int cholesterol) {
    if (cholesterol == 0) {
      return Colors
          .black; // Atau warna apa pun yang Anda inginkan untuk nilai 0
    } else if (cholesterol < 200) {
      return Colors.green;
    } else if (cholesterol >= 200 && cholesterol < 240) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          dataRowHeight: 50,
          columnSpacing: 20,
          columns: const [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Time')),
            DataColumn(label: Text('Total Kolesterol')),
            DataColumn(label: Text('Heart Rate')),
            DataColumn(label: Text('SPO2')),
            DataColumn(label: Text('Aksi')),
          ],
          rows: data,
        ),
      ),
    );
  }
}
