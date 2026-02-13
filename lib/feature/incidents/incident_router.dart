import 'package:deehelp/feature/incidents/list/incident_list_page.dart';
import 'package:go_router/go_router.dart';

class IncidentRouter {
  static const String list = '/list-incident';
  static const String register = '/register-incident';
  static const String detail = '/detail-incident';
  static const String success = '/success-incident';
  IncidentRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: list,
          builder: (_, __) => const IncidentListPage(),
        ),
        // GoRoute(
        //   path: register,
        //   builder: (_, __) => const ItemRegisterPageView(),
        // ),
        // GoRoute(
        //   path: detail,
        //   builder: (_, __) => const ItemDetailPage(),
        // ),
        // GoRoute(
        //   path: success,
        //   builder: (_, __) => const ItemRegisterSuccessPage(),
        // ),
      ];
}
