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
              future: _bloc.getMoviesCarousel(),
              builder: (context, snapshot) => (snapshot.hasData) ? CarouselSlider.builder(
                itemCount: 5,
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
            const ContentList(title: 'Recomended for you',),
            const ContentList(title: 'Coming Soon',)
          ],
        ),
      ),
    );
  }
}