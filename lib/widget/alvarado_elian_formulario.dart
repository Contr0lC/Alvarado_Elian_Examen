import 'package:flutter/material.dart';

class AlvaradoElianFormulario extends StatefulWidget {
  const AlvaradoElianFormulario({super.key});

  @override
  State<AlvaradoElianFormulario> createState() =>
      _AlvaradoElianFormularioState();
}

class _AlvaradoElianFormularioState extends State<AlvaradoElianFormulario> {
  final _alvaradoElianCedulaController = TextEditingController();
  final _alvaradoElianNombresController = TextEditingController();
  final _alvaradoElianApellidosController = TextEditingController();
  final _alvaradoElianFormKey = GlobalKey<FormState>();
  DateTime? _alvaradoElianSelectedDate;
  String? _alvaradoElianSelectedCiudades;
  String? _alvaradoElianSelectedSexo;
  bool _alvaradoElianIsCuentaActiva = false;

  final List<String> _alvaradoElianCiudades = [
    'Guayaquil',
    'Quito',
    'Cuenca',
    'Esmeralda',
    'Quinindé',
  ];

  final List<String> _alvaradoElianSexo = [
    'Masculino',
    'Femenino',
    'No Binario',
  ];

  void _alvaradoElianSelectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _alvaradoElianSelectedDate) {
      setState(() {
        _alvaradoElianSelectedDate = pickedDate;
      });
    }
  }

  void _alvaradoElianSaveForm() {
    if (_alvaradoElianFormKey.currentState!.validate()) {
      print('Cédula: ${_alvaradoElianCedulaController.text}');
      print('Nombres: ${_alvaradoElianNombresController.text}');
      print('Apellidos: ${_alvaradoElianApellidosController.text}');
      print(
          'Fecha de Nacimiento: ${_alvaradoElianSelectedDate != null ? _alvaradoElianSelectedDate!.toLocal().toString().split(' ')[0] : 'No seleccionada'}');
      print('Ciudad: $_alvaradoElianSelectedCiudades');
      print('Sexo: $_alvaradoElianSelectedSexo');
      print('Cuenta Activa: $_alvaradoElianIsCuentaActiva');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registro de Datos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(228, 211, 84, 11),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Form(
                key: _alvaradoElianFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _alvaradoElianCedulaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Cédula',
                        border: _outlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu cédula';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _alvaradoElianNombresController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Nombres',
                        border: _outlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tus nombres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _alvaradoElianApellidosController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Apellidos',
                        border: _outlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tus apellidos';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 230,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 14),
                                child: Text(
                                  "Fecha Nacimiento",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple.shade400,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 125,
                          child: IconButton(
                            onPressed: () => _alvaradoElianSelectDate(context),
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _alvaradoElianSelectedCiudades,
                      hint: const Text('Ciudad'),
                      decoration: InputDecoration(
                        border: _outlineInputBorder(),
                      ),
                      items: _alvaradoElianCiudades.map((String ciudad) {
                        return DropdownMenuItem<String>(
                          value: ciudad,
                          child: Text(ciudad),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _alvaradoElianSelectedCiudades = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecciona una ciudad';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _alvaradoElianSelectedSexo,
                      hint: const Text('Sexo'),
                      decoration: InputDecoration(
                        border: _outlineInputBorder(),
                      ),
                      items: _alvaradoElianSexo.map((String sexo) {
                        return DropdownMenuItem<String>(
                          value: sexo,
                          child: Text(sexo),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _alvaradoElianSelectedSexo = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecciona un sexo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              const Text(
                                "Activar Cuenta",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _alvaradoElianIsCuentaActiva,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        _alvaradoElianIsCuentaActiva = true;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Sí",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: !_alvaradoElianIsCuentaActiva,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        _alvaradoElianIsCuentaActiva = false;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "No",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: _alvaradoElianSaveForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                fontSize: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Guardar',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
    );
  }
}
