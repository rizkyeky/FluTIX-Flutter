part of 'page.dart';

class HomePage extends Page<HomeBloc> {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
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
              future: bloc.getMoviesCarousel(0, 5),
              builder: (context, snapshot) => (snapshot.hasData) ? CarouselSlider.builder(
                itemCount: snapshot.data.length,
                options: CarouselOptions(
                  height: 180
                ),
                itemBuilder: (context, index)=> MovieCard(
                  snapshot.data[index]
                ), 
              )
              : Container(
                height: 180,
                color: whiteColor, 
                alignment: Alignment.center, 
                child: const CircularProgressIndicator(),
              ),
            ),
            FutureBuilder<List<Movie>>(
              future: bloc.getMoviesCarousel(5, 9),
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
              future: bloc.getMoviesCarousel(9, 12),
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
    // TODO: implement init
  }
}