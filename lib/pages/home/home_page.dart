import 'package:edtech/pages/home/bloc/home_page_bloc.dart';
import 'package:edtech/pages/home/bloc/home_page_state.dart';
import 'package:edtech/pages/home/home_controller.dart';
import 'package:edtech/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController == null
        ? Container()
        : Scaffold(
            appBar: buildAppBar(),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25.w,
                  ),
                  child: CustomScrollView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText("Hello",
                            color: AppColors.primaryThirdElementText, top: 20),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText(_homeController.userProfile!.name!,
                            top: 5),
                      ),
                      SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 8.w),
                        sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                childCount: state.courseItem.length,
                                (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: courseGrid(state.courseItem[index]));
                            }),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                    childAspectRatio: 1.6)),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
