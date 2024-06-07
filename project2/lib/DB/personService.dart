import 'package:project2/entities/person.dart';

class Personservice {
  static final Personservice _instance = Personservice._internal();
  factory Personservice() => _instance;
  List<Person> persons = [];

  Personservice._internal() {
    // Initial data
    persons.add(Person(0, "Oliver", "assets/img/s1.png"));
    persons.add(Person(2, "Franta", "assets/img/s2.png"));
    persons.add(Person(6, "Michal", "assets/img/s3.png"));
    persons.add(Person(5, "rrrrr", "assets/img/s4.png"));
  }

  List<Person> getAllPersons() {
    return persons;
  }

  void addPerson(Person person) {
    persons.add(person);
  }
}
