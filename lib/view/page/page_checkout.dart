part of 'page.dart';

class CheckoutPage extends Page<CheckoutBloc> {
  CheckoutPage({Key key}) : super(key: key);


  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {

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
                      '${imageBaseURL}w92${bloc.ticket.movie.posterPath}',
                      fit: BoxFit.cover,
                      height: 120,
                      width: 90,
                    )
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        child: Text(bloc.ticket.movie.title, 
                          style: blueTitle, 
                          maxLines: 3,
                          textAlign: TextAlign.left, 
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${bloc.ticket.movie.country} . PG-13 . ${bloc.convertTime(bloc.ticket.movie.runtime)}', 
                        style: blackContentRegular,
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < bloc.starCount; i++) const Icon(
                            Icons.star, 
                            size: 18,
                            color: starColor
                          ),
                          const SizedBox(width: 6,),
                          Text('${bloc.ticket.movie.voteAverage}/10', 
                            style: blackContentRegular
                          )
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
                      Text('Code Order', style: blackContentRegular),
                      Text(bloc.ticket.bookingCode, style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cinema', style: blackContentRegular),
                      Text(bloc.ticket.bookingPlace, style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date & Time', style: blackContentRegular),
                      Text(bloc.ticket.bookingDayDate,
                        style: blackContentBold
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Seat Number', style: blackContentRegular),
                      Text(bloc.ticket.seats.join(', '), style: blackContentBold),
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
                      Text('${convertCurrRP(bloc.moviePrice)} x ${bloc.seatsLen}', 
                        style: blackContentBold
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fee', style: blackContentRegular),
                      Text('${convertCurrRP(bloc.feePrice)} x ${bloc.seatsLen}',
                        style: blackContentBold
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: blackContentRegular),
                      Text(convertCurrRP(bloc.totalPrice), style: blackContentBold),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      floatingActionButton: Builder(
        builder: (scaffContext) => FloatingActionButton.extended(
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: mainColor,
          onPressed: () {
            bloc.onCheckOut();
            showModalBottomSheet(
              context: scaffContext,
              builder: (context) => Container(
                height: 300,
                child: Material(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: bloc.paymentGateways.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.pushNamed(context, '/checkoutsuccess'),
                      title: Text(bloc.paymentGateways[index], style: blackSubtitle),
                    ),
                  ),
                ),
            ));
          },
          label: Text('Checkout now', style: whiteSubtitle)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}