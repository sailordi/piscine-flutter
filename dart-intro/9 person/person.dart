class Person {
  String name = '';
  String surname = '';
  String cityOfOrigin = '';
  int age = 0;
  int height = 0; 

  Person(String name,String cityOfOrigin,int age,int height,{String? surname}) {
    this.name = name;
    this.cityOfOrigin = cityOfOrigin;
    this.age = age;
    this.height = height;
    if(surname != null) {
      this.surname = surname;
    }

  }

  void output() {
    if(this.surname == '') {
      print('Name: $name, City of origin $cityOfOrigin, age $age, height: $height');  
    } else {
      print('Name: $name, City of origin $cityOfOrigin, age $age, height: $height, surname $surname');  
    }
    
  }
}

void main() {
  Person p1 = Person("Simon", "Mariehamn", 30, 180);
  Person p2 = Person("Simon", "Mariehamn", 30, 180,surname: 'Karlsson');

  p1.output();
  p2.output();
}