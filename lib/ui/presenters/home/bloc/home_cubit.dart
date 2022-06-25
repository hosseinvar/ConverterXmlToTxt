import 'package:converter/base/enums/request_status.dart';
import 'package:converter/ui/presenters/home/bloc/home_state.dart';
import 'package:converter/ui/presenters/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeState initialState) : super(initialState);

  final homeRepository = HomeRepository();

  void parsXml(BuildContext context) {
    emit(state.copyWith(requestStatus: AsyncRequestStatus.Submitting, status: [
      ...state.status!,
      AppLocalizations.of(context)!.startConverter,
      AppLocalizations.of(context)!.convertingEnglish,
    ]));

    homeRepository.parsXmlEnglish(context).then(
      (value) {
        emit(
          state.copyWith(status: [
            ...state.status!,
            AppLocalizations.of(context)!.completeEnglish,
            AppLocalizations.of(context)!.path + value,
            AppLocalizations.of(context)!.convertingItalian,
          ]),
        );

        homeRepository.parsXmlItalian(context).then((value) {
          emit(
            state.copyWith(
                requestStatus: AsyncRequestStatus.Success,
                status: [
                  ...state.status!,
                  AppLocalizations.of(context)!.completeItalian,
                  AppLocalizations.of(context)!.path + value,
                ]),
          );
        });
      },
    );
  }
}
