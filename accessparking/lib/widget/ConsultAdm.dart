import 'package:accessparking/widget/CustomerDrawer.dart';
import 'package:accessparking/widget/registration.dart';
import 'package:flutter/material.dart';

class ConsultAdm extends StatelessWidget {
  const ConsultAdm({super.key, required this.textv});
  final String textv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green, //color
          title: const Text(''),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const Icon(Icons.account_circle, color: Colors.white),
            ),
          ],
        ),
        drawer: const CustomerDrawer(),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 180),
                child: Text('Escanea Placa de Vehiculo'),
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x95313131),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const registration()));
                    },
                    icon: const Icon(
                      Icons.camera,
                      size: 100.0,
                    ))),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Datos Visitante', style: TextStyle(fontSize: 15)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text('No Placa Autorizada', style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              height: 50,
              width: 350,
              alignment: Alignment.center,
              child: Material(
                elevation: 8.0,
                shadowColor: const Color.fromARGB(255, 174, 176, 177),
                child: TextField(
                  enabled: false,
                  controller: TextEditingController(text: textv),
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: false,
                      labelText: '',
                      contentPadding: EdgeInsets.only(left: 20.0)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              //primera division
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: const Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              //Check box
              margin: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: CheckboxListTile(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (!states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                title: const Text('Acepto terminos y condiciones',
                    style: TextStyle(color: Colors.grey)),
                controlAffinity: ListTileControlAffinity.leading,
                value: false,
                onChanged: (bool? value) {},
              ),
            ),
            Container(
              //boton de inico
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: const Text('Registrar',
                    style: TextStyle(color: Colors.black)),
              ),
            )
          ],
        )));
  }
}
