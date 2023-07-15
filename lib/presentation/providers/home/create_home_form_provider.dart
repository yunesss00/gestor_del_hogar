import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:gestor_del_hogar/presentation/providers/providers.dart';
import 'package:gestor_del_hogar/shared/infractrusture/inputs/inputs.dart';

class CreateHomeFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  final int creator;

  CreateHomeFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.name = const Name.pure(),
      this.creator = 0});

  CreateHomeFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    int? creator,
  }) =>
      CreateHomeFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          name: name ?? this.name,
          creator: creator ?? this.creator);

  @override
  String toString() {
    return '''
    CreateHomeFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      name = $name,
      creator = $creator
  ''';
  }
}

final createHomeFormProvider = StateNotifierProvider.autoDispose<
    CreateHomeFormNotifier, CreateHomeFormState>((ref) {
  final createHomeCallBack = ref.watch(homeProvider.notifier).create;

  return CreateHomeFormNotifier(
    createHomeCallBack: createHomeCallBack,
  );
});

class CreateHomeFormNotifier extends StateNotifier<CreateHomeFormState> {
  final Function(String, int) createHomeCallBack;

  CreateHomeFormNotifier({
    required this.createHomeCallBack,
  }) : super(CreateHomeFormState());

  onHomeNameChanged(String value) {
    final homeName = Name.dirty(value);
    state = state.copyWith(
        name: homeName,
        isValid: Formz.validate([homeName]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    await createHomeCallBack(state.name.value, state.creator);
  }

  _touchEveryField() {
    final name = Name.dirty(state.name.value);

    state = state.copyWith(
        isFormPosted: true,
        name: name,
        creator: state.creator,
        isValid: Formz.validate([name]));
  }
}
