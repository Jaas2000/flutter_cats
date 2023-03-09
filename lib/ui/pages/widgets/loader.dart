import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        mainAxisSize: MainAxisSize.min, 
        children: [
          const Text(
            "Cat Breeds", 
            style: TextStyle(
              fontSize: 70, 
              color: Colors.teal,
              fontWeight: FontWeight.w900,
              fontFamily: 'TitilliumWeb',
              letterSpacing: 3.0,
            ),
          ),

          const SizedBox(height: 20),

          Lottie.asset(
            'assets/lotties/loading.json',
            height: MediaQuery.of(context).size.height * 0.4
          ),               
        ]
      ),
    );
  }
}