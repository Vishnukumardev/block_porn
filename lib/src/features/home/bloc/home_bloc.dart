import 'package:block_porn/src/features/home/bloc/home_event.dart';
import 'package:block_porn/src/features/home/bloc/home_state.dart';
import 'package:block_porn/src/shared/services/permission_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IPermissionService permissionService;

  HomeBloc({required this.permissionService}) : super(HomePermissionInitial()) {
    on<CheckProtectionStatusEvent>(_onCheckStatus);
    on<EnableProtectionEvent>(_onEnableProtection);
    on<DisableProtectionEvent>(_onDisableProtection);
  }

  Future<void> _onCheckStatus(
    CheckProtectionStatusEvent event,
    Emitter<HomeState> emit,
  ) async {
    final hasAccessibility = await permissionService.isAccessibilityGranted();
    final hasOverlay = await permissionService.isOverlayGranted();
    final isBatteryDisabled = await permissionService
        .isBatteryOptimizationDisabled();

    if (hasAccessibility && hasOverlay && isBatteryDisabled) {
      emit(HomePermissionEnabled());
    } else {
      emit(HomePermissionDisabled());
    }
  }

  Future<void> _onEnableProtection(
    EnableProtectionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomePermissionLoading());
    try {
      bool hasAccessibility = await permissionService.isAccessibilityGranted();
      bool hasOverlay = await permissionService.isOverlayGranted();
      bool isBatteryDisabled = await permissionService
          .isBatteryOptimizationDisabled();

      if (!hasAccessibility) {
        await permissionService.requestAccessibilityPermission();
        hasAccessibility = await permissionService.isAccessibilityGranted();
      }

      if (hasAccessibility && !hasOverlay) {
        await permissionService.requestOverlayPermission();
        hasOverlay = await permissionService.isOverlayGranted();
      }

      if (hasAccessibility && hasOverlay && !isBatteryDisabled) {
        await permissionService.requestDisableBatteryOptimization();
        isBatteryDisabled = await permissionService
            .isBatteryOptimizationDisabled();
      }

      if (hasOverlay && hasAccessibility && isBatteryDisabled) {
        emit(HomePermissionEnabled());
      } else {
        emit(
          const HomePermissionDenied('Required permissions were not granted.'),
        );
      }
    } catch (e) {
      emit(HomePermissionDenied('Failed to enable features :$e'));
    }
  }

  Future<void> _onDisableProtection(
    DisableProtectionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomePermissionDisabled());
  }
}
