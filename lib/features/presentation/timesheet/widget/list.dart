import 'package:flutter/material.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sticky_note_2_outlined,
                    color: Colors.grey,
                    size: 40,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Không có dữ liệu',
                    style: TextStyle(fontSize: 20,color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
