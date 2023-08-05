part of 'get_templates_cubit.dart';

abstract class GetTemplatesState extends Equatable {
  const GetTemplatesState();

  @override
  List<Object> get props => [];
}

class GetTemplatesInitial extends GetTemplatesState {
  const GetTemplatesInitial();
}

class GetTemplatesLoading extends GetTemplatesState {
  const GetTemplatesLoading();
}

class GetTemplatesLoaded extends GetTemplatesState {
  final List<CollectionTemplate> templates;

  const GetTemplatesLoaded({
    required this.templates,
  });

  @override
  List<Object> get props => [
        templates,
      ];
}

class GetTemplatesError extends GetTemplatesState {
  const GetTemplatesError();
}
