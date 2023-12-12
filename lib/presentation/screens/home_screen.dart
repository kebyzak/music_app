import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:music_app/data/repositories/auth_repository.dart';
import 'package:music_app/presentation/screens/profile_screen.dart';
import 'package:music_app/presentation/screens/qr_screen.dart';
import 'package:music_app/presentation/screens/songs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.orange,
    Colors.white,
    Colors.blue,
    Colors.pink,
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.black
        : Colors.orange;

    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: unselectedColor,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(500),
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor: colors[currentPage].computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 35,
          iconWidth: 35,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) {
            if (currentPage == 0) {
              return const SongsScreen();
            } else if (currentPage == 1) {
              return const QrScreen();
            } else if (currentPage == 2) {
              return ProfileScreen(authRepository: AuthRepository());
            } else {
              return TabBarView(
                controller: tabController,
                dragStartBehavior: DragStartBehavior.down,
                physics: const BouncingScrollPhysics(),
                children: [
                  InfiniteListPage(
                    controller: controller,
                    color: colors[0],
                    title: 'Songs',
                  ),
                  InfiniteListPage(
                    controller: controller,
                    color: colors[1],
                    title: 'QR',
                  ),
                  InfiniteListPage(
                    controller: controller,
                    color: colors[2],
                    title: 'Profile',
                  ),
                ],
              );
            }
          },
          child: TabBar(
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            controller: tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: currentPage == 0
                        ? colors[0]
                        : currentPage == 1
                            ? colors[1]
                            : currentPage == 2
                                ? colors[2]
                                : unselectedColor,
                    width: 4),
                insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
            tabs: [
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.music_note,
                    color: currentPage == 0 ? colors[0] : unselectedColor,
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.qr_code,
                    color: currentPage == 1 ? colors[1] : unselectedColor,
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: currentPage == 2 ? colors[2] : unselectedColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfiniteListPage extends StatelessWidget {
  final ScrollController controller;
  final Color color;
  final String title;

  const InfiniteListPage({
    super.key,
    required this.controller,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$title Item $index'),
          );
        },
      ),
    );
  }
}
