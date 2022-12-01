import 'package:flutter/material.dart';

class TextoTitulo extends StatelessWidget {
  final String valor;
  const TextoTitulo(
    this.valor,{
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Text(
        valor,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}