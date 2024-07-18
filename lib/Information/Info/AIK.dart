import 'package:flutter/material.dart';
import 'package:kolestrol/Information/info.dart';

class AIK extends StatefulWidget {
  const AIK({Key? key}) : super(key: key);

  @override
  State<AIK> createState() => _AIK();
}

class _AIK extends State<AIK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C0),
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
                          color: Color(0xFFFFF9C0),
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
                  const SizedBox(width: 83),
                  const Text(
                    "Apa itu Kolesterol ?",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF001377)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(53),
                    topRight: Radius.circular(53),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 45),
                        Text(
                          'Kolesterol adalah zat lemak yang ditemukan dalam darah dan juga di dalam sel-sel tubuh manusia. Meskipun sering kali dianggap sebagai sesuatu yang buruk, kolesterol sebenarnya sangat penting untuk fungsi tubuh yang sehat. Ini terutama berperan dalam pembentukan membran sel, produksi hormon seperti estrogen dan testosteron, serta sintesis vitamin D.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Kolesterol bergerak dalam darah dalam bentuk partikel kecil yang disebut lipoprotein. Ada dua jenis utama lipoprotein yang membawa kolesterol:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. LDL (Low-Density Lipoprotein): Dikenal sebagai "kolesterol jahat" karena dapat menumpuk di dinding arteri dan menyebabkan penyempitan arteri. Ini meningkatkan risiko penyakit jantung dan stroke.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '2. HDL (High-Density Lipoprotein): Disebut sebagai "kolesterol baik" karena membantu membersihkan kolesterol berlebih dari dinding arteri dan mengangkutnya kembali ke hati untuk dikeluarkan dari tubuh. HDL membantu melindungi terhadap penyakit jantung.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Kolesterol diproduksi oleh hati dan juga dapat ditemukan dalam makanan, terutama dalam makanan yang tinggi lemak jenuh dan kolesterol seperti daging, telur, dan produk susu. Ketidakseimbangan kolesterol, terutama kadar LDL yang tinggi dan kadar HDL yang rendah, dapat meningkatkan risiko penyakit jantung dan pembuluh darah.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Oleh karena itu, penting untuk menjaga keseimbangan yang baik antara kedua jenis kolesterol ini dan mengadopsi gaya hidup sehat, termasuk diet seimbang, olahraga teratur, dan menghindari merokok, untuk menjaga kadar kolesterol dalam kisaran yang sehat. Jika diperlukan, dokter dapat meresepkan obat-obatan untuk membantu mengontrol kadar kolesterol.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
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
