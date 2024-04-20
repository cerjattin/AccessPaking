import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Get.toNamed('/homeuser');
            },
          ),
          ListTile(
            title: const Text('Registro Visitantes'),
            onTap: () {
              Get.toNamed('/visitor');
            },
          ),
          ListTile(
            title: const Text('Registro Propietarios'),
            onTap: () {
             Get.toNamed('/register');
            },
          ),
          ListTile(
            title: const Text('Ingreso de Vehiculo'),
            onTap: () {
              Get.toNamed('/pconfi');
            },
          ),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Get.toNamed('/home');
            },
          )
        ],
      ),
    );
  }
}
