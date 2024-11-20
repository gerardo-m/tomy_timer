part of 'templates_cubit.dart';

sealed class TemplatesState extends Equatable {
  const TemplatesState();

  @override
  List<Object?> get props => [];
}

final class TemplatesInitial extends TemplatesState {}

final class TemplatesValid extends TemplatesState{

  final List<ETemplate> templates;

  const TemplatesValid({required this.templates});

  @override
  List<Object?> get props => [templates];
}

final class TemplatesLoading extends TemplatesValid{
  const TemplatesLoading({required super.templates});
}

final class TemplatesInvalid extends TemplatesState{}