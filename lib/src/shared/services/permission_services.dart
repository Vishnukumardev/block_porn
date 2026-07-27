import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:disable_battery_optimization/disable_battery_optimization.dart';

abstract class IPermissionService {
  Future<bool> isAccessibilityGranted();
  Future<void> requestAccessibilityPermission();

  Future<bool> isOverlayGranted();
  Future<void> requestOverlayPermission();

  Future<bool> isBatteryOptimizationDisabled();
  Future<void> requestDisableBatteryOptimization();
}

class PermissionService implements IPermissionService {
  @override
  Future<bool> isAccessibilityGranted() async {
    return await FlutterAccessibilityService.isAccessibilityPermissionEnabled();
  }

  @override
  Future<void> requestAccessibilityPermission() async {
    await FlutterAccessibilityService.requestAccessibilityPermission();
  }

  @override
  Future<bool> isOverlayGranted() async {
    return await FlutterOverlayWindow.isPermissionGranted();
  }

  @override
  Future<void> requestOverlayPermission() async {
    await FlutterOverlayWindow.requestPermission();
  }

  @override
  Future<bool> isBatteryOptimizationDisabled() async {
    bool? isDisabled =
        await DisableBatteryOptimization.isBatteryOptimizationDisabled;
    return isDisabled ?? false;
  }

  @override
  Future<void> requestDisableBatteryOptimization() async {
    await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
  }
}
