import 'dart:math';
import '../modelo/pokemon.dart';
import '../modelo/ataques.dart';
import '../vista/combate_view.dart';

final Map<String, Map<String, double>> tablaTipos = {
  'Normal': {
    'Roca': 0.5,
    'Acero': 0.5,
    'Fantasma': 0,
  },

  'Fuego': {
    'Planta': 2.0,
    'Hielo': 2.0,
    'Bicho': 2.0,
    'Acero': 2.0,
    'Fuego': 0.5,
    'Agua': 0.5,
    'Roca': 0.5,
    'Dragon': 0.5,
  },

  'Agua': {
    'Fuego': 2.0,
    'Tierra': 2.0,
    'Roca': 2.0,
    'Agua': 0.5,
    'Planta': 0.5,
    'Dragon': 0.5,
  },

  'Electrico': {
    'Agua': 2.0,
    'Volador': 2.0,
    'Planta': 0.5,
    'Electrico': 0.5,
    'Dragon': 0.5,
    'Tierra': 0,
  },

  'Planta': {
    'Agua': 2.0,
    'Tierra': 2.0,
    'Roca': 2.0,
    'Fuego': 0.5,
    'Planta': 0.5,
    'Veneno': 0.5,
    'Volador': 0.5,
    'Bicho': 0.5,
    'Dragon': 0.5,
    'Acero': 0.5,
  },

  'Hielo': {
    'Planta': 2.0,
    'Tierra': 2.0,
    'Volador': 2.0,
    'Dragon': 2.0,
    'Fuego': 0.5,
    'Agua': 0.5,
    'Hielo': 0.5,
    'Acero': 0.5,
  },

  'Lucha': {
    'Normal': 2.0,
    'Hielo': 2.0,
    'Roca': 2.0,
    'Siniestro': 2.0,
    'Acero': 2.0,
    'Veneno': 0.5,
    'Volador': 0.5,
    'Psiquico': 0.5,
    'Bicho': 0.5,
    'Fantasma': 0,
  },

  'Veneno': {
    'Planta': 2.0,
    'Veneno': 0.5,
    'Tierra': 0.5,
    'Roca': 0.5,
    'Fantasma': 0.5,
    'Acero': 0,
  },

  'Tierra': {
    'Fuego': 2.0,
    'Electrico': 2.0,
    'Veneno': 2.0,
    'Roca': 2.0,
    'Acero': 2.0,
    'Planta': 0.5,
    'Bicho': 0.5,
    'Volador': 0,
  },

  'Volador': {
    'Planta': 2.0,
    'Lucha': 2.0,
    'Bicho': 2.0,
    'Roca': 0.5,
    'Acero': 0.5,
    'Electrico': 0.5,
  },

  'Psiquico': {
    'Lucha': 2.0,
    'Veneno': 2.0,
    'Acero': 0.5,
    'Psiquico': 0.5,
    'Siniestro': 0,
  },

  'Bicho': {
    'Planta': 2.0,
    'Psiquico': 2.0,
    'Siniestro': 2.0,
    'Fuego': 0.5,
    'Lucha': 0.5,
    'Veneno': 0.5,
    'Volador': 0.5,
    'Fantasma': 0.5,
    'Acero': 0.5,
  },

  'Roca': {
    'Fuego': 2.0,
    'Hielo': 2.0,
    'Volador': 2.0,
    'Bicho': 2.0,
    'Lucha': 0.5,
    'Tierra': 0.5,
    'Acero': 0.5,
  },

  'Fantasma': {
    'Psiquico': 2.0,
    'Fantasma': 2.0,
    'Siniestro': 0.5,
    'Normal': 0,
  },

  'Dragon': {
    'Dragon': 2.0,
    'Acero': 0.5,
  },

  'Siniestro': {
    'Psiquico': 2.0,
    'Fantasma': 2.0,
    'Lucha': 0.5,
    'Siniestro': 0.5,
  },

  'Acero': {
    'Hielo': 2.0,
    'Roca': 2.0,
    'Acero': 0.5,
    'Fuego': 0.5,
    'Agua': 0.5,
    'Electrico': 0.5,
  },
};

class CombateController {
  final CombateView view;
  final Random _random = Random();

  CombateController(this.view);

  void iniciarTurnoFlutter(Pokemon p1, Pokemon p2, Ataque ataqueJugador) {

    if (p1.vida <= 0 || p2.vida <= 0) return;

    view.mostrarSiguienteTurno();

    if (p1.velocidad >= p2.velocidad) {
      _atacar(p1, p2, ataqueJugador);
      if (p2.vida > 0) {
        final ataqueRival = p2.ataques[_random.nextInt(p2.ataques.length)];
        _atacar(p2, p1, ataqueRival);
      }
    } else {
      final ataqueRival = p2.ataques[_random.nextInt(p2.ataques.length)];
      _atacar(p2, p1, ataqueRival);
      if (p1.vida > 0) {
        _atacar(p1, p2, ataqueJugador);
      }
    }

    if (p1.vida <= 0) {
      view.mostrarDesmayo(p1);
      view.mostrarGanador(p2, p1);
    } else if (p2.vida <= 0) {
      view.mostrarDesmayo(p2);
      view.mostrarGanador(p1, p2);
    }
  }

  void _atacar(Pokemon atacante, Pokemon defensor, Ataque ataque) {
    view.mostrarAtaque(atacante, defensor, ataque);

    double multiplicador = tablaTipos[ataque.tipo]?[defensor.tipo] ?? 1.0;

    if (multiplicador == 2.0) view.mostrarSuperEfectivo();
    if (multiplicador == 0.5) view.mostrarPocoEfectivo();
    if (multiplicador == 0.0) view.mostrarNoAfecta();

    final double danio = ataque.potencia * multiplicador;
    
    defensor.vida -= danio;
    if (defensor.vida < 0) defensor.vida = 0;

    view.mostrarDanio(danio);
  }
}