import 'package:objectbox/objectbox.dart';

@Entity()
class Personas {
  @Id()
  int id = 0;

  String? name;
  String? email;

  Personas({this.name, this.email});
}