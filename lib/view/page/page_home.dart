part of 'page.dart';

class HomePage extends Page<HomeBloc> {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        automaticallyImplyLeading: false,
        textTitle: 'FluTIX',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(18),
              child: Text('Playing now', style: blueTitle,)
            ),
            FutureBuilder<List<Movie>>(
              future: bloc.getPlayingNowMoviesList(0, 5),
              builder: (context, snapshot) => (snapshot.hasData) ? CarouselSlider.builder(
                itemCount: snapshot.data.length,
                options: CarouselOptions(
                  height: 180
                ),
                itemBuilder: (context, index) => MovieCard(
                  snapshot.data[index],
                  onSelected: (isSelected, movie) {
                    if (isSelected) {
                      bloc.setFavoriteMovie(movie);
                    } else {
                      bloc.setFavoriteMovie(movie);
                    }
                  } ,
                ), 
              )
              : Container(
                height: 180,
                alignment: Alignment.center, 
                child: const CircularProgressIndicator(),
              ),
            ),
            FutureBuilder<List<Movie>>(
              future: bloc.getPopularityMoviesList(0, 5),
              builder: (context, snapshot) => (snapshot.hasData) ? ContentList<Movie>(
                title: 'Recomended for you',
                list: snapshot.data,
                imageBuilder: (e, index) => NetworkImage('${imageBaseURL}w92${e.posterPath}'),
              ) 
              : Container(
                margin: const EdgeInsets.only(top: 18),
                height: 240,
                color: whiteColor,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            ),
            FutureBuilder<List<Movie>>(
              future: bloc.getComingSoonMoviesList(0, 5),
              builder: (context, snapshot) => (snapshot.hasData) ? ContentList<Movie>(
                title: 'Coming Soon',
                list: snapshot.data,
                imageBuilder: (e, index) => NetworkImage('${imageBaseURL}w92${e.posterPath}'),
              ) 
              : Container(
                margin: const EdgeInsets.only(top: 18),
                height: 240,
                color: whiteColor,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            ),
            const SizedBox(height: 54,)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
  }
}