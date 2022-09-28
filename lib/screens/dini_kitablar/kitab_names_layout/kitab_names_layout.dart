import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_class/kitab_class_api.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitablar_api/kitablar_api.dart';
import 'package:provider/provider.dart';

class ListViewState extends ChangeNotifier {
  double selectedIndexes = 0;
  double get selectedIndex => selectedIndexes;
  bool listBool1 = true;
  bool get listBool1a => listBool1;
  bool listBool2 = false;
  bool get listBool2a => listBool2;
  bool listBool3 = false;
  bool get listBool3a => listBool3;
  late var product1;
  // void searchProduct(String query,int index) {
  //      final suggestions = product1.where((product) {
  //     final productTitle = product.name.toLowerCase();
  //     final input = query.toLowerCase();

  //     return productTitle.contains(input);
  //   }).toList();
  //   if (listBool1 == true) {
  //     product1 = kitablar1[index];
  //           product1 = suggestions;

  //   } else if (listBool2 == true) {
  //     product1 = kitablar2[index];
  //           product1 = suggestions;

  //   }
  //   else if (listBool3 == true) {
  //     product1 = kitablar3[index];
  //           product1 = suggestions;

  //   }

  // }
}

class RowLayout extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  // final double elevation;
  final bool selected;
  const RowLayout(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listViewState = context.watch<ListViewState>();
    return Material(
      borderRadius: BorderRadius.circular(13),
      elevation: selected ? 15 : 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        hoverColor: Colors.grey,
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.white,
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }
}
