import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();

    var newInstance = Map();
    newInstance['isDayTime'] = instance.isDayTime;
    newInstance['time'] = instance.time;
    newInstance['location'] = instance.location;
    newInstance['flag'] = instance.flag;

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: newInstance
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.black,
          size: 50,
        ),
      ),
    );
  }
}
