import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2/DB/personService.dart';
import 'package:project2/entities/person.dart';

class NewFormScreen extends StatefulWidget {
  const NewFormScreen({super.key});

  @override
  State<NewFormScreen> createState() => _NewFormScreenState();
}

class _NewFormScreenState extends State<NewFormScreen> {
  // Create text controllers to retrieve the input data
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _susCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Implement image picking logic if needed
              },
              icon: const Icon(Icons.image),
              label: const Text('Pick Image'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _susCountController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                labelText: 'Sus Counter',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Align the button to the right
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Get the data from the text controllers
                    final String name = _nameController.text;
                    final int susCount = int.parse(_susCountController.text);

                    // Create a new person
                    final newPerson =
                        Person(susCount, name, 'assets/img/default.png');

                    // Add the new person to the service
                    Personservice().addPerson(newPerson);

                    // Clear the text controllers
                    _nameController.clear();
                    _susCountController.clear();

                    // Return the new person to the previous screen
                    Navigator.pop(context, newPerson);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
