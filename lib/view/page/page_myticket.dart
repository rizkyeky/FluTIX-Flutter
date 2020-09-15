part of 'page.dart';

class MyTicketsPage extends Page<MyTicketsBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

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
            FutureBuilder<List<Ticket>>(
              future: bloc.getNewestMovies(),
              builder: (context, snapshot) => (snapshot.hasData) 
              ? (snapshot.data.isNotEmpty) ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data[index].movie.title, style: blackSubtitle),
                  subtitle: Text(snapshot.data[index].bookingPlace, style: blackContentRegular),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network('${imageBaseURL}w92${snapshot.data[index].movie.posterPath}')
                  ), 
                ),
              ) : const Center(child: Text('No Tickets')) 
              : const Center(child: CircularProgressIndicator()) 
            ) ,
            FutureBuilder<List<Ticket>>(
              future: bloc.getOldestMovies(),
              builder: (context, snapshot) => (snapshot.hasData) 
              ? (snapshot.data.isNotEmpty) ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data[index].movie.title, style: blackSubtitle),
                  subtitle: Text(snapshot.data[index].bookingPlace, style: blackContentRegular),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network('${imageBaseURL}w92${snapshot.data[index].movie.posterPath}')
                  ), 
                ),
              ) : const Center(child: Text('No Tickets')) 
              : const Center(child: CircularProgressIndicator()) 
            ),
          ]
        )
      ),
    );
  }
}