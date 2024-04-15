import 'package:accessparking/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Provider/Usuario_Provider.dart';
import '../models/Usuario.dart';
import '/Localstorage/Sharepreference.dart';
import 'HomeUser.dart';

class Session extends StatefulWidget {
  const Session({super.key});
  static const String nombre = 'inicio_S';

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo_p.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(32),
            width: responsive.width * 0.85,
            height: responsive.height * 0.9,
            decoration: BoxDecoration(
              color: const Color(0x95313131),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SafeArea(
                child: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        //logo
                        padding: EdgeInsets.all(5.0),
                        /*child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/logo.png',
                          ),
                          radius: 110.0,
                        ),*/
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        height: responsive.height * 0.2,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo.png'))),
                      ),
                      SizedBox(height: responsive.height * 0.2),
                      Container(
                        //correo
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        height: 50,
                        color: Colors.transparent,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: 'Correo electrónico',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Container(
                        //contraseña
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        height: 50,
                        color: Colors.transparent,
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Container(
                        //Check box
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: CheckboxListTile(
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (!states.contains(MaterialState.selected)) {
                              return Colors.white;
                            }
                            return null;
                          }),
                          title: const Text('Acepto terminos y condiciones',
                              style: TextStyle(color: Colors.white)),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _acceptTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              _acceptTerms = value ?? false;
                            });
                          },
                        ),
                      ),
                      Container(
                        //boton de inico
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_acceptTerms == true) {
                              _login(context);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: const Text('Confirmar ingreso',
                              style: TextStyle(color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    String user = _emailController.text;
    String password = _passwordController.text;
    bool isloged = false;

    try {
      List<Usuario> usuarios = await UsuarioProvider().getUser();
      if (kDebugMode) {
        print("Usuarios obtenidos: $usuarios");
      }
      for (Usuario u in usuarios) {
        print(u.mail);
        print(user);
        print(u.pass);
        print(password);
        if (u.mail == user && u.pass == password) {
          _saveUserData(u);
          isloged = true;
          break;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error al obtener usuarios: $e");
      }
    }

    if (isloged) {
      final prefs = PrefernciaUsuario();
      await prefs.initPrefs();

      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeUser()));
    } else {
      // Lógica para manejar inicio de sesión fallido
      // Puedes mostrar un mensaje de error, por ejemplo.
      if (kDebugMode) {
        print("Inicio de sesión fallido");
      }
    }
  }

  void _saveUserData(Usuario user) async {
    final prefs = PrefernciaUsuario();
    await prefs.initPrefs();

    prefs.username = user.nameuser ?? '';
    // Otros campos que quieras almacenar en las preferencias
  }
}
