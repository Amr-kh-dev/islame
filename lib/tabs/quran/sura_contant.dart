import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/tabs/loading_indecator.dart';
import 'package:flutter_application_1/tabs/quran/quran.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';

class SuraContant extends StatefulWidget {
  static const String routeName = 'route';

  const SuraContant({super.key});

  @override
  State<SuraContant> createState() => _SuraContantState();
}

class _SuraContantState extends State<SuraContant> {
  List<String> ayet = [];

  late SuraCountantArges arrgs;

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ProviedSetting>(context);
    arrgs = ModalRoute.of(context)!.settings.arguments as SuraCountantArges;
    if (ayet.isEmpty) {
      loedSuraFile();
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(setting.isDark
                    ? 'assets/images/dark_bg.png'
                    : 'assets/images/default_bg.png'),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                arrgs.suraName,
                style: TextStyle(
                    color: setting.isDark ? Colors.white : ThemeApp.black),
              ),
            ),
            body: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height * 0.025,
                    vertical: MediaQuery.sizeOf(context).height * 0.05),
                margin:
                    EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.06),
                decoration: BoxDecoration(
                  color: setting.isDark ? ThemeApp.darkPrimre : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ayet.isEmpty
                    ? const LoadingIndecator()
                    : ListView.separated(
                        itemBuilder: (_, index) => Text(
                              ayet[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                        separatorBuilder: (_, int) => Divider(
                              thickness: 2,
                              color: setting.isDark
                                  ? ThemeApp.gold
                                  : ThemeApp.black,
                            ),
                        itemCount: ayet.length)),
          ),
        ));
  }

  Future<void> loedSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/text/${arrgs.index + 1}.txt');
    ayet = sura.split("/n/r");
    setState(() {});
  }
}
