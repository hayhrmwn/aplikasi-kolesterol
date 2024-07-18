import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kolestrol/Information/info.dart';

class TDS extends StatefulWidget {
  const TDS({Key? key}) : super(key: key);

  @override
  State<TDS> createState() => _TDS();
}

class _TDS extends State<TDS> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("sensor");
  late String cholesterolStatus = 'tidak ada data';

  @override
  void initState() {
    super.initState();
    hasiltes();
  }

  void hasiltes() {
    ref.child('Total Kolesterol').onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.exists) {
        setState(() {
          int cholesterolLevel = int.parse(snapshot.value.toString());
          if (cholesterolLevel < 200) {
            cholesterolStatus = 'normal';
          } else if (cholesterolLevel >= 200 && cholesterolLevel < 240) {
            cholesterolStatus = 'warning';
          } else if (cholesterolLevel >= 240) {
            cholesterolStatus = 'high';
          }
        });
        print('Total Kolesterol: ${snapshot.value}');
      } else {
        setState(() {
          cholesterolStatus = 'tidak ada data';
        });
        print('No data available for Total Kolesterol.');
      }
    }, onError: (error) {
      print('Error getting data for Total Kolesterol: $error');
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded,
                              size: 18, color: Color(0xFFADE2D8)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InfoPage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Tips dan Saran",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF001377)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 350,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Saat ini kolesterol anda : $cholesterolStatus',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w200,
                        height: 0.11,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 130),
            if (cholesterolStatus == 'tidak ada data')
              Column(
                children: [
                  Container(
                    width: 154,
                    height: 154,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/image/no-data.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 262,
                    height: 30,
                    child: const Text(
                      'No level Cholesterol Available',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 0), // Beri jarak antara teks
                  Container(
                    width: 239,
                    height: 10,
                    child: const Text(
                      'You should have status level for cholesterol',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w200,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              )
            else
              CholesterolScreen(status: cholesterolStatus),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: hasiltes,
              child: const Text('Check Cholesterol'),
            )
          ],
        ),
      ),
    );
  }
}

class CholesterolScreen extends StatelessWidget {
  final String status;

  const CholesterolScreen({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getStatusColor() {
      switch (status) {
        case 'warning':
          return const Color.fromARGB(255, 217, 202, 63);
        case 'normal':
          return const Color(0xFF8BC34A);
        case 'high':
          return const Color(0xFFE57373);
        default:
          return Colors.white;
      }
    }

    String getStatusText() {
      switch (status) {
        case 'warning':
          return 'Warning';
        case 'normal':
          return 'Normal';
        case 'high':
          return 'Tinggi';
        default:
          return 'tidak ada data';
      }
    }

    List<String> getStatusTips() {
      switch (status) {
        case 'warning':
          return [
            'Kurangi konsumsi makanan berlemak.',
            'Perbanyak makan sayuran dan buah.',
            'Olahraga secara teratur.'
          ];
        case 'normal':
          return [
            'Pertahankan pola makan sehat.',
            'Lanjutkan olahraga rutin.',
            'Periksa kesehatan secara berkala.'
          ];
        case 'high':
          return [
            'Hindari makanan tinggi kolesterol.',
            'Konsultasikan dengan dokter untuk pengobatan.',
            'Lakukan perubahan gaya hidup sehat.'
          ];
        default:
          return ['Tidak ada tips yang tersedia.'];
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Container(
          width: 350,
          height: 50,
          decoration: ShapeDecoration(
            color: getStatusColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Saat ini kolesterol anda : ${getStatusText()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w200,
                    height: 0.11,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: 350,
          decoration: ShapeDecoration(
            color: getStatusColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Langkah Mudah Menjaga Kolesterol ${getStatusText()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                for (String tip in getStatusTips())
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      '- $tip',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
