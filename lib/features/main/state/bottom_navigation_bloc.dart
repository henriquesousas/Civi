import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/features/favorites/favourite_view.dart';
import 'package:yousafe/features/home/home_view.dart';
import 'package:yousafe/features/profile/profile_page.dart';
import 'package:yousafe/features/settings/settings_page.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(
          BottomNavigationState(
            selectedIndex: 0,
            showBottomBar: true,
            pages: [
              const HomeView(),
              const FavouriteView(),
              const ProfilePage(),
              const SettingsPage(),
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
