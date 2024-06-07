import 'package:flutter/material.dart';
import 'package:project2/DB/personService.dart';
import 'package:project2/entities/person.dart';

import 'package:project2/myrow.dart';
import 'package:project2/newformscreen.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  List<Person> persons = [];

  @override
  void initState() {
    super.initState();
    persons = Personservice().getAllPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("${persons.length} persons found"),
            for (int i = 0; i < persons.length; i++)
              MyRow(
                  fileName: persons[i].imgPath,
                  name: persons[i].name,
                  initialSusCounter: persons[i].susCount),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: FilledButton(
                onPressed: () async {
                  // Navigate to NewFormScreen and wait for the result
                  final newPerson = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewFormScreen(),
                    ),
                  );

                  // If a new person was added, update the list
                  if (newPerson != null && newPerson is Person) {
                    setState(() {
                      persons = Personservice().getAllPersons();
                    });
                  }
                },
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
