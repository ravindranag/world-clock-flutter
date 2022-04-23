import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    final place = ModalRoute.of(context)?.settings.arguments as WorldTime;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Choose Location'),
                ),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        place.location,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                    place.time,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
