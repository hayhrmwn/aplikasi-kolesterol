import 'package:flutter/material.dart';
import 'package:kolestrol/profile/profile.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQ();
}

class _FAQ extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFADE2D8),
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
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFADE2D8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded,
                              size: 18, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                        ),
                      ),
                    ),
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
                            '1. Apa itu aplikasi "Pengembangan Alat Deteksi Kolesterol"?',
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
                            '2. Aplikasi "Pengembangan Alat Deteksi Kolesterol" adalah sebuah platform yang dirancang untuk membantu pengguna dalam mendeteksi kadar kolesterol dalam tubuh secara cepat dan akurat menggunakan teknologi terkini.',
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
                            '3. Bagaimana cara kerja aplikasi ini?',
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
                            '4. Aplikasi ini bekerja dengan mengintegrasikan teknologi sensor kolesterol yang terhubung dengan perangkat smartphone. Pengguna dapat menggunakan aplikasi ini untuk melakukan pengukuran kadar kolesterol dalam darah mereka dengan hanya memindai sensor tersebut melalui aplikasi.',
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
                            '5. Apakah aplikasi ini dapat menggantikan pemeriksaan medis yang dilakukan oleh dokter?',
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
                            '6. Meskipun aplikasi ini memberikan informasi yang berharga tentang kadar kolesterol, kami menekankan bahwa hasilnya bukanlah diagnosis medis. Kami mendorong pengguna untuk berkonsultasi dengan dokter atau profesional kesehatan untuk evaluasi lebih lanjut.',
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
                            '7. Bagaimana cara menggunakan aplikasi ini?',
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
                            '8. Pengguna cukup membuka aplikasi, mengaktifkan sensor kolesterol yang terhubung, dan mengikuti petunjuk untuk melakukan pengukuran. Hasilnya akan ditampilkan secara langsung di aplikasi.',
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
                            '9. Apakah aplikasi ini gratis?',
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
                            '10. Saat ini, aplikasi ini tersedia secara gratis untuk diunduh dan digunakan. Namun, mungkin ada biaya terkait dengan akuisisi sensor kolesterol yang diperlukan untuk penggunaan aplikasi',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Pertanyaan Teknis:',
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
                            '1. Apakah aplikasi ini kompatibel dengan semua jenis smartphone?',
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
                            '2. Aplikasi ini dirancang untuk kompatibilitas yang luas dengan smartphone yang mendukung teknologi sensor dan memiliki sistem operasi yang diperlukan. Namun, sebaiknya periksa persyaratan sistem sebelum mengunduh.',
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
                            '3. Berapa akurasi pengukuran yang diberikan oleh aplikasi ini?',
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
                            '4. Aplikasi ini telah diuji secara menyeluruh untuk memastikan akurasi yang tinggi dalam pengukuran kadar kolesterol. Namun, perlu diingat bahwa hasilnya dapat dipengaruhi oleh faktor-faktor seperti penggunaan yang benar dan kondisi lingkungan.',
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
                            '5. Apakah aplikasi ini memerlukan koneksi internet?',
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
                            '6. Aplikasi ini dapat digunakan secara mandiri tanpa koneksi internet. Namun, jika Anda ingin menyimpan atau membagikan hasil pengukuran, koneksi internet diperlukan.',
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
                            '7. Bagaimana dengan keamanan data pengguna?',
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
                            '8. Kami mengambil privasi dan keamanan data pengguna dengan sangat serius. Informasi pribadi yang diperoleh oleh aplikasi ini akan dijaga sesuai dengan standar keamanan yang tinggi dan tidak akan dibagikan kepada pihak ketiga tanpa izin pengguna.',
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
                            '9. Apakah ada dukungan pelanggan yang tersedia jika saya mengalami masalah dengan aplikasi?',
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
                            '10. Ya, tim dukungan pelanggan kami siap membantu Anda dengan segala pertanyaan atau masalah yang Anda hadapi saat menggunakan aplikasi ini. Silakan hubungi kami melalui fitur dukungan yang disediakan dalam aplikasi.',
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
                            'Silakan tambahkan atau modifikasi pertanyaan sesuai dengan kebutuhan khusus aplikasi Anda.',
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
