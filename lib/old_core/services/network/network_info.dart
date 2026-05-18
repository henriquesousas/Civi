import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deehelp/old_core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkInfo {
  final Connectivity _connectivity;
  const NetworkInfo(this._connectivity);

  Future<bool> get hasConnection async {
    try {
      final results = await _connectivity.checkConnectivity();
      if (results.isEmpty) return false;
      return results.any((result) => result != ConnectivityResult.none);
    } catch (_) {
      return false;
    }
  }

  Stream<bool> get onConnectionChanged {
    return _connectivity.onConnectivityChanged.map((results) {
      if (results.isEmpty) return false;
      return results.any((result) => result != ConnectivityResult.none);
    }).distinct();
  }
}

class NoInternetCard extends StatelessWidget {
  final VoidCallback onRetry;
  final VoidCallback onClose;

  const NoInternetCard({
    super.key,
    required this.onRetry,
    required this.onClose,
  });

  static const bg = Color(0xFFB3261E); // vermelho escuro elegante
  static const border = Color(0xFFB3261E);
  static const innerBorder = Color(0xFF9A2A2A);

  static const ink = Colors.white;
  static const muted = Color(0xFFFFCDD2);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          // borderRadius: BorderRadius.circular(26),
          border: Border.all(color: border, width: 1.2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF8B1E1E),
                    border: Border.all(color: innerBorder),
                  ),
                  child: Icon(
                    Icons.wifi_off_rounded,
                    color: Colors.white,
                    size: 22.w,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Sem conexão com a internet !',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ink,
                      fontSize: context.safeSp(12),
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
