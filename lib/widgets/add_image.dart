import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blue,
        ),
        const SizedBox(height: 16.0),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.image),
          label: const Text('Add icon'),
        ),
      ],
    );
  }
}
