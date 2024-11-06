import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';

class Redio extends StatelessWidget {
  const Redio({super.key});

  @override
  Widget build(BuildContext context) {
    ProviedSetting settingProvieder=Provider.of<ProviedSetting>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image(image: AssetImage('assets/images/radio_image.png')),
        Text('اذاعة القران الكريم',style: Theme.of(context).textTheme.headlineLarge,),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Icon(Icons.arrow_left,
            size: 40,                                                 
             color: settingProvieder.isDark?ThemeApp.gold:ThemeApp.lightPrimre),
            Icon(Icons.arrow_right_outlined,
            size: 60, color: settingProvieder.isDark?ThemeApp.gold:ThemeApp.lightPrimre),
            Icon(Icons.arrow_right_outlined
            ,
                size: 40,  color: settingProvieder.isDark?ThemeApp.gold:ThemeApp.lightPrimre),
          ],
        )
      ]),
    );
  }
}
// TODO Implement this library.