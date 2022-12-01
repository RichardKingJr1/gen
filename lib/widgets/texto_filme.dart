import 'package:flutter/material.dart';

class TextoFilme extends StatelessWidget {
  final String valor;
  final double size;
  final double padding;
  const TextoFilme(
    this.valor,{
    Key? key,
    this.size = 20,
    this.padding = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List parts;
    if(valor.contains(":")){
      int idx = valor.indexOf(":");
      parts = [valor.substring(0,idx+1).trim(), valor.substring(idx+1).trim()];
    }else{
      parts = [valor];
    }
    

    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              parts[0],
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: size,
              ),
            ),
          ),
          if(valor.contains(":"))
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              parts[1],
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}