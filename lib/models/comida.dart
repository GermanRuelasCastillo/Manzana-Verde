class Comida {
  String id;
  String nombre;
  String ingredientes;
  String calorias;
  String grasa;
  String carbohidratos;
  String proteinas;
  bool bajoSodio;
  bool bajoAzucar;
  bool bajoGluten;
  bool lactosa;
  bool bajoCarbohidratos;
  bool recomendado;

  Comida({
    required this.id,
    required this.nombre,
    required this.ingredientes,
    required this.calorias,
    required this.grasa,
    required this.carbohidratos,
    required this.proteinas,
    required this.bajoSodio,
    required this.bajoAzucar,
    required this.bajoGluten,
    required this.lactosa,
    required this.bajoCarbohidratos,
    required this.recomendado,
  });

  // String toString() => this.title;

  factory Comida.fromJson(List<dynamic> data) {
    var first = data[0];
    return Comida(
      id: first['id'],
      nombre: first['nombre'],
      ingredientes: first['ingredientes'],
      calorias: first['calorias'],
      grasa: first['grasa'],
      carbohidratos: first['carbohidratos'],
      proteinas: first['proteinas'],
      bajoSodio: first['bajoSodio'],
      bajoAzucar: first['bajoAzucar'],
      bajoGluten: first['bajoGluten'],
      lactosa: first['lactosa'],
      bajoCarbohidratos: first['bajoCarbohidratos'],
      recomendado: first['recomendado'],
    );
  }
}
