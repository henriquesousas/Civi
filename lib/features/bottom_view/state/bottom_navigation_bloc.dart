import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/features/bottom_view/state/botto_navigation_event.dart';
import 'package:yousafe/features/bottom_view/state/bottom_navigation_state.dart';
import 'package:yousafe/features/favorites/favourite_view.dart';
import 'package:yousafe/features/home/home_view.dart';
import 'package:yousafe/features/profile/profile_view.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(
          BottomNavigationState(
            selectedIndex: 0,
            showBottomBar: true,
            pages: [
              HomeView(),
              Container(),
              FavouriteView(),
              ProfileView(),
            ],
          ),
        ) {
    on<ChangePageEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });

    _triggerFeedbackDialog();
  }

  void _triggerFeedbackDialog() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(Duration(seconds: 5), () {
    //     final context = Get.context;
    //     if (context != null) {
    //       showFeedbackDialog(context);
    //     }
    //   });
    // });
  }
}
