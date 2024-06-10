import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String txt;
  final function;
  final Color color;


  const ButtonWidget({super.key, required this.txt,required this.function, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0, backgroundColor: color
      ),
      onPressed: function,
      child: Text(txt,style: Theme.of(context).textTheme.bodySmall,)
    );
  }
}
