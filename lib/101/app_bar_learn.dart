import 'package:flutter/material.dart';
class AppBarLearn extends StatelessWidget {
  const AppBarLearn({Key? key}) : super(key: key);

final String _title="Welcome learn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.arrow_back_outlined),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.mail),),
          Center(child: CircularProgressIndicator()),
        ],
      ),
      body: Column(children: [],),
    );
  }
}
