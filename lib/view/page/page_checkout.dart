part of 'page.dart';

class CheckoutPage extends Page<CheckoutBloc> {
  CheckoutPage({Key key}) : super(key: key);

  final ticket = locator.call<Ticket>(instanceName: 'Ticket');

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

    final int starCount = (ticket.movie.voteAverage/2).round();
    final int seatsLen = ticket.seats.length;
    final int totalPrice = (20000 * seatsLen) + (5000 * seatsLen);

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
                      '${imageBaseURL}w92${ticket.movie.posterPath}',
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
                        child: Text(ticket.movie.title, 
                          style: blueTitle, 
                          maxLines: 3,
                          textAlign: TextAlign.left, 
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text('${ticket.movie.country} . PG-13 . ${convertTime(ticket.movie.runtime)}', style: blackContentRegular,),
                      Row(
                        children: [
                          for (int i = 0; i < starCount; i++) const Icon(Icons.star, 
                            size: 18,
                            color: starColor
                          ),
                          const SizedBox(width: 6,),
                          Text('${ticket.movie.voteAverage}/10', style: blackContentRegular)
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
                      Text(ticket.bookingCode, style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cinema', style: blackContentRegular),
                      Text(ticket.bookingPlace, style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date & Time', style: blackContentRegular),
                      Text(ticket.bookingDayDate,
                        style: blackContentBold
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Seat Number', style: blackContentRegular),
                      Text(ticket.seats.join(', '), style: blackContentBold),
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
                      Text('Rp$totalPrice', style: blackContentBold),
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
        onPressed: () {

          locator.call<Ticket>(instanceName: 'Ticket').copyWith(dayDate: [
            bloc.thisDate.weekday,
            bloc.thisDate.day
          ]);
          locator.call<Ticket>(instanceName: 'Ticket').copyWith(time: [
            bloc.thisDate.hour,
            bloc.thisDate.minute,
            bloc.thisDate.second,
          ]);

          Navigator.pushNamed(context, '/checkoutsuccess');
        },
        label: Text('Checkout now', style: whiteSubtitle)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}