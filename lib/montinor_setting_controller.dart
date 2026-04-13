import 'package:deehelp/foreground_monitor.dart';

class MonitorSettingsController {
  Future<void> setMonitoring(bool enabled) async {
    await ForegroundMonitor.stop();
    if (enabled) {
      await ForegroundMonitor.start();
    } else {
      await ForegroundMonitor.stop();
    }
  }
}
