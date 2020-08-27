part of 'page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final HomeBloc _bloc = locator.get<HomeBloc>(instanceName: 'Home Bloc');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12,),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(18),
              child: Text('Playing now', style: blueTitle,)
            ),
            FutureBuilder<List<Movie>>(
              future: _bloc.getMoviesCarousel(0, 5),
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
              future: _bloc.getMoviesCarousel(5, 9),
              builder: (context, snapshot) => (snapshot.hasData) ? ContentList<Movie>(
                title: 'Recomended for you',
                list: snapshot.data,
                imageBuilder: (e, index) => NetworkImage('${imageBaseURL}w92${e.posterPath}'),
              ) 
              : Container(
                height: 240,
                color: whiteColor,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            ),
            FutureBuilder<List<Movie>>(
              future: _bloc.getMoviesCarousel(9, 12),
              builder: (context, snapshot) => (snapshot.hasData) ? ContentList<Movie>(
                title: 'Coming Soon',
                list: snapshot.data,
                imageBuilder: (e, index) => NetworkImage('${imageBaseURL}w92${e.posterPath}'),
              ) 
              : Container(
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
}