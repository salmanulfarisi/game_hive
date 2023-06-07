import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:game_hive/app/bloc/get_platforms.dart';
import 'package:game_hive/app/common/error_widget.dart';
import 'package:game_hive/app/common/loader_widget.dart';
import 'package:game_hive/app/model/game_model/platform/platform.dart';
import 'package:game_hive/app/model/platform_response.dart';
import 'package:game_hive/app/service/services.dart';

class PlatformContainer extends StatefulWidget {
  const PlatformContainer({super.key});

  @override
  State<PlatformContainer> createState() => _PlatformContainerState();
}

class _PlatformContainerState extends State<PlatformContainer> {
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
    return StreamBuilder(
      stream: getPlatformsBloc.subject.stream,
      builder: (context, AsyncSnapshot<PlatformResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.error != null && snapshot.data!.error.isNotEmpty) {
            return buildErrorWidget(snapshot.data!.error);
          }
          return _buildPlatformConatiner(snapshot.data!, context);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.data!.error);
        } else {
          return buildLoaderWidget();
        }
      },
    );
  }

  final ScrollController _scrollController = ScrollController();
  List<PlatformModel> platforms = [];
  Widget _buildPlatformConatiner(PlatformResponse data, BuildContext context) {
    platforms = data.platforms;
    final size = MediaQuery.of(context).size;
    if (platforms.isEmpty) {
      return const Center(
        child: Text('No platforms'),
      );
    } else {
      return AnimationLimiter(
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: platforms.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                    child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    // width: size.width * 0.4,
                    height: size.height * 0.1,
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                'https://images.igdb.com/igdb/image/upload/t_thumb/${platforms[index].platformLogo?.imageId}.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              platforms[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            );
          },
        ),
      );
    }
  }
}
