part of 'page.dart';

class DetailMoviePage extends Page<DetailMovieBloc>  {
  
  final Movie movie;

   @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    bloc.getMovieFromService(movie.id);
  }
  
  DetailMoviePage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bloc.init(),
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
              title: Text(movie.title, style: whiteTitle,),
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
                    height: 150, 
                    color: whiteColor,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('IDR 120.000', style: blueTitle,),
                              Text('${movie.country} . PG-13 . 2h 29m', style: blackContentRegular,),
                              Wrap(
                                spacing: 3,
                                children: [
                                  for (int i = 0; i < 5; i++) const Icon(Icons.star, color: starColor,),
                                  Text(' 7/10', style: blackContentRegular),
                                ],
                              ),
                              Wrap(
                                spacing: 6,
                                children: [
                                for (int i = 0; i < 3; i++) 
                                  ActionChip(
                                    elevation: 0,
                                    pressElevation: 0,
                                    onPressed: () {},
                                    label: Text('Action', style: blackContentBold),

                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.favorite, color: Colors.red,),
                                  Text('1K+', style: blackContentRegular),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.bookmark, color: Colors.blue,),
                                  Text('5K+', style: blackContentRegular),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // ContentList<Cast>(
                  //   title: 'Cast',
                  //   height: 90,
                  //   // itemCount: 10,
                  //   child: Container(
                  //     height: 90,
                  //     width: 90,
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 18),
                    height: 180,
                    child: Material(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            padding: EdgeInsets.all(14),
                            child: Text(
                              "Marvel's The Avengers (classified under the name Marvel Avengers) "
                              "Assemble in the United Kingdom and Ireland), or simply The Avengers, is "
                              "a 2012 American superhero film based on the Marvel Comics superhero",
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