import 'package:flutter/material.dart';
import '../modelo/pokemon.dart';
import 'batalla_page.dart';

class SeleccionPage extends StatefulWidget {
  const SeleccionPage({super.key});

  @override
  State<SeleccionPage> createState() => _SeleccionPageState();
}

class _SeleccionPageState extends State<SeleccionPage> {
  Pokemon? jugadorSeleccionado;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jugadorSeleccionado == null 
            ? "Elige tu Pokémon" 
            : "Elige tu Rival"),
        backgroundColor: Colors.redAccent,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: listaPokemones.length,
        itemBuilder: (context, index) {
          final p = listaPokemones[index];
          return GestureDetector(
            onTap: () {
              if (jugadorSeleccionado == null) {
                setState(() {
                  jugadorSeleccionado = p; 
                });
              } else {
                
                final Pokemon jugadorFinal = jugadorSeleccionado!;
                final Pokemon rivalFinal = p;

                setState(() {
                  jugadorSeleccionado = null;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BatallaPage(
                      jugador: jugadorFinal,
                      rival: rivalFinal,
                    ),
                  ),
                );
              }
            },
            child: Card(
              elevation: 4,
              color: jugadorSeleccionado == p ? Colors.green.shade100 : Colors.white,
              child: Column(
                children: [
                  Expanded(child: Image.network(p.imagen, fit: BoxFit.contain)),
                  Text(p.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(p.tipo, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}