import 'package:flutter/material.dart';

class SqfWidget{
  Widget textField ({required TextEditingController? controller,InputDecoration? decoration = const InputDecoration()}){
    return TextField(
     controller: controller,
    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );

}
    Widget elevatedButton ({required void Function()? onPressed ,required Widget? text}){
    return ElevatedButton(
    onPressed: onPressed,
    child: text);


}
  Widget text({required String? text}){
    return Text(text!);
}

  Widget appBar ({required Widget? title}){
    return AppBar(title: title);
  }

}