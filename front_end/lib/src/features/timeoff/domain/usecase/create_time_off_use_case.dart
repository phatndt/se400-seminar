import 'package:front_end/src/core/usecase/usecase.dart';
import 'package:front_end/src/features/timeoff/domain/entity/leave.dart';
import 'package:front_end/src/features/timeoff/domain/repo/time_off_repo.dart';

import '../../../../core/data/data_state.dart';

class CreateTimeOffUseCase extends UseCase<DataState<String>, Leave> {
  final TimeOffRepo _timeOffRepo;

  CreateTimeOffUseCase(this._timeOffRepo);

  @override
  Future<DataState<String>> call(Leave params) {
    return _timeOffRepo.createTimeoff(params);
  }
}
