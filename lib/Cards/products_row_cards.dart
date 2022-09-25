import 'package:flutter/material.dart';
import 'package:project_from_amirali/Cards/mehsullar.dart';


class ProductsRow extends StatefulWidget {
  const ProductsRow({Key? key}) : super(key: key);

  @override
  State<ProductsRow> createState() => _ProductsRowState();
}

class _ProductsRowState extends State<ProductsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Mehsullar(
          text: "Hicablar",
          image: 'assets/images/hicab.png',
          onTap: () {
            Navigator.of(context).pushNamed('hicabs');
          },
        ),
        Mehsullar(
          text: ("Etirler"),
          image: 'assets/images/hicab.png',
          onTap: () {
            Navigator.of(context).pushNamed('etirler');
          },
        ),
         Mehsullar(
          text: ("Dini Kitablar"),
          image: 'assets/images/hicab.png',
           onTap: () {
            Navigator.of(context).pushNamed('kitablar');
          },

        ),
        const Mehsullar(text: ("Diger"), image: "assets/images/hicab.png"),
      ],
    );
  }
}
