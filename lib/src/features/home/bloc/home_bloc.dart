import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/services/permission_services.dart';
import 'home_event.dart';
import 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IPermissionService permissionService;

  HomeBloc({required this.permissionService}) : super(PermissionInitial()) {
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
    bool isOverlayEnabled = await permissionService.isOverlayGranted();
    bool isBatteryOptimizationEnabled = await permissionService
        .isBatteryOptimizationGranted();
    bool isAccessibilityEnabled = await permissionService
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

      bool hasOverlay = await permissionService.isOverlayGranted();
      if (!hasOverlay) {
        emit(OverlayPermissionLoading());
        await permissionService.requestOverlayPermission();
        hasOverlay = await permissionService.isOverlayGranted();
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
      bool isBatteryDisabled = await permissionService
          .isBatteryOptimizationGranted();
      if (!isBatteryDisabled) {
        emit(BatteryOptimizationPermissionLoading());
        await permissionService.requestDisableBatteryOptimization();
        isBatteryDisabled = await permissionService
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
      bool isAccessibilityDisabled = await permissionService
          .isAccessibilityGranted();
      if (!isAccessibilityDisabled) {
        emit(AccessibilityPermissionLoading());
        await permissionService.requestAccessibilityPermission();
        isAccessibilityDisabled = await permissionService
            .isAccessibilityGranted();
      }
      emit(AccessibilityPermissionEnabled());
    } catch (e) {
      emit(PermissionDenied('Failed to enable features :$e'));
    }
  }
}
