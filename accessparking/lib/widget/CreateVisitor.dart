import 'package:accessparking/widget/CustomerDrawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Visitor extends StatefulWidget {
  const Visitor({super.key, required this.textv});
  final String textv;

  @override
  State<Visitor> createState() => _VisitorState();
}

class _VisitorState extends State<Visitor> {
  DateTime _startDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
                65.0), // Define la altura deseada del AppBar
            child: AppBar(
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color:
                      Color(0xffdd45f5), // Cambia el color de fondo del AppBar
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        20.0), // Redondea el borde inferior izquierdo
                    bottomRight: Radius.circular(
                        20.0), // Redondea el borde inferior derecho
                  ),
                ),
              ),
            )),
        drawer: const CustomerDrawer(),
        body: SafeArea(
          child: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                Column(children: <Widget>[
                  //Primer bloque
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffdcdbdb),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(children: <Widget>[
                              SizedBox(
                                width: 230,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Placa Principal',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      enabled: false,
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                              ),
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nombre del responsable',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabled: true,
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                          ])),
                  //Segundo bloque
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffdcdbdb),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(children: <Widget>[
                              SizedBox(
                                width: 230,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Placa Invitado',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      enabled: false,
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                              ),
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Nombre del visitante',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabled: true,
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Documento de identidad',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabled: true,
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Fecha de inicio'),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: 'Fecha de Inicio',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today,
                                        color: Color(0xffdd45f5), size: 20),
                                    onPressed: () => _selectStartDate(context),
                                  )),
                              controller: TextEditingController(
                                text:
                                    DateFormat('yyyy-MM-dd').format(_startDate),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Fecha final'),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: 'Fecha Final',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today,
                                        color: Color(0xffdd45f5), size: 20),
                                    onPressed: () => _selectStartDate(context),
                                  )),
                              controller: TextEditingController(
                                text:
                                    DateFormat('yyyy-MM-dd').format(_startDate),
                              ),
                            ),
                          ])),
                  ElevatedButton(
                    child: const Text('Confirmar ingreso'),
                    onPressed: () {},
                  )
                ]),
              ],
            ),
            //Camara bloaque 1
            Positioned(
                top: 45,
                right: 40,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt_outlined,
                      color: Color(0xffdd45f5), size: 30.0),
                  onPressed: () {
                    // Agrega aquí la lógica para manejar el botón de la cámara
                  },
                )),
            //Camara bloaque 2
            Positioned(
                top: 250,
                right: 40,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt_outlined,
                      color: Color(0xffdd45f5), size: 30.0),
                  onPressed: () {
                    // Agrega aquí la lógica para manejar el botón de la cámara
                  },
                )),
          ]),
        ),
        bottomNavigationBar: SizedBox(
          height: 60.0,
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                    20.0), // Redondea los bordes superiores izquierdos
                topRight: Radius.circular(
                    20.0), // Redondea los bordes superiores derechos
              ),
              child: BottomAppBar(
                color: const Color(0xffdd45f5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.edit,
                              color: Colors.white, size: 30.0),
                          tooltip: 'Editar',
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(Icons.directions_car,
                              color: Colors.white, size: 30.0),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(Icons.credit_card,
                              color: Colors.white, size: 30.0),
                          onPressed: () {}),
                    ]),
              )),
        ),
      ),
    );
  }
}
