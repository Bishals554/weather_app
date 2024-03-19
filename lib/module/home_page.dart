import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE d MMMM y');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Column(
            children: [
              Text(
                "Today",
                style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              Text(
                formatDate(DateTime.now()),
                style: GoogleFonts.ubuntu(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              )
            ],
          ),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                  child: Column(
                    children: [
                      Lottie.asset('assets/loc.json',
                          height: 90, fit: BoxFit.cover)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
