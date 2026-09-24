import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class PermissionInitial extends HomeState {}

class PermissionLoading extends HomeState {}

class PermissionEnabled extends HomeState {}

class PermissionDenied extends HomeState {
  final String message;
  const PermissionDenied(this.message);

  @override
  List<Object?> get props => [message];
}

class OverlayPermissionInitial extends HomeState {}

class OverlayPermissionLoading extends HomeState {}

class OverlayPermissionEnabled extends HomeState {}

class OverlayPermissionDenied extends HomeState {}

class BatteryOptimizationPermissionInitial extends HomeState {}

class BatteryOptimizationPermissionLoading extends HomeState {}

class BatteryOptimizationPermissionEnabled extends HomeState {}

class BatteryOptimizationPermissionDenied extends HomeState {}

class AccessibilityPermissionInitial extends HomeState {}

class AccessibilityPermissionLoading extends HomeState {}

class AccessibilityPermissionEnabled extends HomeState {}

class AccessibilityPermissionDenied extends HomeState {}
