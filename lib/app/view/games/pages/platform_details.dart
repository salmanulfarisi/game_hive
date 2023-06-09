import 'package:flutter/material.dart';
import 'package:game_hive/app/common/read_more.dart';
import 'package:game_hive/app/common/title_widget.dart';
import 'package:game_hive/app/model/game_model/platform/platform.dart';
import 'package:game_hive/app/service/enums.dart';
import 'package:game_hive/app/utils/size.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;
import 'package:game_hive/app/view/games/pages/version_details.dart';
import 'package:game_hive/app/view/games/widgets/information_widget.dart';
import 'package:game_hive/app/view/games/widgets/logo_container.dart';
import 'package:game_hive/app/view/games/widgets/popupmenu_item.dart';
import 'package:game_hive/app/view/games/widgets/version_container.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformDetailsScreen extends StatefulWidget {
  final PlatformModel data;

  const PlatformDetailsScreen({super.key, required this.data});

  @override
  State<PlatformDetailsScreen> createState() => _PlatformDetailsScreenState();
}

class _PlatformDetailsScreenState extends State<PlatformDetailsScreen> {
  final int index = 0;
  final double appBarHeight = 56.0;

  void showRedirectMsg() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Redirecting to website...'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.data.websites[index].url))) {
      throw Exception('Could not launch ${widget.data.websites[index].url}');
    }
  }

  int getDevelopedGames(PlatformModel data) {
    int length = 0;
    int length2 = 0;
    for (int i = 0; i < data.versions.length; i++) {
      if (data.versions[i].companies != null) {
        length++;
      }
      for (int j = 0; j < data.versions[i].companies!.length; j++) {
        if (data.versions[i].companies![j].company != null) {
          length2++;
        }
      }
    }

    print(length2);
    return length2;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DateTime createdAt =
        DateTime.fromMillisecondsSinceEpoch(widget.data.createdAt * 1000)
            .toLocal();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(createdAt);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: themes.Colors.mainBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themes.Colors.mainBackground,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: themes.Colors.white,
          ),
          title: Text(
            widget.data.name,
            style: themes.TextStyles.appBarTitle,
          ),
          actions: [
            PopupMenuButton(
              offset: Offset(0.0, appBarHeight),
              itemBuilder: (_) {
                return [
                  buildPopupMenuItem('All Games', LineIcons.gamepad, () {}),
                  buildPopupMenuItem('Website', LineIcons.link, () {
                    if (widget.data.websites.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No website found'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      return;
                    } else {
                      showRedirectMsg();
                      Future.delayed(const Duration(seconds: 2), () {
                        _launchUrl();
                      });
                      print('Website');
                    }
                  }),
                ];
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        image: NetworkImage(
                            'https://images.igdb.com/igdb/image/upload/t_thumb/${widget.data.platformLogo?.imageId}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [
                            0.0,
                            0.9
                          ],
                          colors: [
                            const Color(0xff20232a).withOpacity(1.0),
                            themes.Colors.backgroundColor.withOpacity(0.0)
                          ]),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.13,
                    left: size.width * 0.05,
                    child: Row(
                      children: [
                        LogoContainer(
                          size: size,
                          url:
                              'https://images.igdb.com/igdb/image/upload/t_thumb/${widget.data.platformLogo?.imageId}.jpg',
                        ),
                        AppSize.width10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.name,
                              style: themes.TextStyles.platformTitleText,
                            ),
                            Text(
                              '(${EnumClass.platformCategoryEnum(widget.data.category)})',
                              style: themes.TextStyles.appBarTitle,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Created At: ',
                                  style: themes.TextStyles.appBarTitle,
                                ),
                                Text(
                                  formattedDate,
                                  style: themes.TextStyles.appBarTitle,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              AppSize.height10,
              ReadMoreWidget(
                text: '${widget.data.versions[index].summary}',
                maxLines: 100,
              ),
              AppSize.height10,
              TitleWidget(size: size, title: 'Information'),
              InformationWidget(size: size, data: widget.data),
              // SizedBox(
              //   height: size.height * 0.1,
              //   child: const TabBar(
              //     indicatorColor: themes.Colors.mainColor,
              //     labelColor: themes.Colors.white,
              //     unselectedLabelColor: themes.Colors.grey,
              //     dividerColor: Colors.transparent,
              //     indicatorWeight: 1.0,
              //     tabs: [
              //       Tab(
              //         child: Text('Information'),
              //       ),
              //       Tab(
              //         child: Text('Hardware'),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.35,
              //   child: TabBarView(
              //     children: [
              //       InformationWidget(size: size, data: widget.data),
              //       HardwareWidget(size: size, data: widget.data),
              //     ],
              //   ),
              // ),
              Container(
                width: size.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // height: size.height * 0.01,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Versions of ${widget.data.name}',
                  textAlign: TextAlign.start,
                  style: themes.TextStyles.normalWhiteText,
                ),
              ),
              AppSize.height10,
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(
                  getDevelopedGames(widget.data),
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VersionDetails(
                                    data: widget.data.versions[index])));
                      },
                      child: VersionContainer(
                        image:
                            'https://images.igdb.com/igdb/image/upload/t_thumb/${widget.data.versions[index].platformLogo?.imageId}.jpg',
                        name: widget.data.versions[index].name ?? 'No Name',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
