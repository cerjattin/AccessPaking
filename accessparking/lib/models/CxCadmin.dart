import 'User.dart';

class CxCadmin {
  CxCadmin(
      {required this.anoAdm,
      required this.mesAdm,
      required this.pagoAdm,
      required this.fechaPago,
      required this.user});

  final String anoAdm;
  final String mesAdm;
  final String pagoAdm;
  final String fechaPago;
  final List<User> user;
}
