import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage(this.registerImage, {Key? key}) : super(key: key);

  final Function(File pickedImageFile) registerImage;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blue,
          backgroundImage: pickedFile != null ? FileImage(pickedFile!) : null,
        ),
        const SizedBox(height: 16.0),
        OutlinedButton.icon(
          onPressed: () => _pickImage(),
          icon: const Icon(Icons.image),
          label: const Text('Add icon'),
        ),
      ],
    );
  }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
      source: Platform.isAndroid ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 150,
    );
    setState(() {
      if (pickedImageFile != null) {
        pickedFile = File(pickedImageFile.path);
      }
    });
    widget.registerImage(pickedFile!);
  }
}
