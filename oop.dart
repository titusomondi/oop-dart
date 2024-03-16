# Define an interface
class FileParser:
    def parse(self, file_name):
        raise NotImplementedError("Method 'parse' must be implemented")


# Implement the interface
class CSVParser(FileParser):
    def parse(self, file_name):
        with open(file_name, 'r') as file:
            data = []
            for line in file:
                data.append(line.strip().split(','))
            return data


# Define a base class with inheritance
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError("Method 'speak' must be implemented")


# Implement a subclass that overrides a method
class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"


# Create an instance of a class initialized with data from a file
if __name__ == "__main__":
    file_name = "animals.csv"
    parser = CSVParser()
    animal_data = parser.parse(file_name)

    for data in animal_data:
        if data[0] == 'dog':
            animal = Dog(data[1])
            print(animal.speak())
