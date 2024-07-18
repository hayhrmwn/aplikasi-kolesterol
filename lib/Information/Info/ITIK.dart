import 'package:flutter/material.dart';
import 'package:kolestrol/Information/info.dart';

class ITIK extends StatefulWidget {
  const ITIK({Key? key}) : super(key: key);

  @override
  State<ITIK> createState() => _ITIK();
}

class _ITIK extends State<ITIK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AFFB0),
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
                          color: Color(0xFF5AFFB0),
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
                  const SizedBox(width: 15),
                  const Text(
                    "Informasi tentang indikator kolesterol",
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
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 45),
                        Text(
                          'Indikator yang sering digunakan untuk memberikan informasi tentang kadar kolesterol dalam tubuh adalah tingkat kolesterol total, serta tingkat kolesterol LDL (Low-Density Lipoprotein) yang sering disebut "kolesterol jahat," dan tingkat kolesterol HDL (High-Density Lipoprotein) yang sering disebut "kolesterol baik." Kolesterol total mengacu pada jumlah keseluruhan kolesterol dalam darah, sementara kolesterol LDL merupakan jenis kolesterol yang cenderung meningkatkan risiko penyakit jantung dan arteri koroner karena dapat menyumbat pembuluh darah, sedangkan kolesterol HDL diketahui dapat membantu membersihkan kolesterol dari dinding arteri, sehingga memiliki efek protektif terhadap penyakit jantung.',
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
                          'Selain itu, rasio antara kolesterol total dan kolesterol HDL juga merupakan indikator penting, karena dapat memberikan gambaran tentang proporsi kolesterol "baik" terhadap kolesterol "jahat" dalam tubuh. Rasio yang rendah cenderung menunjukkan peningkatan risiko penyakit jantung.',
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
                          'Selain pengukuran langsung, ada juga indikator lain yang digunakan, seperti kadar trigliserida dalam darah, yang juga dapat memberikan informasi tambahan tentang risiko kesehatan terkait kolesterol.',
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
                          'Indikator-indikator ini penting untuk memantau kesehatan jantung dan pembuluh darah seseorang, serta membantu dalam pengambilan keputusan terkait gaya hidup dan pengobatan untuk mengelola kadar kolesterol yang tidak sehat.',
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
                          'Tingkat kolesterol normal biasanya kurang dari 200 mg/dL, dengan tingkat LDL normal di bawah 100 mg/dL dan tingkat HDL di atas 40 mg/dL untuk melindungi kesehatan jantung. Kadar kolesterol yang tinggi dapat mencapai 240 mg/dL atau lebih, sementara kolesterol HDL yang rendah di bawah 40 mg/dL meningkatkan risiko penyakit jantung. Rasio kolesterol total terhadap HDL idealnya kurang dari 3.5:1.',
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
