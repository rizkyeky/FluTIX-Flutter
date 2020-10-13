part of 'component.dart';

class MovieCard extends StatelessWidget {

  final Movie _movie;
  final void Function(bool, Movie) onSelected;

  const MovieCard(this._movie, {Key key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int starCount = (_movie.voteAverage/2).round();

    return XCard(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundImage: NetworkImage('${imageBaseURL}w300${_movie.backdropPath}'),
      onTap: () {
        Navigator.pushNamed(context, '/detailmovie', arguments: _movie);
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.black.withOpacity(0.6),
          //     Colors.black.withOpacity(0),
          //   ],
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topCenter,
          // )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 180,
                  child: Text(_movie.title,
                    maxLines: 2,
                    style: whiteTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < starCount; i++) const Icon(Icons.star, 
                      size: 18,
                      color: starColor
                    ),
                    const SizedBox(width: 6,),
                    Text('${_movie.voteAverage}/10', style: whiteContent)
                  ],
                )
              ],
            ),
            XSwitchIcon(
              activeIcon: Icons.favorite, 
              nonactiveIcon: Icons.favorite_border, 
              onSelected: (isSelected) {
                onSelected(isSelected, _movie);
              },
            )
          ],
        )
      ),
    );
  }
}