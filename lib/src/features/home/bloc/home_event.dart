import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class RequestOverlayPermissionEvent extends HomeEvent {}

class RequestBatteryPermissionEvent extends HomeEvent {}

class RequestAccessibilityPermissionEvent extends HomeEvent {}

class CheckPermissionEvent extends HomeEvent {}
