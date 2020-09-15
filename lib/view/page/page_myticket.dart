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
              builder: (context, snapshot) => (snapshot.hasData) ? ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: whiteColor,
                  height: 100,
                ),
              ) : const Center(child: CircularProgressIndicator()) 
            ) ,
            FutureBuilder<List<Ticket>>(
              future: bloc.getOldestMovies(),
              builder: (context, snapshot) => (snapshot.hasData) ? ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: whiteColor,
                  height: 100,
                ),
              ) : const Center(child: CircularProgressIndicator()) 
            ),
          ]
        )
      ),
    );
  }
}