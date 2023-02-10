import 'package:dio/dio.dart';
import 'package:front_end/src/features/timeoff/domain/entity/leave.dart';
import 'package:front_end/src/core/data/data_state.dart';
import 'package:front_end/src/features/timeoff/domain/repo/time_off_repo.dart';

import '../../../login/data/repository/login_repo_impl.dart';

class TimeOffRepoImpl extends TimeOffRepo {
  @override
  Future<DataState<String>> createTimeoff(Leave leave) async {
    try {
      final dio = Dio();
      final body = {
        "timeOffType": leave.leaveType,
        "fromDate": leave.fromDate,
        "fromDateType": leave.fromDateType,
        "toDate": leave.toDate,
        "toDateType": leave.toDateType,
        "description": leave.description,
        "userId": leave.userId,
        "createDate": leave.createDate,
        "status": leave.status
      };
      final response = await dio.post(
        'https://plankton-app-aig7m.ondigitalocean.app/v1/timeOff/create',
        data: body,
      );
      return DataSuccessState(response.data as String);
    } on DioError catch (e) {
      return DataErrorState(Exception(e.message));
    } catch (e) {
      return DataErrorState(Exception(e));
    }
  }

  @override
  Future<DataState<List<Leave>>> readTimeOffByUserId(String userId) async {
    try {
      final dio = Dio();
      final body = {
        "userId": userId,
      };
      final response = await dio.post(
        'https://plankton-app-aig7m.ondigitalocean.app/v1/timeOff/readByUserId',
        data: body,
      );
      final list = response.data as List;
      List<Leave> listLeave = list.map((e) => Leave.fromMap(e)).toList();
      return DataSuccessState(listLeave);
    } on DioError catch (e) {
      return DataErrorState(Exception(e.message));
    } catch (e) {
      return DataErrorState(Exception(e));
    }
  }
}
