import 'dart:math';
import 'ataques.dart';

class Pokemon {
  final String nombre;
  final int nivel;
  final String tipo;
  final String imagen;
  double vida;
  final double velocidad;
  List<Ataque> ataques = [];
  
  static final Random _random = Random();

  Pokemon({
    required this.nombre,
    required this.nivel,
    required this.tipo,
    required this.imagen,
  })  : vida = 300.0 + ((_random.nextDouble() * 20 + 10) * nivel),
        velocidad = (_random.nextDouble() * 3 + 1) * nivel;
}

class PokemonNormal extends Pokemon {
  PokemonNormal({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Normal', imagen: imagen) {
    ataques = ataquesNormales;
  }
}

class PokemonFuego extends Pokemon {
  PokemonFuego({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Fuego', imagen: imagen) {
    ataques = ataquesFuego;
  }
}

class PokemonAgua extends Pokemon {
  PokemonAgua({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Agua', imagen: imagen) {
    ataques = ataquesAgua;
  }
}

class PokemonPlanta extends Pokemon {
  PokemonPlanta({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Planta', imagen: imagen) {
    ataques = ataquesPlanta;
  }
}

class PokemonElectrico extends Pokemon {
  PokemonElectrico({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Electrico', imagen: imagen) {
    ataques = ataquesElectricos;
  }
}

class PokemonHielo extends Pokemon {
  PokemonHielo({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Hielo', imagen: imagen) {
    ataques = ataquesHielo;
  }
}

class PokemonLucha extends Pokemon {
  PokemonLucha({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Lucha', imagen: imagen) {
    ataques = ataquesLucha;
  }
}

class PokemonVeneno extends Pokemon {
  PokemonVeneno({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Veneno', imagen: imagen) {
    ataques = ataquesVeneno;
  }
}

class PokemonTierra extends Pokemon {
  PokemonTierra({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Tierra', imagen: imagen) {
    ataques = ataquesTierra;
  }
}

class PokemonVolador extends Pokemon {
  PokemonVolador({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Volador', imagen: imagen) {
    ataques = ataquesVoladores;
  }
}

class PokemonPsiquico extends Pokemon {
  PokemonPsiquico({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Psiquico', imagen: imagen) {
    ataques = ataquesPsiquicos;
  }
}

class PokemonBicho extends Pokemon {
  PokemonBicho({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Bicho', imagen: imagen) {
    ataques = ataquesBichos;
  }
}

class PokemonRoca extends Pokemon {
  PokemonRoca({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Roca', imagen: imagen) {
    ataques = ataquesRoca;
  }
}

class PokemonFantasma extends Pokemon {
  PokemonFantasma({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Fantasma', imagen: imagen) {
    ataques = ataquesFantasmas;
  }
}

class PokemonDragon extends Pokemon {
  PokemonDragon({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Dragon', imagen: imagen) {
    ataques = ataquesDragones;
  }
}

class PokemonSiniestro extends Pokemon {
  PokemonSiniestro({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Siniestro', imagen: imagen) {
    ataques = ataquesSiniestros;
  }
}

class PokemonAcero extends Pokemon {
  PokemonAcero({required String nombre, required int nivel, required String imagen})
      : super(nombre: nombre, nivel: nivel, tipo: 'Acero', imagen: imagen) {
    ataques = ataquesAcero;
  }
}

final List<Pokemon> listaPokemones = [
  PokemonNormal(nombre: "Snorlax", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/0/0b/latest/20160904204605/Snorlax.png"),
  PokemonFuego(nombre: "Charizard", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/9/95/latest/20160817212623/Charizard.png"),
  PokemonAgua(nombre: "Blastoise", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/4/41/latest/20200411222955/Blastoise.png"),
  PokemonPlanta(nombre: "Venusaur", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/b/be/latest/20160309230456/Venusaur.png"),
  PokemonElectrico(nombre: "Pikachu", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/7/77/latest/20150621181250/Pikachu.png"),
  PokemonHielo(nombre: "Jynx", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/e/e2/latest/20230529045936/Jynx.png"),
  PokemonLucha(nombre: "Machamp", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/b/bf/latest/20230614200701/Machamp.png"),
  PokemonVeneno(nombre: "Koffing", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/b/b2/latest/20230627050743/Koffing.png"),
  PokemonTierra(nombre: "Marowak", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/c/c4/latest/20161104013901/Marowak.png"),
  PokemonVolador(nombre: "Aerodactyl", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/e/e6/latest/20230717180421/Aerodactyl.png"),
  PokemonPsiquico(nombre: "Alakazam", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/f/f5/latest/20230716211853/Alakazam.png"),
  PokemonBicho(nombre: "Scyther", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/c/c2/latest/20230614202858/Scyther.png"),
  PokemonRoca(nombre: "Onix", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/b/b2/latest/20141214194849/Onix.png"),
  PokemonFantasma(nombre: "Gengar", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/f/f8/latest/20200428203046/Gengar.png"),
  PokemonDragon(nombre: "Dragonite", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/a/a6/latest/20230518040921/Dragonite.png"),
  PokemonSiniestro(nombre: "Umbreon", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/9/9f/latest/20230521191655/Umbreon.png"),
  PokemonAcero(nombre: "Metagross", nivel: 50, imagen: "https://images.wikidexcdn.net/mwuploads/wikidex/9/95/latest/20141214183056/Metagross.png"),
];