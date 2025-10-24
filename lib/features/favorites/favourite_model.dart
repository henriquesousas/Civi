import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';

class FavouriteModel {
  final String image;
  final String plate;
  final String description;
  final String address;
  final String date;
  final String status;
  final bool isVerified;
  final bool isUrgent;

  FavouriteModel({
    required this.image,
    required this.plate,
    required this.description,
    required this.address,
    required this.date,
    required this.isVerified,
    required this.status,
    required this.isUrgent,
  });

  static List<FavouriteModel> getFavourites = [
    FavouriteModel(
        plate: "DND0171",
        description: "Cg titan 150",
        address: StringConfig.address1,
        date: "Ontem as 19:00",
        image: ImageConfig.fakeMoto1,
        isVerified: false,
        status: "resolvido",
        isUrgent: false),
    FavouriteModel(
        plate: "ABCD123",
        description: "Honda civic cinza",
        address: StringConfig.address2,
        date: "Há um mês",
        image: ImageConfig.fakeCarro1,
        isVerified: true,
        status: "em andamento",
        isUrgent: false),
    FavouriteModel(
        plate: "DXGT8578",
        description: "Golf vermelho",
        address: StringConfig.address3,
        date: "Há um ano",
        image: ImageConfig.fakeCarro2,
        isVerified: true,
        status: "urgente",
        isUrgent: false),
    FavouriteModel(
        plate: "DXGT8578",
        description: "Golf prata",
        address: StringConfig.address3,
        date: "Há um ano",
        image: ImageConfig.fakeCarro4,
        isVerified: true,
        status: "urgente",
        isUrgent: false),
    FavouriteModel(
        plate: "DND0171",
        description: "Cg titan 150",
        address: StringConfig.address1,
        date: "Ontem as 19:00",
        image: ImageConfig.fakeMoto1,
        isVerified: false,
        status: "resolvido",
        isUrgent: false),
    FavouriteModel(
        plate: "ABCD123",
        description: "Gol branco",
        address: StringConfig.address3,
        date: "Há um mês",
        image: ImageConfig.fakeCarro3,
        isVerified: true,
        status: "em andamento",
        isUrgent: false),
  ];

  static List<FavouriteModel> getFavourites2 = [
    FavouriteModel(
        plate: "ABCD123",
        description: "Gol branco",
        address: StringConfig.address3,
        date: "Há um mês",
        image: ImageConfig.fakeCarro3,
        isVerified: true,
        status: "em andamento",
        isUrgent: false),
  ];
}
