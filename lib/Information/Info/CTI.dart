import 'package:flutter/material.dart';
import 'package:kolestrol/Information/info.dart';

class IndicatorTes extends StatefulWidget {
  const IndicatorTes({Key? key}) : super(key: key);

  @override
  State<IndicatorTes> createState() => _IndicatorTes();
}

class _IndicatorTes extends State<IndicatorTes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF41A190),
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
                          color: Color(0xFF41A190),
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
                    "Cholesterol test indicators",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffE1FFFA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 360,
                        height: 505,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 35.0,
                            ),
                            const Text(
                              "Cholesterol Level",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width: 460,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 640,
                                          height: 70.68,
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 190,
                                                top: 20,
                                                child: SizedBox(
                                                  width: 76,
                                                  height: 40,
                                                  child: Text(
                                                    'HDL \nKolesterol',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 280,
                                                top: 20,
                                                child: SizedBox(
                                                  width: 70,
                                                  height: 40,
                                                  child: Text(
                                                    'LDL \nKolesterol',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 370,
                                                top: 26,
                                                child: SizedBox(
                                                  width: 80,
                                                  height: 20,
                                                  child: Text(
                                                    'Triglycerides',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 105,
                                                top: 26,
                                                child: SizedBox(
                                                  width: 76,
                                                  height: 40,
                                                  child: Text(
                                                    'Total \nKolesterol',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 2,
                                        top: 58,
                                        right: 2,
                                        child: Opacity(
                                          opacity: 0.45,
                                          child: Container(
                                            width: 450,
                                            decoration: const ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  width: 1,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignCenter,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 59,
                                        right: 0,
                                        child: Container(
                                          width: 100,
                                          height: 130,
                                          decoration: const ShapeDecoration(
                                            color: Color(0x60DE6F6F),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),
                                                topRight: Radius.circular(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 85,
                                        child: Container(
                                          width: 80,
                                          height: 55.61,
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 9,
                                                top: 14.23,
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 20.63,
                                                  child: Text(
                                                    'High',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF2E4056),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 30,
                                                child: SizedBox(
                                                  width: 70,
                                                  height: 35.28,
                                                  child: Text(
                                                    'Cholesterol level',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF657587),
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 105,
                                        top: 115,
                                        child: SizedBox(
                                          width: 70,
                                          height: 25,
                                          child: Text(
                                            '> = 240 mg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 195,
                                        top: 110,
                                        child: SizedBox(
                                          width: 60,
                                          height: 25,
                                          child: Text(
                                            '< 40 \nmg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 284,
                                        top: 110,
                                        child: SizedBox(
                                          width: 60,
                                          height: 25,
                                          child: Text(
                                            '>= 160 \nmg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 378,
                                        top: 110,
                                        child: SizedBox(
                                          width: 60,
                                          height: 25,
                                          child: Text(
                                            '>= 200 \nmg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 111,
                                        top: 60,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 190,
                                        top: 60,
                                        child: SizedBox(
                                          width: 90,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 284,
                                        top: 60,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 378,
                                        top: 60,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 180,
                                        right: 0,
                                        child: Container(
                                          width: 100,
                                          height: 130,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFFFF8C0),
                                            shape: RoundedRectangleBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 210,
                                        child: Container(
                                          width: 80,
                                          height: 55.61,
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 9,
                                                top: 14.23,
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 20.63,
                                                  child: Text(
                                                    'Warning',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF2E4056),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 28.32,
                                                child: SizedBox(
                                                  width: 70,
                                                  height: 35.28,
                                                  child: Text(
                                                    'Cholesterol level',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF657587),
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 111,
                                        top: 185,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 190,
                                        top: 185,
                                        child: SizedBox(
                                          width: 90,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 284,
                                        top: 185,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 378,
                                        top: 185,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 105,
                                        top: 245,
                                        child: SizedBox(
                                          width: 70,
                                          height: 25,
                                          child: Text(
                                            '200-240 mg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 195,
                                        top: 240,
                                        child: SizedBox(
                                          width: 70,
                                          height: 25,
                                          child: Text(
                                            '40 - 60\nmg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 276,
                                        top: 245,
                                        child: SizedBox(
                                          width: 70,
                                          height: 25,
                                          child: Text(
                                            '100 - 159  \nmg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 378,
                                        top: 240,
                                        child: SizedBox(
                                          width: 60,
                                          height: 25,
                                          child: Text(
                                            '150  - 199\nmg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 310,
                                        right: 0,
                                        child: Container(
                                          width: 100,
                                          height: 130,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFADE2D8),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(55),
                                                bottomRight:
                                                    Radius.circular(53),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 340,
                                        child: Container(
                                          width: 80,
                                          height: 55.61,
                                          child: const Stack(
                                            children: [
                                              Positioned(
                                                left: 9,
                                                top: 14.23,
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 20.63,
                                                  child: Text(
                                                    'Normal',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF2E4056),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 28.32,
                                                child: SizedBox(
                                                  width: 70,
                                                  height: 35.28,
                                                  child: Text(
                                                    'Cholesterol level',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF657587),
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 110,
                                        top: 315,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 190,
                                        top: 315,
                                        child: SizedBox(
                                          width: 90,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 284,
                                        top: 315,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 374,
                                        top: 315,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                      const Positioned(
                                        left: 105,
                                        top: 375,
                                        child: SizedBox(
                                          width: 70,
                                          height: 13,
                                          child: Text(
                                            '< 200 mg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 195,
                                        top: 375,
                                        child: SizedBox(
                                          width: 60,
                                          height: 25,
                                          child: Text(
                                            '> 60 mg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 276,
                                        top: 375,
                                        child: SizedBox(
                                          width: 70,
                                          height: 25,
                                          child: Text(
                                            '< 100 mg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 374,
                                        top: 375,
                                        child: SizedBox(
                                          width: 60,
                                          height: 25,
                                          child: Text(
                                            '< 150 mg/dl',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
