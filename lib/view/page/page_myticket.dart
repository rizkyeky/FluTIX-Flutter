part of 'page.dart';

class MyTicketsPage extends Page<MyTicketsBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  Widget tabBuilder(BuildContext context, Future<List<Ticket>> Function() future) {
    return FutureBuilder<List<Ticket>>(
      future: future(),
      builder: (context, snapshot) => (snapshot.hasData) 
      ? (snapshot.data.isNotEmpty) ? ListView.separated(
        itemCount: snapshot.data.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          indent: 12,
          endIndent: 12,
        ),
        itemBuilder: (context, index) => Material(
          color: whiteColor,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '${imageBaseURL}w92${snapshot.data[index].movie.posterPath}',
                      fit: BoxFit.cover,
                      height: 90,
                      width: 60,
                    )
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        child: Text(snapshot.data[index].movie.title, 
                          style: blueTitle, 
                          maxLines: 3,
                          textAlign: TextAlign.left, 
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        snapshot.data[index].bookingDayDate, 
                        style: blackContentRegular,
                      ),
                      Text(
                        snapshot.data[index].bookingPlace, 
                        style: blackContentRegular,
                      ),
                    ]
                  )
                ],
              ),
            ),
          ),
        )
      ) : Center(child: Text('No Tickets', style: blackContentRegular,)) 
      : const Center(child: CircularProgressIndicator()) 
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: canvasColor,
        appBar: AppBar(
          title: Text('My Tickets', style: whiteTitle),
          bottom: const TabBar(tabs: [
            Tab(text: 'Newest',),
            Tab(text: 'Oldest',),
          ]),
        ),
        body: TabBarView(
          children: [
            tabBuilder(context, bloc.getNewestMovies),
            tabBuilder(context, bloc.getOldestMovies),
          ]
        )
      ),
    );
  }
}