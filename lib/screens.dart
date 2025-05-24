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
  // 5asyt flex msh btsht8l 8er lama ykon feh aktr mn expanded widget
  // flex d bt2sm el shasha le kza kt3a
  const ExpandedTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.red,
          ),
        ),
      ]),
    );
  }
}

class FlexibleTest extends StatelessWidget {
  // flexible el bt3mlo enha bt5ly el child bta3ha marna tt8yr 3la 7sb el msa7a el hya feha
  const FlexibleTest({super.key});

  // fittedBox w d bt5ly el child bta3ha y3ml fit f el msa7a el hwa feha ya5odha bzbt
  // lw ana msh 3ayz el child ykbr 3n el 7agm el tbe3 ast5dm scale down

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Flexible(
            child: FittedBox(
              child: Icon(
                Icons.ac_unit,
                size: 300,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              height: 150,
              child: const FittedBox(
                  fit: BoxFit.scaleDown, child: Icon(Icons.abc)),
            ),
          ),
          Container(
            color: Colors.black,
            height: 150,
          ),
        ],
      ),
    );
  }
}

class FittedBoxTest extends StatelessWidget {
  const FittedBoxTest({super.key});

  static const imagesUrl = [
    'https://images.ctfassets.net/hrltx12pl8hq/qGOnNvgfJIe2MytFdIcTQ/429dd7e2cb176f93bf9b21a8f89edc77/Images.jpg',
    'https://images.ctfassets.net/hrltx12pl8hq/qGOnNvgfJIe2MytFdIcTQ/429dd7e2cb176f93bf9b21a8f89edc77/Images.jpg',
    'https://images.ctfassets.net/hrltx12pl8hq/qGOnNvgfJIe2MytFdIcTQ/429dd7e2cb176f93bf9b21a8f89edc77/Images.jpg',
    'https://images.ctfassets.net/hrltx12pl8hq/qGOnNvgfJIe2MytFdIcTQ/429dd7e2cb176f93bf9b21a8f89edc77/Images.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: FittedBoxTest.imagesUrl.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) =>
            FittedBox(child: Image.network(FittedBoxTest.imagesUrl[index])),
      ),
    );
  }
}

class AspectRatioTest extends StatelessWidget {
  const AspectRatioTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 2,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.red,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
      ),
    );
  }
}

class IntrinsicTest extends StatelessWidget {
  // el 5olasa en Intrinsic btst5m 3shan t7dd akbr width aw height le child
  // bs 5ly balk enha moklfa shoia mn n7yt el ada2 fa 7awl ma tst5dmhash 8er lw m7tagha f3ln
  const IntrinsicTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              const SizedBox(height: 250),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: const Column(
                          children: [
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              // height: 200,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // height: 200,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 50,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      color: Colors.red, width: 100, child: const Text("قصير")),
                  Container(
                      color: Colors.blue,
                      width: 100,
                      child: const Text("هذا نص أطول شوية")),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            IntrinsicWidth(
              child: Column(
                children: [
                  Container(color: Colors.green, child: const Text("نص")),
                  Container(
                      color: Colors.green, child: const Text("نص أطول بكتير")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
