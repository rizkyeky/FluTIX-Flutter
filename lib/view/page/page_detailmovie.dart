part of 'page.dart';

class DetailMoviePage extends Page<DetailMovieBloc>  {
  
  final Movie movie;

  @override
  void dispose() {
  }

  @override
  void init() {
    bloc.checkFavoriteMovie(movie);
  }
  
  DetailMoviePage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int starCount = (movie.voteAverage/2).round();
    
    return Scaffold(
      backgroundColor: canvasColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            expandedHeight: 200.0,
            actions: [
              StreamBuilder<bool>(
                stream: bloc.favoriteStream,
                builder: (context, snapshot) {
                  return XSwitchIcon(
                    isSelected: snapshot.data,
                    activeIcon: Icons.favorite, 
                    nonactiveIcon: Icons.favorite_border, 
                    onSelected: (isSelected) {
                      bloc.setFavoriteMovie(movie);
                    }
                  );
                }
              ),
              XSwitchIcon(
                activeIcon: Icons.bookmark, 
                nonactiveIcon: Icons.bookmark_border, 
                onSelected: (isSelected) {}
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
                FutureBuilder<Movie>(
                  future: bloc.getDetailMovie(movie),
                  builder: (context, snapshot) => (snapshot.hasData) ? Container(
                      color: whiteColor,
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
                    )
                    : Container(
                      height: 150,
                      color: whiteColor,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    )
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
                    disableNavigate: true,
                    textBuilder: (e, index) => Text(e.name, 
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: blackContentRegular, 
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
                          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 18),
                          child: Text(movie.overview,
                            textAlign: TextAlign.justify,
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
          locator.call<Ticket>(instanceName: 'Ticket').copyWith(movie: movie);
          Navigator.pushNamed(context, '/booktime');
        },
        label: Text('Book now', style: whiteSubtitle),
      ),
    );
  }
}