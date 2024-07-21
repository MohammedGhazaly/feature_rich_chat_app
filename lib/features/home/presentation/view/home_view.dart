import 'package:feature_rich_chat_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeCubit homeCubit;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    homeCubit = HomeCubit.get(context);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Flutter chat pro"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user_icon.png"),
                  radius: 20,
                ),
              )
            ],
          ),
          body: PageView(
            onPageChanged: homeCubit.onPageChanged,
            controller: pageController,
            children: [
              Center(
                child: Text("Chats"),
              ),
              Center(
                child: Text("Groups"),
              ),
              Center(
                child: Text("People"),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeCubit.currentIndex,
            onTap: (index) {
              homeCubit.onTab(index);
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 250), curve: Curves.easeIn);
            },
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2), label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.group), label: "Groups"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.globe), label: "People"),
            ],
          ),
        );
      },
    );
  }
}
