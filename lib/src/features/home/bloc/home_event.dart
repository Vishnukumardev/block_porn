import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class EnableProtectionEvent extends HomeEvent {}

class DisableProtectionEvent extends HomeEvent {}

class CheckProtectionStatusEvent extends HomeEvent {}
