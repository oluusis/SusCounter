import 'package:flutter/material.dart';

class MyRow extends StatefulWidget {
  final String name;
  final int initialSusCounter;
  final String? fileName;

  const MyRow({
    this.fileName,
    required this.name,
    required this.initialSusCounter,
    super.key,
  });

  @override
  _MyRowState createState() => _MyRowState(initialSusCounter);
}

class _MyRowState extends State<MyRow> {
  int susCounter;

  _MyRowState(this.susCounter);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (widget.fileName != null)
            Image.asset(
              widget.fileName!,
              width: 25,
            ),
          Text(
            "${widget.name}:",
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
          const SizedBox(width: 10),
          if (susCounter != 0)
            Text(
              susCounter.toString(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            )
          else
            const Text(
              "neSUS",
              style: TextStyle(fontSize: 30),
            ),
          const Expanded(
            child: SizedBox(),
          ),
          FilledButton(onPressed: onPressed, child: const Text("+")),
          FilledButton(
              onPressed: () => resetSusCounter(), child: const Text("↺")),
          FilledButton(
              onPressed: () => () => onClickRemove(), child: const Text("X")),
        ],
      ),
    );
  }

  void onClickRemove() {
    setState(() {
      this.dispose();
    });
  }

  void onPressed() {
    setState(() {
      susCounter++;
    });
  }

  void resetSusCounter() {
    setState(() {
      susCounter = 0;
    });
  }
}
