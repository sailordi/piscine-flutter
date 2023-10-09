class Person {
  String name = '';
  String? surname;
  String cityOfOrigin = '';
  int age = 0;
  int height = 0; 

  Person({required this.name,required this.cityOfOrigin,required this.age,required this.height,String? this.surname});

  void output() {
    if(this.surname == null) {
      print('Name: $name, City of origin $cityOfOrigin, age $age, height: $height');  
    } else {
      print('Name: $name, City of origin $cityOfOrigin, age $age, height: $height, surname $surname');  
    }
    
  }
}

class Student extends Person{
  int batch = 0;
  int level = 0;
  String _secretKey = '01';

Student({required String name,required String cityOfOrigin,required int age, required int height,required this.batch,required this.level,String? surname,String? secretKey}) : super(
          name: name,
          cityOfOrigin: cityOfOrigin,
          age: age,
          height: height,
          surname: surname
        ) {

          if(secretKey != null) {
            this._secretKey = secretKey;
          }

        }

  @override
  void output() {
    if(this.surname == null && this._secretKey == null) {
      print('Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height');  
    } else if(this.surname != null && this._secretKey == null) {
      print('Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height, surname: $surname');  
    }else if(this.surname == null && this._secretKey != null) {
      print('Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height, secret key: $_secretKey');  
    }else if(this.surname != null && this._secretKey != null) {
      print('Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height, surname: $surname, secret key: $_secretKey');  
    }
    
  }

}

void main() {
  Student s1 = Student(name: 'Simon', cityOfOrigin: 'Mariehamn', age: 31, height: 170, batch: 1, level: 2);
  Student s2 = Student(name: 'Simon', cityOfOrigin: 'Mariehamn', age: 31, height: 170, batch: 1, level: 2,surname: 'Karlsson');
  Student s3 = Student(name: 'Simon', cityOfOrigin: 'Mariehamn', age: 31, height: 170, batch: 1, level: 2,surname: 'Karlsson',secretKey: '02');

  s1.output();
  s2.output();
  s3.output();
}