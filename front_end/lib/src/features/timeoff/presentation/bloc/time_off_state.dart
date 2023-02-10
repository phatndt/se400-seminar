import '../../../../core/bloc/ui_state.dart';
import '../../domain/entity/leave.dart';

class CreateTimeOffSuccessState extends UIState {
  final String value;

  const CreateTimeOffSuccessState(this.value);
}

class CreateTimeOffFailedState extends UIState {
  final Exception exception;

  const CreateTimeOffFailedState(this.exception);
}

class OnCreateTimeOffState extends UIState {
  const OnCreateTimeOffState();
}


class ReadTimeOffSuccessState extends UIState {
  final List<Leave> value;

  const ReadTimeOffSuccessState(this.value);
}

class ReadTimeOffFailedState extends UIState {
  final Exception exception;

  const ReadTimeOffFailedState(this.exception);
}

class OnReadTimeOffState extends UIState {
  const OnReadTimeOffState();
}

