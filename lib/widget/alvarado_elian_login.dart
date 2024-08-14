import 'package:alvarado_elian_examen/widget/alvarado_elian_home.dart';
import 'package:flutter/material.dart';

class AlvaradoElianLogin extends StatefulWidget {
  const AlvaradoElianLogin({super.key});

  @override
  State<AlvaradoElianLogin> createState() => _AlvaradoElianLoginState();
}

class _AlvaradoElianLoginState extends State<AlvaradoElianLogin> {
  final _alvaradoElianCorreoController = TextEditingController();
  final _alvaradoElianClaveController = TextEditingController();
  final _alvaradoElianFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Alvarado Segovia Elian Hazael",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/alvarado_elian_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _alvaradoElianFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _alvaradoElianCorreoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Correo Electrónico',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _alvaradoElianClaveController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Clave',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _alvaradoElianLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                fontSize: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: const Text(
                              'Conectar',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lección del segundo parcial: Flutter"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _alvaradoElianLogin() {
    if (_alvaradoElianFormKey.currentState!.validate()) {
      final correo = _alvaradoElianCorreoController.text;
      final clave = _alvaradoElianClaveController.text;

      if (correo == 'admin@ug.edu.ec' && clave == '123') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AlvaradoElianHome(),
          ),
        );
        _alvaradoElianCorreoController.clear();
        _alvaradoElianClaveController.clear();
      } else {
        _alvaradoElianMostrarMensaje('Error', 'Correo o clave incorrectos');
      }
    }
  }

  void _alvaradoElianMostrarMensaje(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _alvaradoElianCorreoController.dispose();
    _alvaradoElianClaveController.dispose();
    super.dispose();
  }
}
