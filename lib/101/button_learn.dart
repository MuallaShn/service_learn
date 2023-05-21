import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: (){}, child: Text("Save")),
          ElevatedButton(onPressed: (){}, child: Text("Save")),
          IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm)),
          FloatingActionButton(onPressed:  (){},child: Icon(Icons.account_balance),),
          OutlinedButton(onPressed:(){}, child: Text("Save")),
          InkWell(
            onTap: (){},
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
