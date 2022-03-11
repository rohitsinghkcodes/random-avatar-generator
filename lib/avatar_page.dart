import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {

  late String svgCode;
  String name = 'X-SLAYER';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    svgCode = multiavatar(name);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              children: [
                //returns SvgPicture datatype
                SizedBox(
                    width: 200,
                    child: SvgPicture.string(svgCode)
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      name = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Generate'),
                  onPressed: () {
                    setState(() {
                      svgCode = multiavatar(name);
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
