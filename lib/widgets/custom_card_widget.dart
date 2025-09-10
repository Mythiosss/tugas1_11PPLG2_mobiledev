import 'package:flutter/material.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';

class CustomCardWidget extends StatelessWidget {
  final Color bgcolor;
  final Icon iconDel;
  final Icon iconDone;
  final String text;
  final String todo;
  final VoidCallback onDone;
  final VoidCallback onDelete;



  const CustomCardWidget({
    super.key, 
    required this.bgcolor, 
    required this.text, 
    required this.todo, 
    required this.iconDel, 
    required this.iconDone, 
    required this.onDone, 
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {  
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
            leading: CircleAvatar(
            backgroundColor: bgcolor,
            child: iconDone,
          ),
          title: Text(text),
          subtitle: Text(todo),
          trailing: IconButton(
          icon: iconDel,
          onPressed: onDelete,
        ),
        onTap: onDone,
      ),
    );
  }
}
