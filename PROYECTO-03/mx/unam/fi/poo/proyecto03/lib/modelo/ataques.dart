class Ataque {
  final String nombre;
  final String tipo;
  final int potencia;

  Ataque({
    required this.nombre,
    required this.tipo,
    required this.potencia,
  });
}

class AtaqueNormal extends Ataque {
  AtaqueNormal({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Normal', potencia: potencia);
}

class AtaqueFuego extends Ataque {
  AtaqueFuego({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Fuego', potencia: potencia);
}

class AtaqueAgua extends Ataque {
  AtaqueAgua({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Agua', potencia: potencia);
}

class AtaqueElectrico extends Ataque {
  AtaqueElectrico({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Electrico', potencia: potencia);
}

class AtaquePlanta extends Ataque {
  AtaquePlanta({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Planta', potencia: potencia);
}

class AtaqueHielo extends Ataque {
  AtaqueHielo({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Hielo', potencia: potencia);
}

class AtaqueLucha extends Ataque {
  AtaqueLucha({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Lucha', potencia: potencia);
}

class AtaqueVeneno extends Ataque {
  AtaqueVeneno({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Veneno', potencia: potencia);
}

class AtaqueTierra extends Ataque {
  AtaqueTierra({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Tierra', potencia: potencia);
}

class AtaqueVolador extends Ataque {
  AtaqueVolador({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Volador', potencia: potencia);
}

class AtaquePsiquico extends Ataque {
  AtaquePsiquico({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Psiquico', potencia: potencia);
}

class AtaqueBicho extends Ataque {
  AtaqueBicho({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Bicho', potencia: potencia);
}

class AtaqueRoca extends Ataque {
  AtaqueRoca({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Roca', potencia: potencia);
}

class AtaqueFantasma extends Ataque {
  AtaqueFantasma({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Fantasma', potencia: potencia);
}

class AtaqueDragon extends Ataque {
  AtaqueDragon({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Dragon', potencia: potencia);
}

class AtaqueSiniestro extends Ataque {
  AtaqueSiniestro({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Siniestro', potencia: potencia);
}

class AtaqueAcero extends Ataque {
  AtaqueAcero({required String nombre, required int potencia})
      : super(nombre: nombre, tipo: 'Acero', potencia: potencia);
}

final List<Ataque> ataquesNormales = [
  AtaqueNormal(nombre: 'Placaje', potencia: 40),
  AtaqueNormal(nombre: 'Derribo', potencia: 90),
  AtaqueNormal(nombre: 'Hiperrayo', potencia: 150),
];

final List<Ataque> ataquesFuego = [
  AtaqueFuego(nombre: 'Ascuas', potencia: 40),
  AtaqueFuego(nombre: 'Lanzallamas', potencia: 90),
  AtaqueFuego(nombre: 'Llamarada', potencia: 110),
];

final List<Ataque> ataquesAgua = [
  AtaqueAgua(nombre: 'Pistola Agua', potencia: 40),
  AtaqueAgua(nombre: 'Surf', potencia: 90),
  AtaqueAgua(nombre: 'Hidrobomba', potencia: 110),
];

final List<Ataque> ataquesElectricos = [
  AtaqueElectrico(nombre: 'Impactrueno', potencia: 40),
  AtaqueElectrico(nombre: 'Rayo', potencia: 90),
  AtaqueElectrico(nombre: 'Trueno', potencia: 110),
];

final List<Ataque> ataquesPlanta = [
  AtaquePlanta(nombre: 'Látigo Cepa', potencia: 45),
  AtaquePlanta(nombre: 'Hoja Afilada', potencia: 55),
  AtaquePlanta(nombre: 'Rayo Solar', potencia: 120),
];

final List<Ataque> ataquesHielo = [
  AtaqueHielo(nombre: 'Canto Helado', potencia: 40),
  AtaqueHielo(nombre: 'Rayo Hielo', potencia: 90),
  AtaqueHielo(nombre: 'Ventisca', potencia: 110),
];

final List<Ataque> ataquesLucha = [
  AtaqueLucha(nombre: 'Golpe Roca', potencia: 40),
  AtaqueLucha(nombre: 'Demolición', potencia: 75),
  AtaqueLucha(nombre: 'A Bocajarro', potencia: 120),
];

final List<Ataque> ataquesVeneno = [
  AtaqueVeneno(nombre: 'Ácido', potencia: 40),
  AtaqueVeneno(nombre: 'Bomba Lodo', potencia: 90),
  AtaqueVeneno(nombre: 'Lanza Mugre', potencia: 120),
];

final List<Ataque> ataquesTierra = [
  AtaqueTierra(nombre: 'Disparo Lodo', potencia: 55),
  AtaqueTierra(nombre: 'Excavar', potencia: 80),
  AtaqueTierra(nombre: 'Terremoto', potencia: 100),
];

final List<Ataque> ataquesVoladores = [
  AtaqueVolador(nombre: 'Picotazo', potencia: 35),
  AtaqueVolador(nombre: 'Golpe Aéreo', potencia: 60),
  AtaqueVolador(nombre: 'Pájaro Osado', potencia: 120),
];

final List<Ataque> ataquesPsiquicos = [
  AtaquePsiquico(nombre: 'Confusión', potencia: 50),
  AtaquePsiquico(nombre: 'Psíquico', potencia: 90),
  AtaquePsiquico(nombre: 'Premonición', potencia: 120),
];

final List<Ataque> ataquesBichos = [
  AtaqueBicho(nombre: 'Corte Furia', potencia: 40),
  AtaqueBicho(nombre: 'Tijera X', potencia: 80),
  AtaqueBicho(nombre: 'Megacuerno', potencia: 120),
];

final List<Ataque> ataquesRoca = [
  AtaqueRoca(nombre: 'Lanzarrocas', potencia: 50),
  AtaqueRoca(nombre: 'Avalancha', potencia: 75),
  AtaqueRoca(nombre: 'Roca Afilada', potencia: 100),
];

final List<Ataque> ataquesFantasmas = [
  AtaqueFantasma(nombre: 'Lengüetazo', potencia: 30),
  AtaqueFantasma(nombre: 'Bola Sombra', potencia: 80),
  AtaqueFantasma(nombre: 'Golpe Fantasma', potencia: 90),
];

final List<Ataque> ataquesDragones = [
  AtaqueDragon(nombre: 'Ciclón', potencia: 40),
  AtaqueDragon(nombre: 'Garra Dragón', potencia: 80),
  AtaqueDragon(nombre: 'Cometa Draco', potencia: 130),
];

final List<Ataque> ataquesSiniestros = [
  AtaqueSiniestro(nombre: 'Mordisco', potencia: 60),
  AtaqueSiniestro(nombre: 'Triturar', potencia: 80),
  AtaqueSiniestro(nombre: 'Juego Sucio', potencia: 95),
];

final List<Ataque> ataquesAcero = [
  AtaqueAcero(nombre: 'Puño Bala', potencia: 40),
  AtaqueAcero(nombre: 'Cabezahierro', potencia: 80),
  AtaqueAcero(nombre: 'Cola Férrea', potencia: 100),
];