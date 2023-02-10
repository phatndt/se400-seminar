import 'package:front_end/src/features/timeoff/domain/entity/leave.dart';
import 'package:front_end/src/features/timeoff/domain/repo/time_off_repo.dart';

import '../../../../core/data/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class ReadTimeOffUseCase extends UseCase<DataState<List<Leave>>, String> {
  final TimeOffRepo _timeOffRepo;

  ReadTimeOffUseCase(this._timeOffRepo);

  @override
  Future<DataState<List<Leave>>> call(String params) {
    return _timeOffRepo.readTimeOffByUserId(params);
  }
}
