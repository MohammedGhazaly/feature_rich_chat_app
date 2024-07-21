import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  static HomeCubit get(context) => BlocProvider.of(context);

  void onTab(int index) {
    currentIndex = index;
    emit(TabChanged());
  }

  void onPageChanged(int index) async {
    currentIndex = index;

    // pageController.jumpToPage(currentIndex);
    emit(PageViewChanged());
  }
}
