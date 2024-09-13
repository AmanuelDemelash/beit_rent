import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FilterView extends GetView {
  const FilterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FilterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
