import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth_contant_screen.dart';
import 'package:flutter_application_1/tabs/loading_indecator.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';

class HadethTap extends StatefulWidget {
  const HadethTap({super.key});

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> hadeth = [];

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ProviedSetting>(context);
    if (hadeth.isEmpty) {
      loadHadeh();
    }
    return Scaffold(
        body: Column(
      children: [
        const Image(image: AssetImage('assets/images/hadeth_logo.png')),
        Divider(
          thickness: 2,
          color: setting.isDark ? ThemeApp.gold : ThemeApp.black,
        ),
        Text(
          'الاحاديث',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: setting.isDark ? Colors.white : ThemeApp.black),
        ),
        Divider(
          thickness: 2,
          color: setting.isDark ? ThemeApp.gold : ThemeApp.black,
        ),
        Expanded(
          child: hadeth.isEmpty
              ? const LoadingIndecator()
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      HadethContantScreen.routeName,
                      arguments: hadeth[index],
                    ),
                    child: Text(
                      hadeth[index].hadethName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: setting.isDark
                                  ? Colors.white
                                  : ThemeApp.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: hadeth.length,
                  separatorBuilder: (_, __) => Divider(
                    thickness: 2,
                    color: setting.isDark ? ThemeApp.gold : ThemeApp.black,
                  ),
                ),
        )
      ],
    ));
  }

  Future<void> loadHadeh() async {
    String hadethFileCountant =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> hadethContant = hadethFileCountant.split('#');

    hadeth = hadethContant.map((hadethContant) {
      List<String> hadethLiens = hadethContant.trim().split('\n');
      String title = hadethLiens[0];
      hadethLiens.removeAt(0);
      List<String> contant = hadethLiens;

      return Hadeth(
        hadethName: title,
        hadethContant: contant,
      );
    }).toList();
    setState(() {});
  }
}
