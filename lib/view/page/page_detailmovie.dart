part of 'page.dart';

class DetailMoviePage extends Page<DetailMovieBloc>  {
  
  final Movie movie;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // bloc.getMovieFromService(movie.id);
  }
  
  DetailMoviePage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int starCount = (movie.voteAverage/2).round();
    final String favoriteCount = NumberFormat.compact().format(movie.voteCount);
    
    return FutureBuilder<void>(
      future: bloc.getMovieFromService(movie.id),
      builder: (context, index) => Scaffold(
        backgroundColor: canvasColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              expandedHeight: 200.0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border,),
                  onPressed: () {},
                )
              ],
              backgroundColor: mainColor,
              leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
                Navigator.pop(context);
              }),
              flexibleSpace: FlexibleSpaceBar(
                background: Ink.image(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  image: NetworkImage('${imageBaseURL}w780${movie.backdropPath}'),
                fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    color: whiteColor,
                    height: 180,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network('${imageBaseURL}w92${movie.posterPath}')
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(movie.title, style: blueTitle,),
                            Text('${movie.country} . PG-13 . 2h 29m', style: blackContentRegular,),
                            Row(
                              children: [
                                for (int i = 0; i < starCount; i++) const Icon(Icons.star, 
                                  size: 18,
                                  color: starColor
                                ),
                                const SizedBox(width: 6,),
                                Text('${movie.voteAverage}/10', style: blackContentRegular)
                              ],
                            ),
                            Row(
                              children: [
                              for (Genre genre in movie.genres) 
                                XChip(
                                  text: genre.name,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 18),
                    padding: const EdgeInsets.all(12),
                    color: whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.favorite, color: mainColor, size: 30),
                            Text('${movie.voteCount}\nlikes', style: blackContentRegular, textAlign: TextAlign.center,),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.bookmark, color: mainColor, size: 30),
                            Text('1000\nwatchlist', style: blackContentRegular, textAlign: TextAlign.center,),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.confirmation_number, color: mainColor, size: 30),
                            Text('1000\nbooked', style: blackContentRegular, textAlign: TextAlign.center,),
                          ],
                        )
                      ],
                    ),
                  ),
                  FutureBuilder<List<Cast>>(
                    future: bloc.getCasts(movie.id),
                    builder: (context, snapshot) => (snapshot.hasData) ? ContentList<Cast>(
                      title: 'Recomended for you',
                      list: snapshot.data,
                      imageBuilder: (e, index) => NetworkImage('${imageBaseURL}w92${e.profilePath}'),
                    ) 
                    : Container(
                      height: 240,
                      color: whiteColor,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                      )
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 18),
                    // height: 180,
                    child: Material(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListTile(
                            onTap: () {},
                            title: Text(
                              'Overview',
                              style: blueTitle,
                            ),
                          ),
                          Container(
                            // color: Colors.amber,
                            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 18),
                            child: Text( movie.overview,
                              // "Marvel's The Avengers (classified under the name Marvel Avengers) "
                              // "Assemble in the United Kingdom and Ireland), or simply The Avengers, is "
                              // "a 2012 American superhero film based on the Marvel Comics superhero",
                              style: blackContentRegular,                                
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 84,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: mainColor, 
          onPressed: () {},
          label: Text('Book now', style: whiteSubtitle),
        ),
      ),
    );
  }
}