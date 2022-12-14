import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_class/kitab_class_api.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitablar_api/ayeler_api.dart';
import 'package:project_from_amirali/screens/dini_kitablar/listening/listening_after_tap/screen_listening.dart';

class ListenToTheBook extends StatelessWidget {
  final Kitablar product1;

  const ListenToTheBook({Key? key, required this.product1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Kitablar;

    return Center(
      child: SizedBox(
        height: 840,
        width: 390,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFFE31E24)),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: SvgPicture.asset(
                          'assets/images/Vector.svg',
                          fit: BoxFit.fitHeight,
                          // width: 200,
                          height: 189,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(51, 255, 255, 255),
                              foregroundColor: Colors.black,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                args.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(args.description,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                                const VerticalDivider(
                                  color: Colors.white,
                                ),
                                Text(args.numberOfSur,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child:
                                  SvgPicture.asset('assets/images/arabic.svg')),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 4),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SliderAndPlayer(
                                                      product1: args)));
                                    },
                                    icon: const Icon(Icons.play_arrow))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const AyelerListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class AyelerListView extends StatelessWidget {
  // void ayeler(int index,context) {
  //   final ayeler = ayeler1[index];

  //     Navigator.of(context)
  //       .pushNamed('/main_screen/listen_to_the_book/listen_screen', arguments: ayeler);
  // }

  const AyelerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          // padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
          itemCount: ayeler1.length,
          itemBuilder: (BuildContext context, int index) {
            var args = ayeler1[index];
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(158, 158, 158, 0.303))),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${args.queue}'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share_outlined),
                                    color: Colors.red,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow_outlined),
                                    color: Colors.red,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.bookmark_outline),
                                    color: Colors.red,
                                  )
                                ],
                              )
                            ],
                          ),
                          const Divider(
                            color: Color.fromRGBO(158, 158, 158, 0.303),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  args.arabicString,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                              color: Color.fromRGBO(158, 158, 158, 0.303)),
                          Text(
                            args.description,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
