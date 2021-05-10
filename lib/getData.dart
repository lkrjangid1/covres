import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class GetData extends StatefulWidget {
  final String type;
  GetData({this.type});
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            8.heightBox,
            widget.type.text.lightBlue400.xl3.make(),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('resourcesData')
                    .where('type', isEqualTo: '${widget.type}')
                    .where('approve', isEqualTo: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        10.heightBox,
                        Text('Something went wrong'),
                      ],
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        children: [
                          10.heightBox,
                          CircularProgressIndicator(),
                          10.heightBox,
                          Text("Loading"),
                        ],
                      ),
                    );
                  }

                  return new GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      return CustomButton(
                        title: document.data()['title'],
                        description: document.data()['description'],
                        url: document.data()['url'],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final url;
  final String title;
  final String description;
  final width;
  final height;
  CustomButton(
      {this.title, this.description, this.url, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launch(url);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFF63B3ED),
        ),
        height: height ?? context.percentHeight * 23,
        width: width ?? context.percentWidth * 27,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title.text.white.center.make(),
              5.heightBox,
              description.text.white.xs.center.make()
            ],
          ),
        ),
      ),
    );
  }
}
