part of 'template_item_cubit.dart';

sealed class TemplateItemState extends Equatable {
  const TemplateItemState();

  @override
  List<Object?> get props => [];
}

final class TemplateItemInitial extends TemplateItemState {}

final class TemplateItemValid extends TemplateItemState{

  final ETemplateItem item;

  const TemplateItemValid({required this.item});

  @override
  List<Object?> get props => [item];
}

final class TemplateItemLoading extends TemplateItemValid{
  const TemplateItemLoading({required super.item});
}

final class TemplateItemInvalid extends TemplateItemState{}