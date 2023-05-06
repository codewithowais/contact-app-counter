import 'package:b2class/utils/color-constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var count = 0;

  inc() {
    setState(() {
      count++; 
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: ColorConstants.primaryColor,
          ),
          Text("count: $count"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          inc();
        },
      ),
    );
  }
}
