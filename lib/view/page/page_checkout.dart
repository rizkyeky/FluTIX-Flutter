part of 'page.dart';

class CheckoutPage extends Page<CheckoutBloc> {
  CheckoutPage({Key key}) : super(key: key);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(
        textTitle: 'Choose Seats',
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '',
                      fit: BoxFit.cover,
                      height: 120,
                      width: 90,
                      // isAntiAlias: true,
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Avengers: Infinity War', style: blueTitle,),
                      Text('Western . PG-13 . 2h 29m', style: blackContentRegular,),
                      Wrap(
                        spacing: 3,
                        children: [
                          for (int i = 0; i < 5; i++) const Icon(Icons.star, color: starColor,),
                          Text(' 7/10', style: blackContentRegular),
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
                      Text('Paris Van Java', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date & Time', style: blackContentRegular),
                      Text('Sat 23 2020, 19:20', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Seat Number', style: blackContentRegular),
                      Text('A1, A2, A3', style: blackContentBold),
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
                      Text('Rp20.000 x 3', style: blackContentBold),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fee', style: blackContentRegular),
                      Text('Rp5.000 x 3', style: blackContentBold),
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
            const SizedBox(
              height: 12,
            ),
            XButton(
              width: 138,
              color: mainColor,
              isBorder: true,
              onTap: () {},
              child: Text(
                'Checkout now',
                style: whiteSubtitle,
              ),
            )
          ],
        )
      ),
    );
  }
}