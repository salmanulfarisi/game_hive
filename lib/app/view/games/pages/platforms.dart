import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:game_hive/app/bloc/get_platforms.dart';
import 'package:game_hive/app/common/error_widget.dart';
import 'package:game_hive/app/common/loader_widget.dart';
import 'package:game_hive/app/model/game_model/platform/platform.dart';
import 'package:game_hive/app/model/platform_response.dart';
import 'package:game_hive/app/service/services.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;
import 'package:game_hive/app/view/games/pages/platform_details.dart';

class PlatFormScreen extends StatefulWidget {
  const PlatFormScreen({super.key});

  @override
  State<PlatFormScreen> createState() => _PlatFormScreenState();
}

class _PlatFormScreenState extends State<PlatFormScreen> {
  final ScrollController _scrollController = ScrollController();
  List<PlatformModel> platforms = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        AllServices.limit += 10;
        await getPlatformsBloc.getPlatforms();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.Colors.mainBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: themes.Colors.white,
        ),
        backgroundColor: themes.Colors.mainBackground,
        elevation: 0,
        title: Text(
          'PlatForms',
          style: themes.TextStyles.appBarTitle,
        ),
      ),
      body: StreamBuilder(
        stream: getPlatformsBloc.subject.stream,
        builder: (context, AsyncSnapshot<PlatformResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.error != null &&
                snapshot.data!.error.isNotEmpty) {
              return buildErrorWidget(snapshot.data!.error);
            }
            return _buildPlatformContainer(snapshot.data!, context);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.data!.error);
          } else {
            return buildLoaderWidget();
          }
        },
      ),
    );
  }

  Widget _buildPlatformContainer(PlatformResponse data, BuildContext context) {
    platforms = data.platforms;
    final size = MediaQuery.of(context).size;
    if (platforms.isEmpty) {
      return const Center(
        child: Text('No platforms'),
      );
    } else {
      return AnimationLimiter(
        child: AnimationLimiter(
          child: GridView.count(
            crossAxisCount: 2,
            controller: _scrollController,
            crossAxisSpacing: 18.0,
            mainAxisSpacing: 10.0,
            children: List.generate(platforms.length, (index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlatformDetailsScreen(
                                data: platforms[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: themes.Colors.mainBackground,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://images.igdb.com/igdb/image/upload/t_cover_big/${platforms[index].platformLogo?.imageId}.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: size.width * 0.5,
                              height: size.height * 0.07,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                platforms[index].name,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: themes.TextStyles.normalWhiteText,
                                // style: themes.TextStyles.platformName,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
    }
  }
}
