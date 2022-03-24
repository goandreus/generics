import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:generics/utils/search_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        width: double.infinity,
        child: Column(children: [
          TextButton(onPressed: () async {
            final data = await
            showSearchPicker(context, items: [
              SearchPickerItem(label: 'Lunes' , value: 'Lunes'),
              SearchPickerItem(label: 'Martes' , value: 'Martes'),
              SearchPickerItem(label: 'Miercoles' , value: 'Miercoles'),
            ]);
            log(data);
          }, child: Text('Selecciona la ciudad'),),
        ],),
      ),),
    );
  }
}