import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../vista/combate_view.dart';
import '../controlador/combate_controller.dart';
import '../modelo/pokemon.dart';
import '../modelo/ataques.dart';

class BatallaPage extends StatefulWidget {
  final Pokemon jugador;
  final Pokemon rival;

  const BatallaPage({super.key, required this.jugador, required this.rival});

  @override
  State<BatallaPage> createState() => _BatallaPageState();
}

class _BatallaPageState extends State<BatallaPage> {
  late FlutterCombateView flutterView;
  late CombateController controller;
  final ScrollController _scrollController = ScrollController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  bool mostrandoAtaques = false;

  @override
  void initState() {
    super.initState();
    flutterView = FlutterCombateView();
    controller = CombateController(flutterView);

    _reproducirMusica();

    controller.view.mostrarInformacionPokemon(widget.jugador);
    controller.view.mostrarInformacionPokemon(widget.rival);

    flutterView.addListener(() {
      setState(() {
         WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
      });
    });
  }

  void _reproducirMusica() async {
    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.play(AssetSource('musica.mp3')); 
    } catch (e) {
      print("Error al cargar música: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  IconData _getIconoTipo(String tipo) {
    switch (tipo) {
      case 'Fuego': return Icons.local_fire_department;
      case 'Agua': return Icons.water_drop;
      case 'Planta': case 'Hierba': return Icons.grass;
      case 'Electrico': return Icons.flash_on;
      case 'Hielo': return Icons.ac_unit;
      case 'Lucha': return Icons.fitness_center;
      case 'Veneno': return Icons.science;
      case 'Volador': return Icons.air;
      case 'Psiquico': return Icons.psychology;
      case 'Bicho': return Icons.pest_control;
      case 'Roca': case 'Tierra': return Icons.landscape;
      case 'Fantasma': case 'Siniestro': return Icons.nightlight_round;
      case 'Dragon': return Icons.token; 
      case 'Acero': return Icons.settings;
      default: return Icons.circle;
    }
  }

  void ejecutarTurno(Ataque ataque) {
    controller.iniciarTurnoFlutter(widget.jugador, widget.rival, ataque);
    setState(() {
      mostrandoAtaques = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const Text("BATALLA POKÉMON", style: TextStyle(fontFamily: "Courier", fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(color: Colors.black, height: 4.0,),
        ),
      ),
      body: Column(
        children: [
          _buildPokemonInfo(widget.rival, isRival: true),

          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Text(
                  flutterView.log,
                  style: const TextStyle(
                    fontFamily: "Courier",
                    fontSize: 16, 
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),

          _buildPokemonInfo(widget.jugador, isRival: false),
          
          const SizedBox(height: 10),

          Container(
            height: 180,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 4))
            ),
            padding: const EdgeInsets.all(10),
            child: mostrandoAtaques 
              ? _buildListaAtaques() 
              : _buildBotonesPrincipales(),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonInfo(Pokemon p, {required bool isRival}) {
    Color colorHP = p.vida < 500 ? Colors.red : Colors.green.shade700;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: isRival ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isRival) _imagenPokemon(p),
          
          const SizedBox(width: 5),
          
          Expanded(
            child: Column(
              crossAxisAlignment: isRival ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(p.nombre.toUpperCase(), style: const TextStyle(fontSize: 20, fontFamily: "Courier", fontWeight: FontWeight.bold)),
                Text("Nv: ${p.nivel}", style: const TextStyle(fontFamily: "Courier", fontWeight: FontWeight.bold, fontSize: 16)),
                
                const SizedBox(height: 5),
                
                Text(
                  "HP: ${p.vida.toInt()}", 
                  style: TextStyle(
                    fontFamily: "Courier", 
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: colorHP
                  )
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          if (isRival) _imagenPokemon(p),
        ],
      ),
    );
  }

  Widget _imagenPokemon(Pokemon p) {
    return Container(
      height: 500, 
      width: 500,
      child: p.vida > 0 
          ? Image.network(p.imagen, fit: BoxFit.contain)
          : const Opacity(opacity: 0.3, child: Icon(Icons.close, size: 80, color: Colors.black)),
    );
  }

  Widget _retroButton(String texto, VoidCallback onPressed, {Color? colorFondo}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorFondo ?? Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.black, width: 3)
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
      ),
      onPressed: onPressed,
      child: Text(
        texto, 
        style: const TextStyle(fontFamily: "Courier", fontSize: 20, fontWeight: FontWeight.bold)
      ),
    );
  }

  Widget _buildBotonesPrincipales() {
    if (widget.jugador.vida <= 0 || widget.rival.vida <= 0) {
      return Center(
        child: _retroButton("SALIR >", () => Navigator.pop(context), colorFondo: Colors.grey.shade300),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _retroButton("LUCHA", () => setState(() => mostrandoAtaques = true)),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _retroButton("HUIR", () => Navigator.pop(context)),
        ),
      ],
    );
  }

  Widget _buildListaAtaques() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: widget.jugador.ataques.length,
            separatorBuilder: (_,__) => const Divider(color: Colors.black, height: 1),
            itemBuilder: (context, i) {
              final a = widget.jugador.ataques[i];
              return InkWell(
                onTap: () => ejecutarTurno(a),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_right, color: Colors.black),
                      Text(
                        a.nombre.toUpperCase(), 
                        style: const TextStyle(fontFamily: "Courier", fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      const Spacer(),
                      Text("P:${a.potencia}", style: const TextStyle(fontFamily: "Courier")),
                      const SizedBox(width: 5),
                      Icon(_getIconoTipo(a.tipo), size: 16, color: Colors.black54),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: _retroButton("ATRÁS", () => setState(() => mostrandoAtaques = false)),
          ),
        )
      ],
    );
  }
}