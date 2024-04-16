import 'package:flutter/material.dart';
import 'CreateVisitor.dart';
import 'HomeUser.dart';
import 'Pconfi.dart';
import 'Register.dart';
import 'Session.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  Widget build(BuildContext context) {
    return Drawer(
      //Menu
      child: ListView(
        children: [
          Title(color: Colors.black, child: Text('menu')),
          ListTile(
            title: const Text('Dashdoard Propietario'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeUser()));
            },
          ),
          ListTile(
            title: const Text('Registro Visitantes'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Visitor(
                        textv: '',
                      )));
            },
          ),
          ListTile(
            title: const Text('Registro Propietarios'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Register(
                        textv: '',
                      )));
            },
          ),
          ListTile(
            title: const Text('Ingreso de Vehiculo'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Pconfi(
                        text: '',
                      )));
            },
          ),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Session()));
            },
          )
        ],
      ),
    );
  }
}
