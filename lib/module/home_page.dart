import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/module/home_controller.dart';
import 'package:weather/widgets/weather_items.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _controller = Get.find<HomeController>();

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE d MMMM y');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WhetherItem(
                icon: 'assets/loc.json',
                text: "Your location is ",
                subText: _controller.address,
              ),
              const SizedBox(height: 18),
              WhetherItem(
                icon: 'assets/temp.json',
                text: "The temperature is ",
                subText: "${_controller.temperature}°C",
              ),
              const SizedBox(height: 18),
              WhetherItem(
                icon: 'assets/thums_up.json',
                text: "You should ",
                subText: _controller.infoText.value,
              ),
            ],
          ),
        ));
  }
}
