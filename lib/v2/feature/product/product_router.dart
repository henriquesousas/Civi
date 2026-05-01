import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/v2/feature/product/presentation/list/list_product_page.dart';
import 'package:deehelp/v2/feature/product/presentation/register/phone/register_phone_page.dart';
import 'package:deehelp/v2/feature/product/presentation/register/vehicle/register_vehicle_page.dart';
import 'package:go_router/go_router.dart';

class ProductRouter {
  static const String addNewPhone = '/add_new_phone';
  static const String addNewVehicle = '/add_new_vehicle';
  static const String listProduct = '/list';
  ProductRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: addNewVehicle,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const RegisterVehiclePage(),
          ),
        ),
        GoRoute(
          path: addNewPhone,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const RegisterPhonePage(),
          ),
        ),
        GoRoute(
          path: listProduct,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ListProductPage(),
          ),
        ),
      ];
}
