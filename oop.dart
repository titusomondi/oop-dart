import 'dart:io';

// Define an interface
abstract class FileParser {
  List<List<String>> parse(String fileName);
}

// Implement the interface
class CSVParser implements FileParser {
  @override
  List<List<String>> parse(String fileName) {
    var data = <List<String>>[];
    var file = File(fileName);
    var lines = file.readAsLinesSync();
    for (var line in lines) {
      data.add(line.split(','));
    }
    return data;
  }
}

// Define a base class with inheritance
class Animal {
  String name;

  Animal(this.name);

  void speak() {
    throw UnimplementedError("Method 'speak' must be implemented");
  }
}

// Implement a subclass that overrides a method
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() {
    print('$name says Woof!');
  }
}

// Create an instance of a class initialized with data from a file
void main() {
  var fileName = 'animals.csv';
  var parser = CSVParser();
  var animalData = parser.parse(fileName);

  for (var data in animalData) {
    if (data[0] == 'dog') {
      var animal = Dog(data[1]);
      animal.speak();
    }
  }
}
