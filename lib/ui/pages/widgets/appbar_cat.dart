import 'package:flutter/material.dart';

class AppBarCat extends StatelessWidget with PreferredSizeWidget{
  final String text;
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const AppBarCat({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          text, 
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontFamily: 'TitilliumWeb',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
    );
  }
}