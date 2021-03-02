import 'package:flutter/material.dart';
import 'package:movies/bloc/blocs.dart';
import 'package:movies/common/styles/styles.dart';
import 'package:movies/common/widgets/widgets.dart';
import 'package:movies/models/models.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NowPlayingContainer extends StatefulWidget {
  @override
  _NowPlayingContainerState createState() => _NowPlayingContainerState();
}

class _NowPlayingContainerState extends State<NowPlayingContainer> {
  @override
  void initState() {
    nowPlayingMoviesBloc..getNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: nowPlayingMoviesBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();
        if (snapshot.hasError)
          return DisplayError(error: snapshot.error);
        else
          return _NowPlayingContainerBuilder(movies: snapshot.data.movies);
      },
    );
  }
}

class _NowPlayingContainerBuilder extends StatelessWidget {
  final List<Movie> movies;

  const _NowPlayingContainerBuilder({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 1);

    if (movies.length == 0) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "No Movies",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }
    return Container(
      height: 200,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: List.generate(
              movies.length,
              (index) => Card(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original/${movies[index].backPoster}",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainColor.withOpacity(1.0),
                            AppColors.mainColor.withOpacity(0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 0.9],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movies[index].title,
                                style: TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: movies.length,
                effect: ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  activeStrokeWidth: 0.5,
                  strokeWidth: 0.5,
                  activeDotColor: Colors.orange,
                  activeDotScale: 1,
                  maxVisibleDots: 5,
                  dotWidth: 8,
                  dotHeight: 8,
                  radius: 8,
                  spacing: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
