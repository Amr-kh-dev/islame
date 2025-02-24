import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/tabs/radio/radio_model.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';

class Radioitem extends StatelessWidget {
  //  static  final player = AudioPlayer();
  AudioPlayer player;
  final Radios radio;
  Radioitem({required this.radio, required this.player});

  @override
  Widget build(BuildContext context) {
    ProviedSetting settingProvieder = Provider.of<ProviedSetting>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          radio.name ?? "No Name",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await player.play(UrlSource(radio.url!));
              },
              icon: Icon(Icons.arrow_right_outlined,
                  size: 100,
                  color: settingProvieder.isDark
                      ? ThemeApp.gold
                      : ThemeApp.lightPrimre),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () async {
                await player.stop();
              },
              icon: Icon(Icons.stop,
                  size: 60,
                  color: settingProvieder.isDark
                      ? ThemeApp.gold
                      : ThemeApp.lightPrimre),
            )
          ],
        )
      ],
    );
  }
}
