import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../base/enums/request_status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {

  factory HomeState({
    @Default(AsyncRequestStatus.Initial) AsyncRequestStatus? requestStatus,
    @Default([]) List<String>? status,
    @Default("") String? pathEn,
    @Default("") String? pathIt,
  }) = _HomeState;

}