import 'package:flutter/material.dart';
import 'package:kolestrol/Information/info.dart';

class KHTK extends StatefulWidget {
  const KHTK({Key? key}) : super(key: key);

  @override
  State<KHTK> createState() => _KHTK();
}

class _KHTK extends State<KHTK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6691FF),
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
                          color: Color(0xFF6691FF),
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
                  const SizedBox(width: 53),
                  const Text(
                    "Kenapa harus tes kolesterol ?",
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
                child: const ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(53),
                    topRight: Radius.circular(53),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Tes kolesterol penting karena kadar kolesterol yang tinggi dalam darah adalah salah satu faktor risiko utama untuk penyakit jantung, serangan jantung, dan stroke. Berikut adalah beberapa alasan mengapa tes kolesterol penting:',
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
                            '1. Penilaian Risiko Penyakit Jantung: Tes kolesterol membantu dokter menilai risiko seseorang terkena penyakit jantung dan pembuluh darah. Kadar kolesterol yang tinggi, terutama kadar LDL yang tinggi, meningkatkan risiko terjadinya plak kolesterol di dalam arteri, yang dapat menyebabkan penyumbatan arteri dan penyakit jantung.',
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
                            '2. Deteksi Dini: Tes kolesterol dapat membantu mendeteksi masalah kolesterol sebelum terjadi gejala penyakit jantung atau pembuluh darah. Ini memungkinkan adanya tindakan pencegahan dan perubahan gaya hidup yang diperlukan untuk mengurangi risiko penyakit kardiovaskular.',
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
                            '3. Pengelolaan Kesehatan: Untuk individu dengan kadar kolesterol yang tinggi, tes kolesterol membantu dalam mengelola kesehatan mereka. Hasil tes memberikan informasi tentang efektivitas perubahan gaya hidup atau pengobatan dalam menurunkan kadar kolesterol.',
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
                            '4. Pemantauan Pengobatan: Bagi mereka yang telah didiagnosis dengan kadar kolesterol yang tinggi dan menerima pengobatan, tes kolesterol digunakan untuk memantau respons terhadap pengobatan dan memastikan bahwa tingkat kolesterol tetap dalam kisaran yang sehat.',
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
                            '5. Pencegahan: Melalui tes kolesterol, seseorang dapat mengetahui apakah mereka memiliki risiko tinggi untuk penyakit jantung dan mengambil langkah-langkah pencegahan yang sesuai, seperti perubahan pola makan, peningkatan aktivitas fisik, pengelolaan berat badan, dan penggunaan obat-obatan yang diresepkan.',
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
                            'Dengan demikian, tes kolesterol adalah alat penting dalam penilaian kesehatan jantung dan pembuluh darah, serta dalam pencegahan dan manajemen penyakit kardiovaskular. Disarankan untuk menjalani tes kolesterol secara teratur, terutama jika memiliki faktor risiko tertentu atau riwayat keluarga dengan penyakit jantung.',
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
            ),
          ],
        ),
      ),
    );
  }
}
