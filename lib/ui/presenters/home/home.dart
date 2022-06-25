import 'package:converter/base/enums/request_status.dart';
import 'package:converter/ui/presenters/home/bloc/home_cubit.dart';
import 'package:converter/ui/presenters/home/bloc/home_state.dart';
import 'package:converter/ui/theme/colors.dart';
import 'package:converter/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBar(context, AppLocalizations.of(context)!.converterApp, false),
        body: const Body());
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeState()),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (state.requestStatus != AsyncRequestStatus.Success) {
                        context.read<HomeCubit>().parsXml(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      alignment: Alignment.center,
                      fixedSize: const Size(200, 60),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                    ),
                    child: state.requestStatus == AsyncRequestStatus.Submitting
                        ? const Center(
                            child: CircularProgressIndicator(color: Colors.white,),
                          )
                        : Text(
                            state.requestStatus == AsyncRequestStatus.Success
                                ? AppLocalizations.of(context)!.complete
                                : AppLocalizations.of(context)!.start,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.status!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(state.status![index],
                          style: Theme.of(context).textTheme.subtitle2),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
