import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(6.0),
          child: Image.asset("assets/images/icon.png",height: 50,width: 50,fit: BoxFit.fill,),
        ),const SizedBox(width: 8,),
        const Text('Beit Rent',style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}
