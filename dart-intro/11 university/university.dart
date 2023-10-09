class University {
  String _name = '';
  String _city = '';
  int? _ranking;

  University(String name,String city,{int? ranking}) {
    this._name = name;
    this._city = city;
    this._ranking = ranking;
  }

  String name() {
    return _name;
  }

  String city() {
    return _city;
  }

  int? ranking() {
    return _ranking;
  }

  void output() {
    if(_ranking == null) {
      print('Name: $_name, city: $_city');
    } else {
      print('Name: $_name, city: $_city, ranking: $_ranking');
    }
  }

}

void main() {
  University u1 = University("U1", "City1");
  University u2 = University("U2", "City2",ranking: 1);

  u1.output();
  u2.output();
}