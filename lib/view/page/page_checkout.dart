part of 'page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: mainColor),
        title: Text('Checkout Movie', style: blueTitle),
        backgroundColor: whiteColor,
        bottom: TopLinearProgressIndicator(
          backgroundColor: mainColor,
          valueColor:accentColor,
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
                      'https://cdn1-production-images-kly.akamaized.net/U0oYpcmerYqHr9vA9ZR2hFHG-vM=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2018163/original/090343100_1521625087-8._Hypebeast.jpg',
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