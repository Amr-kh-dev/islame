import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:flutter_application_1/tabs/loading_indecator.dart';

import 'package:flutter_application_1/tabs/radio/radioItem.dart';

import 'package:http/http.dart' as http;

import 'radio_model.dart';

class Redio extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();
  Redio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
            child: Image(image: AssetImage('assets/images/radio_image.png'))),
        Expanded(
          child: FutureBuilder(
            future: getRadio(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndecator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData ||
                  snapshot.data?.radios == null ||
                  snapshot.data!.radios!.isEmpty) {
                return Text("No Data Available");
              } else {
                List<Radios> radioList = snapshot.data!.radios!;
                return ListView.builder(
                  itemCount: radioList.length,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemBuilder: (_, index) => SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Radioitem(
                      radio: radioList[index],
                      player: player,
                    ),
                  ),
                );
              }
            },
          ),
        )
      ]),
    );
  }

  Future<RadioModel> getRadio() async {
    Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioModel.fromJson(json);
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
// TODO Implement this library.