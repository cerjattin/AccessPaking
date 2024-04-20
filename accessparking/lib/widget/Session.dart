import 'package:accessparking/Provider/User_Provider.dart';
import 'package:accessparking/models/User_Model.dart';
import 'package:accessparking/utils/responsive.dart';
import 'package:accessparking/widget/ConsultAdm.dart';
import 'package:flutter/material.dart';
import 'HomeUser.dart';
import 'package:get/get.dart';

class Session extends StatefulWidget {
  const Session({super.key});
  static const String nombre = 'inicio_S';

  @override
  State<Session> createState() => _SessionState();
}

class AuthService {
  final UserProvider _userProvider = UserProvider();

  Future<String?> iniciarSesion(String email, String password) async {
    try {
      final List<UserModel> users = await _userProvider.getuser();
      for (var user in users) {
        if (user.mail == email && user.pass == password) {
          // Aquí podrías determinar el tipo de usuario
          return "residente"; // Simula que todos son residentes, ajusta según tus necesidades
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class MiControlador extends GetxController {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late bool _acceptTerms = false;

  
}
class _SessionState extends State<Session> {

  

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final controlador = Get.put(MiControlador());
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
                          controller: controlador._emailController,
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
                          controller: controlador._passwordController,
                          decoration: InputDecoration(
                              labelText: 'Contraseña',
                              hintText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          obscureText: true,
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
                          value: controlador._acceptTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              controlador._acceptTerms = value ?? false;
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
                            if (controlador._acceptTerms == true) {
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
    final controlador = Get.put(MiControlador());
    String email = controlador._emailController.text;
    String password = controlador._passwordController.text;

    String? userType = await AuthService().iniciarSesion(email, password);

    if (userType != null) {
      // Aquí decides a qué página navegar basado en el tipo de usuario
      if (userType == 'residente') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeUser()));
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ConsultAdm(textv: '')),
        );
      }
    } else {
      // Mostrar algún mensaje de error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error de Inicio de Sesión'),
            content: const Text('Correo electrónico o contraseña incorrectos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
