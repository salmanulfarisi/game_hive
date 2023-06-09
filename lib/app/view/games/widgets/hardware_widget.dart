import 'package:flutter/material.dart';
import 'package:game_hive/app/common/title_widget.dart';
import 'package:game_hive/app/model/game_model/platform/platform.dart';
import 'package:game_hive/app/utils/size.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class HardwareWidget extends StatelessWidget {
  final Size size;
  final PlatformModel data;
  const HardwareWidget({super.key, required this.size, required this.data});

  @override
  Widget build(BuildContext context) {
    return data.versions[0].cpu == 'No cpu'
        ? const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'No Hardware Information',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themes.Colors.white,
              ),
            ),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Connectivity',
                      ),
                      Text(
                        data.versions[0].connectivity ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'CPU',
                      ),
                      Text(
                        data.versions[0].cpu ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Graphics',
                      ),
                      Text(
                        data.versions[0].graphics ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Memory',
                      ),
                      Text(
                        data.versions[0].memory ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Resolution',
                      ),
                      Text(
                        data.versions[0].resolution ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'OS',
                      ),
                      Text(
                        data.versions[0].os ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Media',
                      ),
                      Text(
                        data.versions[0].media ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Output',
                      ),
                      Text(
                        data.versions[0].output ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Sound',
                      ),
                      Text(
                        data.versions[0].sound ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                      AppSize.height10,
                      TitleWidget(
                        size: size,
                        title: 'Storage',
                      ),
                      LimitedBox(
                        maxWidth: size.width * 0.9,
                        child: Text(
                          data.versions[0].storage ?? 'N/A',
                          style: themes.TextStyles.searchText,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
