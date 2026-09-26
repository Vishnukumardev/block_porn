import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/services/permission_services.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(PermissionInitial()) {
    on<CheckPermissionEvent>(_isPermissionEnabled);
    on<RequestOverlayPermissionEvent>(_onEnableOverlayPermission);
    on<RequestBatteryPermissionEvent>(_onEnableBatteryOptimizationPermission);
    on<RequestAccessibilityPermissionEvent>(_onEnableAccessibilityPermission);
  }

  Future<bool> _isPermissionEnabled(
    CheckPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(PermissionLoading());
    bool isOverlayEnabled = await PermissionService().isOverlayGranted();
    bool isBatteryOptimizationEnabled = await PermissionService()
        .isBatteryOptimizationGranted();
    bool isAccessibilityEnabled = await PermissionService()
        .isAccessibilityGranted();
    final permissionStatus =
        isOverlayEnabled &&
        isBatteryOptimizationEnabled &&
        isAccessibilityEnabled;
    if (permissionStatus) {
      emit(PermissionEnabled());
    } else {
      emit(PermissionDenied('Need Permissions'));
    }
    return permissionStatus;
  }

  Future<void> _onEnableOverlayPermission(
    RequestOverlayPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(OverlayPermissionInitial());

      bool hasOverlay = await PermissionService().isOverlayGranted();
      if (!hasOverlay) {
        emit(OverlayPermissionLoading());
        await PermissionService().requestOverlayPermission();
        hasOverlay = await PermissionService().isOverlayGranted();
      }

      emit(OverlayPermissionEnabled());
    } catch (e) {
      emit(PermissionDenied('Failed to enable features :$e'));
    }
  }

  Future<void> _onEnableBatteryOptimizationPermission(
    RequestBatteryPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(BatteryOptimizationPermissionInitial());
      bool isBatteryDisabled = await PermissionService()
          .isBatteryOptimizationGranted();
      if (!isBatteryDisabled) {
        emit(BatteryOptimizationPermissionLoading());
        await PermissionService().requestDisableBatteryOptimization();
        isBatteryDisabled = await PermissionService()
            .isBatteryOptimizationGranted();
      }
      emit(BatteryOptimizationPermissionEnabled());
    } catch (e) {
      emit(PermissionDenied('Failed to enable features :$e'));
    }
  }

  Future<void> _onEnableAccessibilityPermission(
    RequestAccessibilityPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(AccessibilityPermissionInitial());
      bool isAccessibilityDisabled = await PermissionService()
          .isAccessibilityGranted();
      if (!isAccessibilityDisabled) {
        emit(AccessibilityPermissionLoading());
        await PermissionService().requestAccessibilityPermission();
        isAccessibilityDisabled = await PermissionService()
            .isAccessibilityGranted();
      }
      emit(AccessibilityPermissionEnabled());
    } catch (e) {
      emit(PermissionDenied('Failed to enable features :$e'));
    }
  }
}
