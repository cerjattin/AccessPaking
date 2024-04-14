// ignore: file_names
import '../models/Autoriza.dart';
import '/models/CxCadmin.dart';
import '/models/Guest.dart';
import '/models/User.dart';

final List<CxCadmin> cxcadmin = [
  CxCadmin(anoAdm: '2023', mesAdm: '1', pagoAdm: '', fechaPago: '', user: [
    User(
        name: 'Luis Hernandez',
        phone: '3023435677',
        email: 'luhe@gmail.com',
        id: '1003207386',
        torre: 'A',
        apto: '101',
        admMes: '0',
        password: '1234abcd',
        status: true,
        type: 'residente')
  ]),
  CxCadmin(anoAdm: '2023', mesAdm: '1', pagoAdm: '', fechaPago: '', user: [
    User(
        name: 'Jose Ruiz',
        phone: '3023435677',
        email: 'joru@gmail.com',
        id: '1003451743',
        torre: 'F',
        apto: '705',
        admMes: '7000',
        password: 'abcd1234',
        status: false,
        type: 'residente')
  ]),
  CxCadmin(anoAdm: '', mesAdm: '', pagoAdm: '', fechaPago: '', user: [
    User(
        name: 'Jeider Rodriguez',
        phone: '3056789123',
        email: 'jero@administrador.com',
        id: '1342267564',
        torre: '',
        apto: '',
        admMes: '',
        password: 'admin',
        status: true,
        type: 'administrador')
  ]),
];

final List<Autoriza> autoriza = [
  Autoriza(
      fechaAuto: '',
      placa: 'IEO617',
      guest: [Guest(idV: '1002538754', nameV: 'Maria Domineguez')]),
  Autoriza(
      fechaAuto: '',
      placa: 'IEO617',
      guest: [Guest(idV: '1002538755', nameV: 'Alvaro Robles')]),
  Autoriza(
      fechaAuto: '',
      placa: 'IEO617',
      guest: [Guest(idV: '1002538756', nameV: 'Alberto Jurado')]),
  Autoriza(
      fechaAuto: '',
      placa: 'ABC123',
      guest: [Guest(idV: '1034564292', nameV: 'Josefa Alvarez')]),
  Autoriza(
      fechaAuto: '',
      placa: 'ABC123',
      guest: [Guest(idV: '1034564291', nameV: 'Polo Polo')]),
  Autoriza(
      fechaAuto: '',
      placa: 'ABC123',
      guest: [Guest(idV: '1034564293', nameV: 'Jose Valencia')]),
];
