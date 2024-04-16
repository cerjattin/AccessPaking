import 'package:accessparking/Provider/Placas_Provide.dart';
import 'package:accessparking/models/AutoP_Model.dart';
import 'package:accessparking/models/Placas_Model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'CustomerDrawer.dart';

const List<String> list = <String>[
  'Seleccione la torre',
  'TORRE 1',
  'TORRE 2',
  'TORRE 3'
];
String dropdownValue = list.first;

class Register extends StatefulWidget {
  const Register({super.key, required this.textv});
  final String textv;

  static const String nombre = 'Regi';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with WidgetsBindingObserver {
  bool estado = false;
  bool _isGranted = false;
  final PlacasProvider placasProvider = PlacasProvider();
  final TextEditingController _placa = TextEditingController();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _name = TextEditingController();
  late final Future<void> _future;
  CameraController? _cameraController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _future = _requestCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopCamera();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        _cameraController != null &&
        _cameraController!.value.isInitialized) {
      startCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                color: Color(0xffdd45f5), // Cambia el color de fondo del AppBar
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
                Column(children: <Widget>[
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
                                    labelText: 'Placa',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Celular',
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
                                labelText: 'Mail',
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
                          SizedBox(
                            width: 370,
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Apartamento',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabled: true,
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ]),
                  ),
                  ElevatedButton(
                    child: const Text('Confirmar ingreso'),
                    onPressed: () {},
                  )
                ]),
                Positioned(
                    top: 45,
                    right: 40,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: Color(0xffdd45f5), size: 30.0),
                      onPressed: () {
                        String placa = _placa.text;
                        String idPropietario = _id.text;
                        String nombreResponsable = _name.text;
                        PlacasModel placasModel = PlacasModel(
                          saldo: '0',
                          estado: '0',
                          id: placa,
                          idpropietario: idPropietario,
                          namePropietario: nombreResponsable,
                          placaAutor: AutopModel(
                            document: '',
                            idautorizado: '',
                            nameAutorizado: '',
                          ),
                        );

                        placasProvider.crearplaca(placasModel).then((success) {
                          if (success) {
                            return 'FUNCIONO';
                            // Operación exitosa
                            // Mostrar un mensaje o realizar alguna acción adicional
                          } else {
                            return 'FALLO';
                            // Operación fallida
                            // Mostrar un mensaje de error o realizar alguna acción adicional
                          }
                        });
                        // Agrega aquí la lógica para manejar el botón de la cámara
                      },
                    )),
              ],
            ),
          ),
        ),
      )),
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
    );
  }

  Future<void> _requestCamera() async {
    final status = await Permission.camera.request();
    //_isPermissionGranted = status == PermissionStatus.granted;
    _isGranted = status == PermissionStatus.granted;
  }

  void startCamera() {
    if (_cameraController != null) {
      _selectedCamera(_cameraController!.description);
    }
  }

  void stopCamera() {
    if (_cameraController != null) {
      _cameraController!.dispose();
    }
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) {
      return;
    }
    CameraDescription? camera;

    for (var i = 0; 1 < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }
    if (camera != null) {
      _selectedCamera(camera);
    } else {
      if (kDebugMode) {
        print("No back camera available.");
      }
    }
  }

  Future<void> _selectedCamera(CameraDescription camera) async {
    _cameraController =
        CameraController(camera, ResolutionPreset.max, enableAudio: false);
    await _cameraController!.initialize();
    if (!mounted) {
      return;
    }
  }
}
