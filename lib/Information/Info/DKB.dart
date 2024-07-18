import 'package:flutter/material.dart';
import 'package:kolestrol/Information/info.dart';

class DKB extends StatefulWidget {
  const DKB({Key? key}) : super(key: key);

  @override
  State<DKB> createState() => _DKB();
}

class _DKB extends State<DKB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC7FF7F),
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
                          color: Color(0xFFC7FF7F),
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
                  const SizedBox(width: 50),
                  const Text(
                    "Darimana kolesterol berasal ?",
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
                          'Kolesterol dapat berasal dari dua sumber utama: produksi internal tubuh dan makanan yang kita konsumsi.',
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
                          '1. Produksi Internal Tubuh: Kolesterol diproduksi oleh hati dalam jumlah yang cukup untuk memenuhi kebutuhan tubuh. Hati secara alami menghasilkan kolesterol untuk fungsi-fungsi penting seperti pembentukan membran sel, produksi hormon, dan sintesis vitamin D. Produksi kolesterol oleh hati dipengaruhi oleh faktor genetik, hormon, dan pola makan.',
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
                          '2. Makanan: Kolesterol juga ditemukan dalam berbagai makanan, terutama dalam makanan hewani seperti daging, unggas, telur, produk susu, dan makanan laut. Namun, kontribusi makanan terhadap kadar kolesterol dalam darah relatif kecil dibandingkan dengan produksi internal oleh hati. Faktor lain, seperti jenis lemak yang dikonsumsi dan gaya hidup secara keseluruhan, juga dapat memengaruhi kadar kolesterol dalam darah.',
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
                          'Ketika kadar kolesterol dalam darah meningkat, baik karena produksi berlebihan oleh hati atau karena konsumsi makanan tinggi kolesterol, risiko penyakit jantung dan pembuluh darah juga meningkat. Oleh karena itu, penting untuk mengadopsi pola makan seimbang, membatasi konsumsi makanan tinggi kolesterol dan lemak jenuh, serta menjaga berat badan yang sehat dan gaya hidup aktif untuk menjaga kesehatan jantung dan pembuluh darah.',
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
