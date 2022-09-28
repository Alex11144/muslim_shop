// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_class/kitab_class_api.dart';
import 'package:provider/provider.dart';

import 'package:project_from_amirali/screens/dini_kitablar/kitab_names_layout/kitab_names_layout.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitablar_api/kitablar_api.dart';

class KitablarUI extends StatefulWidget {
  const KitablarUI({Key? key}) : super(key: key);

  @override
  State<KitablarUI> createState() => _KitablarUIState();
}

class _KitablarUIState extends State<KitablarUI> {
  
  //   void searchProduct(String query) {
  //   final suggestions = product1.where((product) {
  //     final productTitle = product.name.toLowerCase();
  //     final input = query.toLowerCase();

  //     return productTitle.contains(input);
  //   }).toList();
  //   setState(() {
  //     product = suggestions;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final listViewState = context.watch<ListViewState>();

    return Center(
      child: Container(
        height: 840,
        width: 390,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: const Text(
                        'Quran',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search_outlined)),
                        ),
                        CircleAvatar(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.settings_outlined)),
                        ),
                      ],
                    )
                  ],
                ),
                ButtonsState(listViewState),
                listViewState.listBool1 == true
                    ? ListViewChangable3(
                        kitablar: kitablar1,
                      )
                    : SizedBox.shrink(),
                listViewState.listBool2 == true
                    ? ListViewChangable3(kitablar: kitablar2)
                    : SizedBox.shrink(),
                listViewState.listBool3 == true
                    ? ListViewChangable3(kitablar: kitablar3)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding ButtonsState(ListViewState listViewState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowLayout(
            selected: listViewState.selectedIndex == 0,
            text: 'Sure',
            onTap: () {
              listViewState.listBool1 = true;
              listViewState.listBool2 = false;
              listViewState.listBool3 = false;
              listViewState.selectedIndexes = 0;
              setState(() {});
            },
          ),
          RowLayout(
            selected: listViewState.selectedIndex == 1,
            onTap: () {
              listViewState.listBool2 = true;
              listViewState.listBool1 = false;
              listViewState.listBool3 = false;

              listViewState.selectedIndexes = 1;
              setState(() {});
            },
            text: 'Cuz',
          ),
          RowLayout(
            selected: listViewState.selectedIndex == 2,
            onTap: () {
              listViewState.listBool2 = false;
              listViewState.listBool1 = false;
              listViewState.listBool3 = true;

              listViewState.selectedIndexes = 2;
              setState(() {});
            },
            text: 'Sehife',
          ),
        ],
      ),
    );
  }
}

class ListViewChangable3 extends StatelessWidget {
  List<Kitablar> kitablar;
  ListViewChangable3({
    Key? key,
    required this.kitablar,
  }) : super(key: key);
  void listening(int index, context) {
    var details = kitablar[index];

    Navigator.of(context)
        .pushNamed('/main_screen/listen_to_the_book', arguments: details);
  }

  @override
  Widget build(BuildContext context) {
    final listViewState = context.watch<ListViewState>();

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        itemCount: kitablar.length,
        itemBuilder: (BuildContext context, int index) {
          final books = kitablar[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => listening(index, context),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(158, 158, 158, 0.303)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                '${books.queue}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${books.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${books.description}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        thickness: 1,
                                      ),
                                      Text(
                                        '${books.numberOfSur}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          '${books.arabicString}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
