import '../../domain/entities/character.dart';

/*
* {
items: [
0: {
id: 1
name: "Goku"
ki: "60.000.000"
maxKi: "90 Septillion"
race: "Saiyan"
gender: "Male"
description: "El protagonista de la serie, conocido por su gran poder y personalidad amigable. Originalmente envia..."
image: "https://dragonball-api.com/characters/goku_normal.webp"
affiliation: "Z Fighter"
deletedAt: null
}
1: {
id: 2
name: "Vegeta"
ki: "54.000.000"
maxKi: "19.84 Septillion"
race: "Saiyan"
gender: "Male"
description: "Príncipe de los Saiyans, inicialmente un villano, pero luego se une a los Z Fighters. A pesar de que..."
image: "https://dragonball-api.com/characters/vegeta_normal.webp"
affiliation: "Z Fighter"
deletedAt: null
}]
}
* */

class CharactersModel {
  final List<CharacterModel> characters;

  CharactersModel({required this.characters});

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['items'];
    return CharactersModel(
      characters: data.map((json) => CharacterModel.fromJson(json)).toList()
    );
  }

  // Método para convertir a la entidad Character
  List<Character> toEntity() {
    return characters.map((character) => character.toEntity()).toList();
  }
}


class CharacterModel {
  final int id;
  final String name;
  final String image;
  final String ki;

  CharacterModel({required this.id, required this.name, required this.image, required this.ki});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      ki: json['ki']
    );
  }

  // Método para convertir a la entidad Character
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      image: image,
      ki: ki
    );
  }
}