import 'package:flutter/material.dart';
import '../modelo/pokemon.dart';
import '../modelo/ataques.dart';

abstract class CombateView {
  void mostrarInformacionPokemon(Pokemon p);
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque ataque);
  void mostrarSuperEfectivo();
  void mostrarPocoEfectivo();
  void mostrarNoAfecta();
  void mostrarDanio(double danio);
  void mostrarDesmayo(Pokemon p);
  void mostrarSiguienteTurno();
  void mostrarGanador(Pokemon ganador, Pokemon perdedor);
}

class FlutterCombateView extends ChangeNotifier implements CombateView {

  String log = "";

  void _append(String text) {
    log += "$text\n";
    notifyListeners();
  }

  @override
  void mostrarInformacionPokemon(Pokemon p) {
    _append("--> ${p.nombre} (Nivel ${p.nivel}) | HP: ${p.vida.toInt()} | Velocidad: ${p.velocidad.toInt}");
  }

  @override
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque ataque) {
    _append("${atacante.nombre} ataca a ${defensor.nombre} con ${ataque.nombre}!");
  }

  @override
  void mostrarSuperEfectivo() {
    _append("¡Es súper efectivo!");
  }

  @override
  void mostrarPocoEfectivo() {
    _append("No es muy efectivo...");
  }

  @override
  void mostrarNoAfecta() {
    _append("¡No le afecta!");
  }

  @override
  void mostrarDanio(double danio) {
    _append("Daño causado: $danio");
  }

  @override
  void mostrarDesmayo(Pokemon p) {
    _append("¡${p.nombre} se ha desmayado!");
  }

  @override
  void mostrarSiguienteTurno() {
    _append("---- Siguiente turno ----");
  }

  @override
  void mostrarGanador(Pokemon ganador, Pokemon perdedor) {
    _append("¡${perdedor.nombre} ha sido derrotado!, ¡${ganador.nombre} gana el combate!");
  }
}