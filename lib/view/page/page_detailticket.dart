part of 'page.dart';

class DetailTicketPage extends StatelessWidget {

  final Ticket ticket;

  const DetailTicketPage(this.ticket, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int starCount = (ticket.movie.voteAverage/2).round();

    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Detail Ticket',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: mainColor,), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: Center(
        child: Material(
          elevation: 1,
          color: whiteColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: <Widget>[
                Image.network('${imageBaseURL}w780${ticket.movie.backdropPath}',
                  height: 174,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: blueTitle
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text('${ticket.movie.country} . PG-13 . ${convertTime(ticket.movie.runtime)}', style: blackContentRegular,),
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
                            "Cinema", style: blackContentRegular,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              ticket.bookingPlace,
                              textAlign: TextAlign.end,
                              style: blackContentBold,
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
                            "Date & Time", style: blackContentRegular,
                          ),
                          Text(
                            ticket.bookingTime, style: blackContentBold,
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
                            "Seat Numbers", style: blackContentRegular,
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              ticket.seats.join(', '),
                              textAlign: TextAlign.end,
                              style: blackContentBold,
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
                            "Order ID", style: blackContentRegular,
                          ),
                          Text(
                            ticket.bookingCode, style: blackContentBold,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name: ",
                                style: blackContentRegular,
                              ),
                              Text(
                                ticket.userName,
                                style: blackContentBold,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Paid: ",
                                style: blackContentRegular
                              ),
                              Text(
                                convertCurrRP(ticket.price),
                                style: blackContentBold,
                              ),
                            ],
                          ),
                          QrImage(
                            version: 6,
                            errorCorrectionLevel: QrErrorCorrectLevel.M,
                            padding: const EdgeInsets.all(0),
                            size: 100,
                            data: ticket.bookingCode,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ), 
    );
  }
}