import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xenon_music/model/radio.dart';

import '../utils/ai_util.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<MyRadio> radios;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [
                    AIColors.primaryColor1,
                    AIColors.primaryColor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
          AppBar(
            title: "Xenon Music".text.xl4.bold.wide.make().shimmer(
                primaryColor: Color.fromARGB(255, 224, 204, 245),
                secondaryColor: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100).p16()
        ],
      ),
    );
  }
}
