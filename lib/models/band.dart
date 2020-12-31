class Band {
  String id;
  String name;
  int votes;

  Band({this.id, this.name, this.votes});
//el factory constructor tiene por objetivo regresar una nueva instranacia de la clase
//
  factory Band.fromMap(Map<String, dynamic> obj) =>
      Band(id: obj['id'], name: obj['name'], votes: obj['votes']);


}
