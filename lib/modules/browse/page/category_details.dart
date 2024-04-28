import 'package:flutter/material.dart';

class categoryDetails extends StatefulWidget {
  const categoryDetails({super.key,});

  @override
  State<categoryDetails> createState() => _categoryDetailsState();
}

class _categoryDetailsState extends State<categoryDetails> {

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);

    return  Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
      backgroundColor: theme.primaryColor,
      body: Center(child: Text('hello')),
    );
  }
}
