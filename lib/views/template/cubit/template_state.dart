part of 'template_cubit.dart';

sealed class TemplateState extends Equatable {
  const TemplateState();

  @override
  List<Object?> get props => [];
}

final class TemplateInitial extends TemplateState {}

final class TemplateValid extends TemplateState{

  final ETemplate template;
  final List<ETemplateItem> items;

  const TemplateValid({required this.template, required this.items});

  @override
  List<Object?> get props => [template];
}

final class TemplateLoading extends TemplateValid{
  const TemplateLoading({required super.template, required super.items});
}

final class TemplateInvalid extends TemplateState{}