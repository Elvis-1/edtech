import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/common/routes/routes.dart';
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
  late UserItem userProfile;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
    // userProfile = HomeController(context: context).userProfile;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () {
          return HomeController(context: context).init();
        },
        child: BlocBuilder<HomePageBlocs, HomePageStates>(
          builder: (context, state) {
            if (state.courseItem.isEmpty) {
              HomeController(context: context).init();
              print("-------course is empty------");
            } else {
              print("-------state.course is not empty------");
            }
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
                    child: homePageText(userProfile.name!, top: 5),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.w),
                    sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.courseItem.length,
                            (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.COURSE_DETAILS_PAGE,
                                    arguments: {
                                      "id": state.courseItem.elementAt(index).id
                                    });
                              },
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
      ),
    );
  }
}
