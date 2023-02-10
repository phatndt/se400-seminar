import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/src/features/timeoff/domain/entity/leave.dart';
import 'package:front_end/src/features/timeoff/domain/usecase/create_time_off_use_case.dart';
import 'package:front_end/src/features/timeoff/domain/usecase/read_time_off_use_case.dart';
import 'package:front_end/src/features/timeoff/presentation/bloc/time_off_state.dart';
import 'package:intl/intl.dart';

import '../../../../core/bloc/ui_state.dart';
import '../../../../core/data/data_state.dart';

class TimeOffCubit extends Cubit<UIState> {
  TimeOffCubit(this._createTimeOffUseCase, this._readTimeOffUseCase) : super(UIInitialState());

  final CreateTimeOffUseCase _createTimeOffUseCase;
  final ReadTimeOffUseCase _readTimeOffUseCase;

  void createTimeOff(
    String type,
    String startDate,
    String startDateType,
    String endDate,
    String endDateType,
    String description,
  ) async {
    emit(const OnCreateTimeOffState());
    final leave = Leave(
      null,
      type,
      startDate,
      startDateType,
      endDate,
      endDateType,
      description,
      FirebaseAuth.instance.currentUser!.uid,
      DateFormat("dd/MM/yyyy").format(DateTime.now()),
      Status.submit.name,
    );
    final data = await _createTimeOffUseCase.call(leave);
    if (data is DataSuccessState && data.data != null) {
      emit(CreateTimeOffSuccessState(data.data!));
    } else if (data.exception != null) {
      emit(CreateTimeOffFailedState(data.exception!));
    }
  }

  void readTimeOffByUserId() async {
    emit(const OnReadTimeOffState());
    final data = await _readTimeOffUseCase.call(FirebaseAuth.instance.currentUser!.uid);
    if (data is DataSuccessState && data.data != null) {
      emit(ReadTimeOffSuccessState(data.data!));
    } else if (data.exception != null) {
      emit(ReadTimeOffFailedState(data.exception!));
    }
  }
}

enum Status {
  submit,
  cancel,
  approve,
  reject,
}
