part of 'page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final HomeBloc _bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(18),
              child: Text('Playing now', style: blueTitle,)
            ),
            FutureBuilder<List<Movie>>(
              future: _bloc.getMoviesCarousel(0, 4),
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
            ContentList(
              title: 'Recomended for you',
              start: 5,
              end: 8,
              movies: _bloc.getMoviesCarousel,
            ),
            ContentList(
              title: 'Coming Soon',
              start: 9,
              end: 12,
              movies: _bloc.getMoviesCarousel,
            ),
          ],
        ),
      ),
    );
  }
}