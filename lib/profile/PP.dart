import 'package:flutter/material.dart';
import 'package:kolestrol/profile/profile.dart';

class PP extends StatefulWidget {
  const PP({Key? key}) : super(key: key);

  @override
  State<PP> createState() => _PP();
}

class _PP extends State<PP> {
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
                            'Kami menghargai kepercayaan Anda sebagai pengguna aplikasi "Pengembangan Alat Deteksi Kolesterol" dan berkomitmen untuk melindungi privasi Anda secara maksimal. Kebijakan privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, mengungkapkan, dan melindungi informasi pribadi Anda saat Anda menggunakan aplikasi kami. Dengan menggunakan aplikasi kami, Anda menyetujui praktik yang dijelaskan dalam kebijakan ini. Informasi yang Kami Kumpulkan:',
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
                            '1. Informasi Non-Pribadi:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              '• Saat Anda menggunakan aplikasi kami, kami mungkin mengumpulkan informasi non-pribadi seperti jenis perangkat yang Anda gunakan, sistem operasi, informasi demografis umum, dan statistik penggunaan aplikasi. Informasi ini membantu kami memahami bagaimana pengguna menggunakan aplikasi kami untuk meningkatkan pengalaman pengguna secara keseluruhan.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2. Informasi Pribadi:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              '• Kami tidak secara aktif mengumpulkan informasi pribadi dari pengguna aplikasi "Pengembangan Alat Deteksi Kolesterol". Namun, jika Anda memilih untuk menghubungi kami melalui formulir kontak atau layanan dukungan pelanggan, Anda mungkin diminta untuk memberikan informasi pribadi seperti nama, alamat email, atau nomor telepon. Kami akan menggunakan informasi ini hanya untuk tujuan yang dijelaskan saat pengumpulan dan tidak akan membagikannya kepada pihak ketiga tanpa izin Anda.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Bagaimana Kami Menggunakan Informasi Anda:',
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
                            '1. Peningkatan Aplikasi:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              '• Kami menggunakan informasi yang dikumpulkan untuk memahami dan meningkatkan pengalaman pengguna aplikasi kami. Ini mencakup pemecahan masalah teknis, analisis tren penggunaan, dan pengembangan fitur baru',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2. Komunikasi:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              '• Jika Anda memberikan informasi kontak, kami mungkin menggunakan informasi tersebut untuk menghubungi Anda terkait dengan pertanyaan Anda atau memberikan pembaruan tentang aplikasi kami.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '3. Kepatuhan Hukum:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              '• Kami akan mengungkapkan informasi jika diharuskan oleh hukum atau jika kami yakin bahwa pengungkapan tersebut diperlukan untuk melindungi hak-hak, properti, atau keselamatan kami, pengguna kami, atau orang lain.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Bagaimana Kami Melindungi Informasi Anda:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            'Kami mengambil langkah-langkah keamanan yang sesuai untuk melindungi informasi pribadi Anda dari akses, penggunaan, atau pengungkapan yang tidak sah. Namun, perlu diingat bahwa tidak ada metode transmisi melalui internet atau metode penyimpanan elektronik yang sepenuhnya aman. Oleh karena itu, meskipun kami berusaha keras untuk melindungi informasi pribadi Anda, kami tidak dapat menjamin keamanan absolut.',
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
                            'Persetujuan Terhadap Kebijakan Privasi:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            'Dengan menggunakan aplikasi "Pengembangan Alat Deteksi Kolesterol", Anda menunjukkan bahwa Anda menyetujui pengumpulan dan penggunaan informasi Anda sesuai dengan kebijakan privasi ini. Jika Anda tidak setuju dengan kebijakan ini, harap jangan menggunakan aplikasi kami.',
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
                            'Perubahan pada Kebijakan Privasi:',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            'Kami berhak untuk memperbarui kebijakan privasi ini dari waktu ke waktu. Perubahan yang signifikan akan disampaikan kepada Anda melalui pembaruan aplikasi atau pemberitahuan lainnya. Dengan melanjutkan penggunaan aplikasi setelah perubahan tersebut, Anda menunjukkan persetujuan Anda terhadap perubahan tersebut.',
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
