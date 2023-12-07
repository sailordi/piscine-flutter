import 'package:uuid/uuid.dart';

class MarkerWrapper {
  late final String id;
  String name;

  MarkerWrapper({this.name = ""}) {
    var uuid = const Uuid();

    id = uuid.v1();
  }

}