import 'dart:io';

import 'package:first_project/drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '9thpage.dart';

class EighthScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phoneno;
  final List<String> selectedDays;
  final String selectedGender;

  EighthScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneno,
    required this.selectedDays,
    required this.selectedGender,
  }) : super(key: key);

  @override
  State<EighthScreen> createState() => _EighthScreenState();
}

class _EighthScreenState extends State<EighthScreen> {
  File? _selectedImage;
  File? _camera;

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          _camera = File(pickedImage.path);
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.photo_library,
                color: Colors.white,
              ),
              onPressed: () {
                _pickImageFromGallery();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
            Text('Select any one'),
            IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {
                _pickImageFromCamera();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Image Selection Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TenthScreen(
                          email: '',
                          phoneno: '',
                          name: 'name',
                          selectedDays: [],
                          selectedGender: 'selectedGender')),
                );
              },
              icon: Icon(Icons.arrow_circle_right))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showCustomSnackBar(context),
              child: Text('Please click one image'),
            ),
            SizedBox(height: 20),
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Text(''),
            _camera != null
                ? Image.file(
                    _camera!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Text(''),
            ElevatedButton(
              onPressed: () {
                if (_selectedImage == null && _camera == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select at least one image'),
                    ),
                  );
                  return;
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TenthScreen(
                        name: widget.name,
                        email: widget.email,
                        phoneno: widget.phoneno,
                        selectedDays: widget.selectedDays,
                        selectedGender: widget.selectedGender,
                        image: _selectedImage,
                        image1: _camera,
                      ),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      drawer: SeventhScreenStateDrawer(),
    );
  }
}
