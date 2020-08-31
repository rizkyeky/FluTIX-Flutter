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

  String convertTime(int minute) {
   
    final str = StringBuffer();

    if (minute > 60) {
      str.write((minute / 60).floor());
      str.write('h ');
    }
    if (minute % 60 != 0) {
      str.write(minute % 60);
      str.write('m');
    }
    return str.toString();
  }
  
  DetailMoviePage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int starCount = (movie.voteAverage/2).round();
    
    return FutureBuilder<Movie>(
      future: bloc.getDetailMovie(movie),
      builder: (context, snapshot) => (snapshot.hasData) ? Scaffold(
        backgroundColor: canvasColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              expandedHeight: 200.0,
              actions: [
                XSwitchIcon(
                  activeIcon: Icons.favorite, 
                  nonactiveIcon: Icons.favorite_border, 
                  onSelected: () {}
                ),
                XSwitchIcon(
                  activeIcon: Icons.bookmark, 
                  nonactiveIcon: Icons.bookmark_border, 
                  onSelected: () {}
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
                    // height: 180,
                    width: MediaQuery.of(context).size.width,
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
                            Container(
                              constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 180
                              ),
                              child: Text(movie.title, 
                                style: blueTitle, 
                                maxLines: 3,
                                textAlign: TextAlign.left, 
                                overflow: TextOverflow.ellipsis,
                              )
                            ),
                            Text('${movie.country} . PG-13 . ${convertTime(snapshot.data.runtime)}', style: blackContentRegular,),
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
                            Container(
                              constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 180
                              ),
                              child: Wrap(
                                spacing: 6,
                                children: [
                                for (Genre genre in movie.genres) 
                                  Chip(label: Text(genre.name), labelStyle: blackContentBold,),
                                ],
                              ),
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
                      title: 'Cast',
                      list: snapshot.data,
                      height: 192,
                      textBuilder: (e, index) => Text(e.name, 
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: blackContentRegular, 
                        textAlign: TextAlign.center,
                      ),
                      imageBuilder: (e, index) {
                        if (e.profilePath != null) {
                          return NetworkImage('${imageBaseURL}w92${e.profilePath}');
                        }
                        else {
                          return const AssetImage('assets/no_image.png');
                        }
                      },
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
          onPressed: () {
            // locator.get<Movie>(instanceName: 'Booked Movie');
            Navigator.pushNamed(context, '/booktime', arguments: movie);
          },
          label: Text('Book now', style: whiteSubtitle),
        ),
      ) 
      : const Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}