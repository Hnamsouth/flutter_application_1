import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';
import 'package:flutter_application_1/presentation/nav/ui/side_bar_btn.dart';
import 'package:flutter_application_1/presentation/widget/custom_appbar.dart';
import 'package:flutter_application_1/presentation/widget/custom_tab_bar.dart';
import 'package:flutter_application_1/provider/channel_provider.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;
import 'package:sidebarx/sidebarx.dart';

import '../../model/menu.dart';

class NavScreen extends StatefulWidget {
  final Function(bool) handleBrightnessChanged;
  final ThemeMode themeMode;
  const NavScreen(
      {super.key,
      required this.handleBrightnessChanged,
      required this.themeMode});

  @override
  State<NavScreen> createState() => _NavScreenWidgetState();
}

class _NavScreenWidgetState extends State<NavScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool isSideBarOpen = false;

  Menu selectedSideMenu = sidebarMenus.first;
  Menu selectedBottonNav = bottomNavItems.first;

  late rive.SMIBool isMenuOpenInput;

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.video_library_outlined,
    Icons.add_circle_outline,
    Icons.subscriptions_outlined,
    Icons.account_circle_outlined,
  ];

  Offset _offset = const Offset(15, 95);

  @override
  void initState() {
    _initSideBarController();
    super.initState();
    context.read<ChannelProvider>().initData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  void updateSideBarBtn() {
    setState(() => {});
  }

  void _initSideBarController() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white60,
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            fit: StackFit.loose,
            children: [
              // SideBar content
              AnimatedPositioned(
                width: 288,
                height: MediaQuery.of(context).size.height,
                duration: const Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
                left: isSideBarOpen ? 0 : -288,
                top: 0,
                // child: const SideBar(),
                child: Container(
                  height: double.infinity,
                  width: 265.0,
                  color: Colors.grey.shade900,
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(
                      1 * animation.value - 30 * (animation.value) * pi / 180)
                  ..rotateX(
                      1 * animation.value - 29 * (animation.value) * pi / 90),
                child: Transform.translate(
                  offset: Offset(animation.value * 200, 0),
                  child: Transform.scale(
                    alignment: AlignmentDirectional.centerStart,
                    scale: scalAnimation.value,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: _getBody,
                    ),
                  ),
                ),
              ),
              _sidebarBtn,
              // SideBar  btn
              // _sidebarBtnPosition(constraints),
              _sidebarDragBtn(constraints),
            ],
          ),
        ),
        bottomNavigationBar: _bottomNavContainer,
      ),
    );
  }

  SideBarButton _sidebarDragBtn(BoxConstraints constraints) {
    return SideBarButton(
        offset: _offset,
        onPressed: () {
          if (_animationController.value == 0) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
          setState(
            () {
              context.read<ChannelProvider>().getMoreVideo();

              isSideBarOpen = !isSideBarOpen;
            },
          );
        },
        onDragEnd: (details) => setState(() {
              _offset = Offset(
                details.offset.dx < 10
                    ? 0
                    : details.offset.dx >= constraints.maxWidth - 50
                        ? constraints.maxWidth - 40
                        : details.offset.dx,
                details.offset.dy < 10
                    ? 40
                    : details.offset.dy >= constraints.maxHeight - 135
                        ? constraints.maxHeight - 135
                        : details.offset.dy,
              );
              if (kDebugMode) {
                print(_offset);
              }
            }),
        onDragUpdate: (details) {});
  }

  Positioned _sidebarBtnPosition(BoxConstraints constraints) {
    return Positioned(
        left: _offset.dx,
        top: _offset.dy,
        child: LongPressDraggable(
          childWhenDragging: Container(),
          feedback: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(137, 35, 35, 35),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow),
          ),
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 158, 158, 158)
                        .withOpacity(0.5),
                    offset: const Offset(0, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: () {
                  if (_animationController.value == 0) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(
                    () {
                      isSideBarOpen = !isSideBarOpen;
                    },
                  );
                },
                backgroundColor: Colors.grey.shade900.withOpacity(0.8),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              )),
          onDragEnd: (details) => setState(() {
            double adjustment =
                MediaQuery.of(context).size.height - constraints.maxHeight;
            _offset = Offset(details.offset.dx, details.offset.dy - adjustment);
          }),
        ));
  }

  AnimatedPositioned get _sidebarBtn => AnimatedPositioned(
        duration: const Duration(milliseconds: 680),
        curve: Curves.fastOutSlowIn,
        left: isSideBarOpen ? 140 : 0,
        top: 16,
        child: Container(),
        // child: MenuBtn(
        //   press: () {
        //     if (_animationController.value == 0) {
        //       _animationController.forward();
        //     } else {
        //       _animationController.reverse();
        //     }
        //     setState(
        //       () {
        //         isSideBarOpen = !isSideBarOpen;
        //       },
        //     );
        //   },
        //   isSideBarOpen: isSideBarOpen,
        //   riveOnInit: (artboard) {
        //     final controller = Rive.StateMachineController.fromArtboard(
        //         artboard, "State Machine");
        //     artboard.addController(controller!);
        //     isMenuOpenInput =
        //         controller.findInput<bool>("isOpen") as Rive.SMIBool;
        //     isMenuOpenInput.value = true;
        //   },
        // ),
      );

  Widget get _getBody => CustomAppBar(
      selectedIndex: _selectedIndex,
      handleBrightnessChanged: widget.handleBrightnessChanged,
      themeMode: widget.themeMode,
      controller: _controller,
      parentkey: _key,
      isSideBarOpen: isSideBarOpen);

  Transform get _bottomNavContainer => Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: Container(
          padding:
              const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
          margin: const EdgeInsets.fromLTRB(7, 0, 7, 15),
          decoration: BoxDecoration(
              color: Colors.grey.shade400.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.4, 0.8],
                colors: <Color>[
                  Color.fromRGBO(103, 103, 103, 0.886),
                  Color.fromRGBO(33, 33, 34, 0.922)
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade700.withOpacity(0.7),
                  offset: const Offset(0, 3),
                  blurRadius: 5,
                ),
              ],
              border:
                  Border.all(color: Colors.white.withOpacity(0.7), width: 1.0)),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      );

  CurvedNavigationBar get _bottomNavCurved => CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.grey.shade900,
        buttonBackgroundColor: Colors.grey.shade800,
        backgroundColor: Palette.youtubeRed,
        animationCurve: Curves.easeInOutCirc,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      );

  Transform get _bottomNavTransform => Transform.translate(
        offset: const Offset(0, 0),
        child: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              // color: Colors.white70.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white70..withOpacity(0.3),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              // margin: const EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  // gradient: const LinearGradient(
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  //   stops: [0.4, 0.8],
                  //   colors: [
                  //     Color.fromRGBO(131, 58, 180, 100),
                  //     // Color.fromRGBO(253,29,29,100),
                  //     Color.fromRGBO(252, 176, 69, 100)
                  //   ],
                  // ),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1.0)),
              child: CustomTabBar(
                icons: _icons,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
              ),
            ),
          ),
        ),
      );
}
