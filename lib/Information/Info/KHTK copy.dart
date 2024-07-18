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
      backgroundColor: const Color(0xFF7EEFFF),
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
                          color: Color(0xFF7EEFFF),
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
                    "Pengukuran tes kolesterol",
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
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 120,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 45),
                            Text(
                              'Tes kolesterol adalah prosedur medis untuk mengukur jumlah kolesterol dalam darah seseorang. Tes ini penting untuk menilai risiko penyakit jantung dan pembuluh darah serta membantu dalam diagnosis dan manajemen kondisi kesehatan tertentu. Berikut adalah penjelasan umum tentang prosedur pengukuran tes kolesterol:',
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
                              '1. Persiapan: Sebelum menjalani tes kolesterol, seringkali dokter akan meminta pasien untuk berpuasa selama minimal 8-12 jam sebelum pengambilan sampel darah. Ini bertujuan untuk mendapatkan hasil yang akurat, terutama untuk mengukur kadar kolesterol LDL dan trigliserida.',
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
                              '2. Pengambilan Sampel Darah: Tes kolesterol melibatkan pengambilan sampel darah dari pembuluh darah di lengan, biasanya di lengan atas. Seorang perawat atau teknisi medis akan menggunakan jarum suntik untuk mengambil sejumlah kecil darah, yang kemudian akan dianalisis di laboratorium.',
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
                              '3. Pengukuran Kolesterol: Sampel darah kemudian dianalisis di laboratorium untuk menentukan tingkat kolesterol total, HDL, LDL, dan trigliserida. Hasilnya biasanya dilaporkan dalam satuan milligram per desiliter (mg/dL) darah.',
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
                              '4. Interpretasi Hasil: Hasil tes kolesterol akan menunjukkan tingkat kolesterol total, HDL, LDL, dan trigliserida. Dokter akan mengevaluasi hasil tes ini untuk menilai risiko penyakit jantung dan pembuluh darah. Umumnya, tujuan adalah untuk memiliki kadar kolesterol total dan LDL yang rendah, serta kadar HDL yang tinggi.',
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
                              '5. Konsultasi dengan Dokter: Setelah mendapatkan hasil tes kolesterol, dokter akan membahas hasilnya dengan pasien dan memberikan rekomendasi berdasarkan profil kesehatan dan faktor risiko individu. Ini mungkin meliputi perubahan gaya hidup seperti diet sehat, olahraga teratur, pengurangan berat badan, dan jika diperlukan, penggunaan obat-obatan.',
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
                              'Tes kolesterol adalah alat penting dalam penilaian kesehatan jantung dan pembuluh darah, dan dapat membantu dalam pencegahan dan manajemen penyakit kardiovaskular. Disarankan untuk memeriksakan kadar kolesterol secara teratur, terutama jika memiliki riwayat keluarga dengan penyakit jantung atau faktor risiko lainnya.',
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
