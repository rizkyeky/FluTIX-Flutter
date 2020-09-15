part of 'page.dart';

class TicketDetailPage extends Page<TicketDetailBloc> {

  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  void dispose() {
  }

  @override
  void init() {
  }

  @override
  Widget build(BuildContext context) {

    final int starCount = (ticket.movie.voteAverage/2).round();

    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Profile',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: mainColor,), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: Center(
        child: Material(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ticket.movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: blackContentRegular
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  ticket.movie.country,
                  style: blackContentRegular,
                ),
                const SizedBox(
                  height: 6,
                ),
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
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Cinema",
                      style: blackContentBold,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        ticket.bookingPlace,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Date & Time",
                    ),
                    Text(
                      ticket.bookingTime
                    )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Seat Numbers",
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        ticket.seats.join(', '),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Order ID",
                    ),
                    Text(
                      ticket.bookingCode,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ), 
    );
  }
}