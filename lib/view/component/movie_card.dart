part of 'component.dart';

class MovieCard extends StatelessWidget {

  final Movie _movie;

  const MovieCard(this._movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int starCount = (_movie.rating/2).round();

    return XCard(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundImage: NetworkImage('${imageBaseURL}w500${_movie.backdropPath}'),
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0),
            ]
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_movie.title,
                  maxLines: 2,
                  style: whiteTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    for (int i = 0; i < starCount; i++) const Icon(Icons.star, 
                      size: 18,
                      color: starColor
                    ),
                    const SizedBox(width: 6,),
                    Text('${_movie.rating}/10', style: whiteContent)
                  ],
                )
              ],
            ),
            XSwitchIcon(
              activeIcon: Icons.favorite, 
              nonactiveIcon: Icons.favorite_border, 
              onSelected: () {},
            )
          ],
        )
      ),
    );
  }
}