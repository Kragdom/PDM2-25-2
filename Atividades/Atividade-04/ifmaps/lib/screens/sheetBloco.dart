import 'package:flutter/material.dart';

class Sheetbloco extends StatelessWidget {
  const Sheetbloco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const FrontView(),
            );
          },
          child: Image(image: AssetImage('assets/ex_top_BP.png')),
        ),
      ),
    );
  }
}

class FrontView extends StatelessWidget {
  const FrontView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Image(image: AssetImage('assets/front_BCC.png')),
    );
  }
}
