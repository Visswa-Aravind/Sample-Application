import 'dart:io';

import 'package:first_project/drawer.dart';
import 'package:flutter/material.dart';

import '1stpage.dart';

class TenthScreen extends StatelessWidget {
  final File? image;
  final File? image1;
  final String name;
  final String email;
  final String phoneno;
  final List<String> selectedDays;
  final String selectedGender;

  const TenthScreen({
    super.key,
    this.image,
    this.image1,
    required this.email,
    required this.phoneno,
    required this.name,
    required this.selectedDays,
    required this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form Results Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
              icon: Icon(Icons.arrow_circle_right))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Phone Number')),
                  DataColumn(label: Text('WFH Days')),
                  DataColumn(label: Text('Gender')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(name)),
                    DataCell(Text(email)),
                    DataCell(Text(phoneno)),
                    DataCell(Text(selectedDays.join(', '))),
                    DataCell(Text(selectedGender)),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (image != null && image1 == null)
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else if (image1 != null && image == null)
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: FileImage(image1!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  Text('No image selected'),
              ],
            ),
          ],
        ),
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
