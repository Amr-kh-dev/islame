import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/tabs/loading_indecator.dart';
import 'package:flutter_application_1/tabs/quran/quran.dart';

class SuraContant extends StatefulWidget {
  static const String routeName = 'route';

  @override
  State<SuraContant> createState() => _SuraContantState();
}

class _SuraContantState extends State<SuraContant> {
  List<String> ayet = [];

  late SuraCountantArges arrgs;

  @override
  Widget build(BuildContext context) {
    arrgs = ModalRoute.of(context)!.settings.arguments as SuraCountantArges;
    if (ayet.isEmpty) {
      loedSuraFile();
    }
    ;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/default_bg.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(arrgs.suraName),
          ),
          body: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.025,
                  vertical: MediaQuery.sizeOf(context).height * 0.05),
              margin: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.06),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ayet.isEmpty
                  ? LoadingIndecator()
                  : ListView.separated(
                      itemBuilder: (_, index) => Text(
                            ayet[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                      separatorBuilder: (_, int) => SizedBox(
                            height: 5,
                          ),
                      itemCount: ayet.length)),
        ));
  }

  Future<void> loedSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/text/${arrgs.index + 1}.txt');
    ayet = sura.split("/n/r");
    setState(() {});
  }
}
