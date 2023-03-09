import 'package:cat_breeds/ui/pages/widgets/detail_info.dart';
import 'package:flutter/material.dart';

class DetailIndicator extends StatelessWidget {
  final String title;
  final int value;

  const DetailIndicator({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        DetailInfo(title: title, text: '$value'),

        LinearProgressIndicator(
          backgroundColor: Colors.tealAccent[100],
          color: Colors.teal,
          minHeight: 8,
          value: value/5,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}