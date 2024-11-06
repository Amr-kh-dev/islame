import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provied_sebha.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';

class Sebha extends StatelessWidget {
  ThemeMode mode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return ChangeNotifierProvider(
      create: (context) => ProviedSebha(),
      child: Consumer2<ProviedSebha, ProviedSetting>(
        builder: (context, sebha, setting, child) {
         return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * 0.25, top: height * 0),
                      child: Image.asset(setting.theme == ThemeMode.light
                          ? 'assets/images/head_sebha_logo.png'
                          : 'assets/images/body_sebha_dark.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.10),
                      child: Transform.rotate(angle: sebha.angle,
                        child: Image.asset(setting.theme == ThemeMode.light
                            ? 'assets/images/body_sebha_logo.png'
                            : 'assets/images/body_sebha_dark.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                'عدد التسبيحات',
                style: Theme.of(context).textTheme.headlineSmall,
              )),
              SizedBox(
                height: height*0.05,
              ),
              Center(
                child: InkWell(
                  onTap: sebha.onZekerpreesde,
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                        color: isLightMode
                            ? ThemeApp.lightPrimre.withOpacity(0.5)
                            : ThemeApp.darkPrimre.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(sebha.counter.toString(),
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: height * 0.05,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                      color: isLightMode
                          ? ThemeApp.lightPrimre.withOpacity(0.5)
                          : ThemeApp.darkPrimre.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(sebha.typesOfSebha[sebha.index],
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
              )
            ],
          ),
        );}
      ),
    );
  }
}
