import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 15;

  void increase() {
    setState(() {
      counter++;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  void decrese() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize30 = const TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Numero de cliks',
            style: fontSize30,
          ),
          Text(
            '$counter',
            style: fontSize30,
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        resetFn: reset,
        decreaseFn: decrese,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function resetFn;
  final Function decreaseFn;

  const CustomFloatingActions(
      {Key? key,
      required this.increaseFn,
      required this.resetFn,
      required this.decreaseFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: Icon(Icons.exposure_minus_1),
          onPressed: () => decreaseFn(),
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_plus_1),
          onPressed: () => increaseFn(),
        )
      ],
    );
  }
}
