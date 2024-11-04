import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth_contant_screen.dart';
import 'package:flutter_application_1/tabs/loading_indecator.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> hadeth = [];

  @override
  Widget build(BuildContext context) {
    if (hadeth.isEmpty) {
      loadHadeh();
}
    ;
    return Scaffold(
        body: Column(
      children: [
        Image(image: AssetImage('assets/images/hadeth_logo.png')),
        Expanded(
          child: hadeth.isEmpty
              ? LoadingIndecator()
              : ListView.separated(
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      HadethContantScreen.routeName,
                      arguments: hadeth[index],
                    ),
                    child: Text(
                      hadeth[index].hadethName,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: hadeth.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12),
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
