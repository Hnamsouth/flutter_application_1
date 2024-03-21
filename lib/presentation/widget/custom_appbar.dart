import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/model/entity/channel_subcription.dart';
import 'package:flutter_application_1/model/entity/video_model.dart';
import 'package:flutter_application_1/presentation/home/home_youtube.dart';
import 'package:flutter_application_1/presentation/nav/screen_type.dart';
import 'package:flutter_application_1/presentation/nav/ui/search_screen.dart';
import 'package:flutter_application_1/presentation/widget/circle_avatar.dart';
import 'package:flutter_application_1/presentation/widget/topic_button.dart';
import 'package:flutter_application_1/provider/channel_provider.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAppBar extends StatefulWidget {
  final int selectedIndex;
  final Function(bool) handleBrightnessChanged;
  final ThemeMode themeMode;
  final SidebarXController controller;
  final GlobalKey<ScaffoldState> parentkey;
  final bool isSideBarOpen;
  const CustomAppBar({
    super.key,
    required this.selectedIndex,
    required this.handleBrightnessChanged,
    required this.themeMode,
    required this.controller,
    required this.parentkey,
    required this.isSideBarOpen,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _appBarIndex = 0;
  List<Widget> _screens = [];
  List<Topic> topics = topicsData;
  ScreenType screenType = ScreenType.HOME;
  List<ChannelSubcription> subcriptions = [];

  @override
  void initState() {
    _screens = [
      const HomeYoutube(),
      const Text("Shorts"),
      const Text("Add Video"),
      const Text("Subscriptions"),
      const Text("Profile"),
    ];
    screenType = ScreenType.values[widget.selectedIndex];
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomAppBar oldWidget) {
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      screenType = ScreenType.values[widget.selectedIndex];
      subcriptions = channelSubcription;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Skeletonizer.sliver(
            enabled: !context.watch<ChannelProvider>().isLoading,
            child: _appBar()),
        SliverToBoxAdapter(
          child: IndexedStack(
            index: widget.selectedIndex,
            children: _screens,
          ),
        )
      ],
    );
  }

  SliverAppBar _appBar() => SliverAppBar(
        floating: true,
        snap: true,
        pinned: false,
        expandedHeight:
            ScreenType.values[widget.selectedIndex] == ScreenType.SUBCRIPTIONS
                ? 210
                : 100.0,
        actions: _action(),
        title: _title,
        bottom: _bottom,
      );

  List<Widget>? _action() {
    return [
      SizedBox(
        width: 60,
        child: TextButton(
            onPressed: () => widget.handleBrightnessChanged(
                !(widget.themeMode == ThemeMode.light)),
            child: const Icon(Icons.brightness_6_outlined)),
      ),
      Container(
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: TextButton(
            onPressed: () => {},
            child: const Icon(Icons.notifications_none_outlined)),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        width: 40,
        child: TextButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()))
                },
            child: const Icon(Icons.search_outlined)),
      ),
    ];
  }

  Row get _title => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Palette.youtubeRed,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 23,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            "SouthTube",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              letterSpacing: -2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  PreferredSize get _bottom => PreferredSize(
        preferredSize:
            Size.fromHeight(screenType == ScreenType.SUBCRIPTIONS ? 150 : 55),
        child: _getBottom(),
      );

  Widget _getBottom() {
    switch (screenType) {
      case ScreenType.SUBCRIPTIONS:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _subcriptionsAppBar,
            _mainBottom,
          ],
        );
      // more cases
      default:
        return _mainBottom;
    }
  }

  Container get _mainBottom => Container(
        // color: Colors.white24,
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
        padding: const EdgeInsets.only(left: 7.0),
        child: SizedBox(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                padding: const EdgeInsets.all(7),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1 + topics.length,
                itemBuilder: (context, index) => Container(
                      margin: index == 0
                          ? const EdgeInsets.only(right: 13.0)
                          : const EdgeInsets.only(right: 6.0),
                      child: index != 0
                          ? TopicButton(
                              onPressed: () => setState(() {
                                _appBarIndex = index - 1;
                              }),
                              index: index - 1,
                              appBarIndex: _appBarIndex,
                            )
                          : SizedBox(
                              width: widget.isSideBarOpen ? 0 : 45,
                            ),
                    ))),
      );

  OutlineGradientButton get _newsButton => OutlineGradientButton(
        onTap: () {},
        gradient: const LinearGradient(
          colors: [
            Colors.red,
            Colors.redAccent,
          ],
        ),
        strokeWidth: 2,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        radius: const Radius.circular(20),
        child: const Text(
          "News",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  Container get _subcriptionsAppBar => Container(
      // color: Colors.white24,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 5),
      height: 110,
      child: SizedBox(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          padding: const EdgeInsets.all(7),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: channelSubcription.length,
          itemBuilder: (context, index) => Container(
            width: 90,
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatarChannel(channelSubcription: subcriptions[index]),
          ),
        ),
      ));
}
