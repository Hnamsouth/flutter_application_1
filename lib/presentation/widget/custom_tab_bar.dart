import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/entities_youtube/channel_model.dart';
import 'package:flutter_application_1/presentation/nav/screen_type.dart';
import 'package:flutter_application_1/provider/channel_provider.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    Channel mychannel = context.watch<ChannelProvider>().channel;

    return TabBar(
      dividerHeight: 0,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? const Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: !(ScreenType.values[i] == ScreenType.PROFILE)
                      ? Icon(
                          e,
                          color: i == selectedIndex
                              ? Colors.white
                              : Colors.white60,
                          size: 30.0,
                          fill: 0.5,
                        )
                      : Container(
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //     mychannel.snippet?.thumbnails?.high?.url
                            //             ?.padRight(4, "s") ??
                            //         "",
                            //   ),
                            //   fit: BoxFit.cover,
                            // ),
                            border: Border.all(
                                color: i == selectedIndex
                                    ? Colors.white
                                    : Colors.white54,
                                width: 2.5),
                          ),
                          child: Image.network(
                            mychannel.snippet?.thumbnails?.high?.url ?? "",
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
