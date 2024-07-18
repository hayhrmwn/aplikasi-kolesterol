import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class CholesterolStatusWidget extends StatefulWidget {
  final int cholesterolLevel;

  const CholesterolStatusWidget({required this.cholesterolLevel});

  @override
  _CholesterolStatusWidgetState createState() =>
      _CholesterolStatusWidgetState();
}

class _CholesterolStatusWidgetState extends State<CholesterolStatusWidget> {
  DateTime selectedDate = DateTime.now();
  int cholesterolLevel = 0;

  @override
  void initState() {
    super.initState();
    cholesterolLevel = widget.cholesterolLevel;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // Update cholesterolLevel based on selectedDate.
        // For demonstration, we'll just reset it to the initial level.
        cholesterolLevel = widget.cholesterolLevel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String statusText;
    IconData statusIcon;
    Color statusColor;

    if (cholesterolLevel == 0) {
      statusText = "Data Still Empty";
      statusIcon = Icons.sentiment_dissatisfied_outlined;
      statusColor = const Color(0xFF848282);
    } else if (cholesterolLevel <= 200) {
      statusText = "Cholesterol Normal";
      statusIcon = Icons.sentiment_satisfied_outlined;
      statusColor = const Color(0xFF28A745);
    } else if (cholesterolLevel >= 200 && cholesterolLevel <= 240) {
      statusText = "Warning Cholesterol";
      statusIcon = Icons.sentiment_neutral_outlined;
      statusColor = const Color(0xFFFFC107);
    } else {
      statusText = "High Cholesterol";
      statusIcon = Icons.sentiment_dissatisfied_outlined;
      statusColor = const Color(0xFFDC3545);
    }

    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  statusIcon,
                  size: 30,
                  color: statusColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusText,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xFF2E4156),
                        fontSize: 12,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 16,
            child: Text(
              DateFormat('dd MMM, yyyy').format(selectedDate),
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF657688),
                fontSize: 9,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w200,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
