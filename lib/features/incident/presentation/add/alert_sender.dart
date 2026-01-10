// // MÉTODO PARA SIMULAR ENVIO E MOSTRAR SUCESSO
// import 'package:deehelp/features/incident/presentation/add/widget/success/add_incident_success_page.dart';
// import 'package:deehelp/features/incident/presentation/add/sending_alert_screen.dart';
// import 'package:flutter/material.dart';

// class AlertSender {
//   static Future<void> sendAlertAndShowSuccess({
//     required BuildContext context,
//     required String vehicleType,
//     required String location,
//     required Function() onSendComplete,
//   }) async {
//     // Mostra tela de envio
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => SendingAlertScreen(
//           vehicleType: vehicleType,
//           location: location,
//         ),
//       ),
//     );

//     try {
//       // Simula processo de envio
//       await _simulateSendingProcess();

//       // Fecha tela de envio e mostra sucesso
//       Navigator.pop(context); // Remove a tela de envio

//       // Mostra tela de sucesso
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => AddIncidentSuccessPage(
//             vehicleType: vehicleType,
//             location: location,
//             incidentTime: DateTime.now(),
//           ),
//         ),
//       );

//       // Chama callback se necessário
//       onSendComplete();
//     } catch (error) {
//       // Em caso de erro, mostra tela de erro
//       Navigator.pop(context); // Remove a tela de envio
//       //_showErrorScreen(context);
//     }
//   }

//   static Future<void> _simulateSendingProcess() async {
//     // Simula etapas do envio
//     await Future.delayed(const Duration(seconds: 1)); // Processando dados
//     await Future.delayed(const Duration(seconds: 2)); // Enviando ao servidor
//     await Future.delayed(const Duration(seconds: 1)); // Notificando usuários
//   }

//   static void _showErrorScreen(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: const Color(0xFF0D47A1),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         title: const Text(
//           'Erro no Envio',
//           style: TextStyle(color: Colors.white),
//         ),
//         content: Text(
//           'Não foi possível enviar o alerta. Tente novamente.',
//           style: TextStyle(color: Colors.white.withOpacity(0.9)),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text(
//               'TENTAR NOVAMENTE',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
