// ignore_for_file: file_names
import 'package:accessparking/utils/responsive.dart';
import 'package:accessparking/widget/HomeUser.dart';
import 'package:flutter/material.dart';
import 'CustomerDrawer.dart';
import '/models/Autoriza.dart';

class Pconfi extends StatefulWidget {
  const Pconfi({super.key, required this.text});
  final String text;
  static const String nombre = 'Pconfi';

  @override
  State<Pconfi> createState() => _PconfiState();
}

class _PconfiState extends State<Pconfi> {
  final TextEditingController _placaController = TextEditingController();
  List<Autoriza> autorizaList = [];

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
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
                color: Colors.green,
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
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffdcdbdb),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 230,
                                child: TextField(
                                  controller: _placaController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: '',
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Nombre del responsable',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabled: false,
                                filled: true,
                                fillColor: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Saldo pendiente',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabled: false,
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffdcdbdb),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: 350,
                            child: ListView.builder(
                                itemCount: autorizaList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                      color: Colors.green,
                                      child: ListTile(
                                        title: Text(
                                            'ID: ${autorizaList[index].guest[0].idV}'),
                                        subtitle: Text(
                                            'Nombre: ${autorizaList[index].guest[0].nameV}'),
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Confirmar ingreso'),
                      onPressed: () {},
                    )
                  ],
                ),
                Positioned(
                    top: 45,
                    right: 40,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: Colors.green, size: 30.0),
                      onPressed: () {
                        // Agrega aquí la lógica para manejar el botón de la cámara
                      },
                    )),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: SizedBox(
        height: responsive.height * 0.09,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                  20.0), // Redondea los bordes superiores izquierdos
              topRight: Radius.circular(
                  20.0), // Redondea los bordes superiores derechos
            ),
            child: BottomAppBar(
              color: Colors.green,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.home,
                            color: Colors.white, size: 30.0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeUser()));
                        }),
                    IconButton(
                        icon: const Icon(Icons.edit,
                            color: Colors.white, size: 30.0),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.credit_card,
                            color: Colors.white, size: 30.0),
                        onPressed: () {}),
                  ]),
            )),
      ),
    );
  }
}
