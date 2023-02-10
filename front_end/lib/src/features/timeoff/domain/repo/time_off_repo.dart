import 'package:front_end/src/features/timeoff/domain/entity/leave.dart';

import '../../../../core/data/data_state.dart';

abstract class TimeOffRepo {
  Future<DataState<String>> createTimeoff(Leave leave);
  Future<DataState<List<Leave>>> readTimeOffByUserId(String userId);
}
