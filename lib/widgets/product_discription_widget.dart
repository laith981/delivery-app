import 'package:flutter/material.dart';

class ProductDiscriptionWidget extends StatelessWidget {
 final String titel;
 final String value;
  const ProductDiscriptionWidget({super.key, required this.titel, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titel,
          style:const TextStyle(
            color: Colors.black45,
           fontSize: 18,
           ),
          ),
        Text(
          value,
          style:const TextStyle(
            color: Colors.black,
           fontSize: 20,
           fontWeight: FontWeight.w500
           ),
          ),
        

      ],
    );
  }
}