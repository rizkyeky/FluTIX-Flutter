part of 'page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
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
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  color: Colors.white,
                );
              }, 
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(vertical: 18),
              height: 200,
              child: Material(
              color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Recomended for you', style: blueTitle,),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: mainColor,), 
                        onPressed: () {}
                      ),
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          width: 120,
                          height: 120,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(vertical: 18),
              height: 200,
              child: Material(
              color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Coming Soon', style: blueTitle,),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: mainColor,), 
                        onPressed: () {}
                      ),
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          width: 120,
                          height: 120,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}