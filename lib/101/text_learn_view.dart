import 'package:flutter/material.dart';
class TextLearnView extends StatelessWidget {
  const TextLearnView({Key? key, }) : super(key: key);
final String name='mualla';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(('Welcome $name ${name.length}'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.black
              ),
            ),
          ],
        ),

      ),
    );

  }
}
class ProjectStyles{
  static TextStyle welcomeStyle=const TextStyle(
    wordSpacing: 2,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    letterSpacing: 2,
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
      );
}
