import 'package:flutter/material.dart';
import 'package:game_hive/app/common/title_widget.dart';
import 'package:game_hive/app/model/game_model/platform/platform.dart';
import 'package:game_hive/app/service/enums.dart';
import 'package:game_hive/app/utils/size.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;
import 'package:intl/intl.dart';

class InformationWidget extends StatelessWidget {
  final Size size;
  final PlatformModel data;
  const InformationWidget({super.key, required this.size, required this.data});

  @override
  Widget build(BuildContext context) {
    final DateTime createdAt =
        DateTime.fromMillisecondsSinceEpoch(data.createdAt * 1000).toLocal();
    final DateTime updateAt =
        DateTime.fromMillisecondsSinceEpoch(data.updatedAt * 1000).toLocal();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(createdAt);
    final String formattedUpdateDate =
        DateFormat('yyyy-MM-dd').format(updateAt);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Platform Type',
                      ),
                      AppSize.height10,
                      Text(
                        '${EnumClass.platformCategoryEnum(data.category)}',
                        style: themes.TextStyles.searchText,
                      ),
                    ],
                  ),
                  AppSize.width10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Platform Family',
                      ),
                      AppSize.height10,
                      Text(
                        data.platformFamily?.name ?? 'N/A',
                        style: themes.TextStyles.searchText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppSize.height10,
            SizedBox(
              height: size.height * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Generation',
                      ),
                      AppSize.height10,
                      Text(
                        data.generation == 0
                            ? 'N/A'
                            : '${data.generation} Generation',
                        style: themes.TextStyles.searchText,
                      ),
                    ],
                  ),
                  AppSize.width10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Alternative Name',
                      ),
                      AppSize.height10,
                      Text(
                        data.alternativeName,
                        style: themes.TextStyles.searchText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppSize.height10,
            SizedBox(
              height: size.height * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Created At',
                      ),
                      AppSize.height10,
                      Text(
                        formattedDate,
                        style: themes.TextStyles.searchText,
                      ),
                    ],
                  ),
                  AppSize.width10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        size: size,
                        title: 'Updated At',
                      ),
                      AppSize.height10,
                      Text(
                        formattedUpdateDate,
                        style: themes.TextStyles.searchText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
