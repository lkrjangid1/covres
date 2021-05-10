import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:velocity_x/velocity_x.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

const List<String> dataType = [
  'Select Type of Website',
  'All',
  'Remdesivir',
  'Plasma',
  'Oxygen',
  'Ventilator',
  'ICU',
  'Beds',
  'Food',
  'Other',
];

class _AddDataState extends State<AddData> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  CollectionReference resource =
      FirebaseFirestore.instance.collection('resourcesData');
  String title;
  String description;
  String url;
  bool showSpiner = false;
  Future<void> addData() async {
    try {
      return resource
          .add({
            'title': title,
            'description': description,
            'url': url,
            'type': selectedType,
            'approve': false,
          })
          .then((value) => showInSnackBar('Website Added Successfully'))
          .catchError(
              (error) => showInSnackBar('Faild to add Website: $error'));
    } catch (e) {
      showInSnackBar('Something Went Wrong');
    }
  }

  String selectedType = 'Select Type of Website';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in dataType) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedType,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedType = value;
          print(selectedType);
        });
      },
    );
  }

  final textfield1 = TextEditingController();
  final textfield2 = TextEditingController();
  final textfield3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ModalProgressHUD(
            inAsyncCall: showSpiner,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  60.heightBox,
                  Text(
                    'Add Your Website',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff96AAFE)),
                  ),
                  10.heightBox,
                  TextField(
                    controller: textfield1,
                    onChanged: (v) {
                      title = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title of Website',
                    ),
                  ).w(245),
                  10.heightBox,
                  TextField(
                    controller: textfield2,
                    onChanged: (v) {
                      description = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Short Description of Website',
                    ),
                  ).w(245),
                  10.heightBox,
                  TextField(
                    controller: textfield3,
                    onChanged: (v) {
                      url = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Url of the Website',
                    ),
                  ).w(245),
                  10.heightBox,
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          androidDropdown(),
                          'Its mean your website Contain \nwhich Type of Data'
                              .text
                              .center
                              .makeCentered(),
                        ],
                      )).w(245),
                  10.heightBox,
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlueAccent)),
                    child: TextButton(
                      onPressed: () {
                        if (title == null ||
                            title == '' ||
                            description == null ||
                            description == '' ||
                            url == null ||
                            url == '') {
                          showInSnackBar('Please Input All values');
                        } else {
                          textfield1.clear();
                          textfield2.clear();
                          textfield3.clear();
                          addData();
                          showSpiner = true;
                        }
                      },
                      child: "Submit".text.make(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
