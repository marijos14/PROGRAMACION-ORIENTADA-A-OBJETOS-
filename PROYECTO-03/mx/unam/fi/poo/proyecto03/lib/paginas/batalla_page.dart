import 'package:flutter/material.dart';
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
  
  bool mostrandoAtaques = false;

  @override
  void initState() {
    super.initState();
    flutterView = FlutterCombateView();
    controller = CombateController(flutterView);

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
      appBar: AppBar(title: const Text("Batalla"), backgroundColor: Colors.redAccent),
      body: Column(
        children: [
          _buildPokemonInfo(widget.rival, isRival: true),

          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.symmetric(horizontal: BorderSide(color: Colors.grey, width: 2))
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Text(
                  flutterView.log,
                  style: const TextStyle(fontFamily: "Courier", fontSize: 14, color: Colors.greenAccent),
                ),
              ),
            ),
          ),

          _buildPokemonInfo(widget.jugador, isRival: false),
          
          const SizedBox(height: 10),

          SizedBox(
            height: 150,
            child: mostrandoAtaques 
              ? _buildListaAtaques() 
              : _buildBotonesPrincipales(),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonInfo(Pokemon p, {required bool isRival}) {    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: isRival ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isRival) _imagenPokemon(p),
          
          const SizedBox(width: 15),
          
          Column(
            crossAxisAlignment: isRival ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(p.nombre, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Nv. ${p.nivel}  |  ${p.tipo}", style: TextStyle(color: Colors.grey[700])),
              const SizedBox(height: 5),
              Text("HP: ${p.vida.toInt()}", 
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: p.vida < 300 ? Colors.red : Colors.green[700]
                )
              ),
            ],
          ),

          const SizedBox(width: 15),

          if (isRival) _imagenPokemon(p),
        ],
      ),
    );
  }

  Widget _imagenPokemon(Pokemon p) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey.shade300)
      ),
      child: p.vida > 0 
          ? Image.network(p.imagen, fit: BoxFit.contain)
          : const Icon(Icons.close, size: 50, color: Colors.grey),
    );
  }

  Widget _buildBotonesPrincipales() {
    if (widget.jugador.vida <= 0 || widget.rival.vida <= 0) {
      return Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
          icon: const Icon(Icons.exit_to_app),
          label: const Text("SALIR"),
          onPressed: () => Navigator.pop(context),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            fixedSize: const Size(140, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () => setState(() => mostrandoAtaques = true),
          child: const Text("ATACAR", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            fixedSize: const Size(140, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () {
             Navigator.pop(context);
          },
          child: const Text("HUIR", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildListaAtaques() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          height: 30,
          child: Center(
             child: InkWell(
               onTap: () => setState(() => mostrandoAtaques = false),
               child: const Text("CANCELAR", style: TextStyle(fontWeight: FontWeight.bold)),
             )
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: widget.jugador.ataques.length,
            separatorBuilder: (_,__) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final a = widget.jugador.ataques[i];
              return ListTile(
                tileColor: Colors.grey.shade50,
                leading: Icon(_getIconoTipo(a.tipo), color: Colors.black54),
                title: Text(a.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Pot: ${a.potencia} | ${a.tipo}"),
                onTap: () => ejecutarTurno(a),
              );
            },
          ),
        ),
      ],
    );
  }
}