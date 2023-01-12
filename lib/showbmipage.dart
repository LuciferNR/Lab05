import 'package:flutter/material.dart';

class ShowBMI extends StatefulWidget {
  const ShowBMI(
      {super.key,
      required this.bminew,
      required this.weightnew,
      required this.heightnew});

  final double bminew;
  final String weightnew;
  final String heightnew;

  @override
  State<ShowBMI> createState() => _ShowBMIState();
}

class _ShowBMIState extends State<ShowBMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แสดงค่า"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("น้ำหนัก "),
                  Text(widget.weightnew),
                  Text(" kg."),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("ส่วนสูง "),
                  Text(widget.heightnew),
                  Text(" cm."),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("ค่าBMI ที่ได้ :"),
                  Text(widget.bminew.toStringAsFixed(3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
