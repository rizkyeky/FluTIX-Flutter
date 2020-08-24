part of 'page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: XTopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(18),
              child: Text('Playing now', style: blueTitle,)
            ),
            CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(
                viewportFraction: 0.6,
                height: 180
              ),
              itemBuilder: (context, index) => const XCard(
                // color: Colors.white,
                isBorder: true,
                padding: EdgeInsets.symmetric(horizontal: 12),
                // child: Container(
                //   height: 120,
                //   width: 120,
                // )
              ), 
            ),
            const ContentList(title: 'Recomended for you',),
            const ContentList(title: 'Coming Soong',)
          ],
        ),
      ),
    );
  }
}