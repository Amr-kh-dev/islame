import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_1/tabs/hadeth/hadeth.dart';
// import 'package:flutter_application_1/app_them.dart';

class HadethContantScreen extends StatelessWidget {
  static const String routeName = '/hadeth_contant';

  const HadethContantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    final setting = Provider.of<ProviedSetting>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(setting.isDark
                    ? 'assets/images/dark_bg.png'
                    : 'assets/images/default_bg.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.hadethName,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: setting.isDark ? Colors.white : ThemeApp.black),
            ),
          ),
          body: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.025,
                  vertical: MediaQuery.sizeOf(context).height * 0.05),
              margin: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.06),
              decoration: BoxDecoration(
                color: setting.isDark
                    ? ThemeApp.darkPrimre
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListView.separated(
                  itemBuilder: (_, index) => Text(
                        args.hadethContant[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: setting.isDark
                                ? ThemeApp.gold
                                : ThemeApp.black),
                      ),
                  separatorBuilder: (_, int) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: args.hadethContant.length)),
        ));
  }
}
