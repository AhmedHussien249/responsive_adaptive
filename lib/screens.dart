import 'dart:developer';

import 'package:flutter/material.dart';

class MediaQueryTest extends StatelessWidget {
  const MediaQueryTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: height * .2,
            width: 400,
          ),
          Container(
            color: Colors.white,
            height: height * .2,
            width: 400,
          ),
          Container(
            color: Colors.red,
            height: height * .2,
            width: 400,
          ),
          Center(
            child: Container(
              width: width * 0.8, // 80% من عرض الشاشة
              height: height * 0.3, // 30% من ارتفاع الشاشة
              color: Colors.blue,
              child: const Center(child: Text("Box متجاوب")),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileLayoutTest extends StatelessWidget {
  const MobileLayoutTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        log(constraints.maxWidth.toString());
        return constraints.maxWidth <= 400 // breakpoint el bt7dd ana fen dlw2t
            ? ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ItemDetails(number: index + 1))),
                  child: Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      title: Text("Item ${index + 1}"),
                    ),
                  ),
                ),
                itemCount: 10,
              )
            : const AnotherLayOut();
      }),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}

class AnotherLayOut extends StatefulWidget {
  const AnotherLayOut({super.key});

  @override
  State<AnotherLayOut> createState() => _AnotherLayOutState();
}

class _AnotherLayOutState extends State<AnotherLayOut> {
   int numbers = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    numbers = index + 1;
                  });
                },
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    title: Text("Item ${index + 1}"),
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),
          Expanded(
              child: SizedBox(
            child: Center(child: Text(numbers.toString())),
          ))
        ],
      ),
    );
  }
}


class ExpandedTest extends StatelessWidget {

  // expanded d b2a bt3ml a lw nta kont f el column bt2olo 5od el height el ba2y
  // lw nta kont f raw bt2olo 5od el 3ard el ba2y
  // fa lw feh nesb yb2a nta m7tag expanded 
  const ExpandedTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,

            ),
          ), Expanded(
            child: Container(
              color: Colors.white,

            ),
          ), Expanded(
            child: Container(
              color: Colors.red,

            ),
          ),
        ]
      ),
    );
  }
}

