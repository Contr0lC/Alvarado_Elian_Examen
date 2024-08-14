import 'package:alvarado_elian_examen/widget/alvarado_elian_formulario.dart';
import 'package:flutter/material.dart';

class AlvaradoElianHome extends StatefulWidget {
  const AlvaradoElianHome({super.key});

  @override
  State<AlvaradoElianHome> createState() => _AlvaradoElianHomeState();
}

class _AlvaradoElianHomeState extends State<AlvaradoElianHome> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
          if (index == 1) {
            Navigator.pop(context);
          }
        },
        indicatorColor: const Color(0xFFF4B898),
        backgroundColor: const Color(0xFFF4B898),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            label: "Nuevo Cliente",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.keyboard_return_sharp,
              size: 35,
            ),
            label: "Regresar",
          )
        ],
      ),
      body: [
        const AlvaradoElianFormulario(),
        Container(),
      ][currentPageIndex],
    );
  }
}
