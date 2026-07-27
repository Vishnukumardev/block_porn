import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomePermissionInitial extends HomeState {}

class HomePermissionLoading extends HomeState {}

class HomePermissionEnabled extends HomeState {}

class HomePermissionDisabled extends HomeState {}

class HomePermissionDenied extends HomeState {
  final String message;
  const HomePermissionDenied(this.message);

  @override
  List<Object?> get props => [message];
}
