import 'package:covres/AddData.dart';
import 'package:covres/getData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'TextButtonCus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'CovRes',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff96AAFE)),
                    ),
                    Image.asset(
                      'assets/family.png',
                      width: context.percentWidth * 40,
                      height: context.percentWidth * 40,
                    ),
                    Text(
                      'Resources',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff96AAFE)),
                    ),
                    TextButton(
                      onPressed: () {
                        launch(
                            'https://airtable.com/shrA0I4rCGr0EDBYP/tbljq1BFhFzpNUprB');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF63B3ED),
                        ),
                        height: context.percentHeight * 23,
                        width: context.percentWidth * 90,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              "COVID Testing Labs"
                                  .text
                                  .white
                                  .xl3
                                  .capitalize
                                  .center
                                  .make(),
                              5.heightBox,
                              "Testing Labs in india".text.white.center.make()
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButtonCus(
                          title: 'All',
                          page: GetData(
                            type: 'All',
                          ),
                        ),
                        TextButtonCus(
                          title: 'Remdesivir',
                          page: GetData(
                            type: 'Remdesivir',
                          ),
                        ),
                        TextButtonCus(
                          title: 'Plasma',
                          page: GetData(
                            type: 'Plasma',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButtonCus(
                          title: 'Oxygen',
                          page: GetData(
                            type: 'Oxygen',
                          ),
                        ),
                        TextButtonCus(
                          title: 'Ventilator',
                          page: GetData(
                            type: 'Ventilator',
                          ),
                        ),
                        TextButtonCus(
                          title: 'ICU',
                          page: GetData(
                            type: 'ICU',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButtonCus(
                          title: 'Beds',
                          page: GetData(
                            type: 'Beds',
                          ),
                        ),
                        TextButtonCus(
                          title: 'Food',
                          page: GetData(
                            type: 'Food',
                          ),
                        ),
                        TextButtonCus(
                          title: 'Other',
                          page: GetData(
                            type: 'Other',
                          ),
                        ),
                      ],
                    ),
                    '*Its mean website Contain \nwhich Type of Data'
                        .text
                        .center
                        .makeCentered(),
                    10.heightBox,
                    TextButtonCus(
                      title: 'Add A Website',
                      page: AddData(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "Made By".text.makeCentered(),
                        TextButton(
                            onPressed: () {
                              launch('https://www.linkedin.com/in/lkrjangid/');
                            },
                            child: "Lokesh Jangid  &".text.make()),
                      ],
                    ).centered(),
                    TextButton(
                            onPressed: () {
                              launch(
                                  'https://www.linkedin.com/in/puneet-dadhich-624839198/');
                            },
                            child: "Puneet Dadhich".text.makeCentered())
                        .centered()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

