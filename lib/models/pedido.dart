class Pedido {
  String pedidoId;
  String title;
  String horaInicio;
  String horaFin;
  String mentor;
  String date;
  String tipo;
  String estado;
  final mentorObject;
  Pedido(
      {required this.pedidoId,
      required this.title,
      required this.horaInicio,
      required this.horaFin,
      required this.mentor,
      required this.estado,
      required this.date,
      required this.mentorObject,
      required this.tipo});

  String toString() => this.title;

  factory Pedido.fromJson(List<dynamic> data) {
    var first = data[0];
    return Pedido(
        pedidoId: first['id'].toString(),
        title: first['event_name'],
        date: first['start_date'],
        tipo: first['tipo'],
        horaInicio: first['hora_inicio'],
        horaFin: first['horaFin'],
        mentor: first['mentor'],
        estado: first['estado'],
        mentorObject: first["mentorObject"]);
  }
}
