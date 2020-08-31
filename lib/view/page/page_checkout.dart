part of 'page.dart';

class CheckoutPage extends Page<CheckoutBloc> {
  CheckoutPage(this.movie, this.selectedBook, {Key key}) : super(key: key);

  final Movie movie;
  final Map<String, String> selectedBook;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
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

  @override
  Widget build(BuildContext context) {

    final int starCount = (movie.voteAverage/2).round();
    final int seatsLen = selectedBook['seats'].split(", ").length;

    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Checkout Movie',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: mainColor), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '${imageBaseURL}w92${movie.posterPath}',
                      fit: BoxFit.cover,
                      height: 120,
                      width: 90,
                      // isAntiAlias: true,
                    )
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        child: Text(movie.title, 
                          style: blueTitle, 
                          maxLines: 3,
                          textAlign: TextAlign.left, 
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text('${movie.country} . PG-13 . ${convertTime(movie.runtime)}', style: blackContentRegular,),
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
                    ]
                  )
                ],
              )
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              height: 120,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ID Order', style: blackContentRegular),
                      Text('220881212', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cinema', style: blackContentRegular),
                      Text(selectedBook['place'], style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date & Time', style: blackContentRegular),
                      Text('${selectedBook['date']}, ${selectedBook['time']}', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Seat Number', style: blackContentRegular),
                      Text(selectedBook['seats'], style: blackContentBold),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              height: 90,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price', style: blackContentRegular),
                      Text('Rp20.000 x $seatsLen', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fee', style: blackContentRegular),
                      Text('Rp5.000 x $seatsLen', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: blackContentRegular),
                      Text('Rp75.000', style: blackContentBold),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: mainColor,
        onPressed: () {},
        label: Text('Checkout now', style: whiteSubtitle)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}