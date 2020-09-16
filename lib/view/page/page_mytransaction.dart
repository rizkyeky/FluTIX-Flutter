part of 'page.dart';

class MyTransactionPage extends Page<MyTransactionBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'My Transaction',
        textStyle: blueTitle,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: mainColor,), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: null,
        builder: (context, snapshot) => (snapshot.hasData) 
        ? (snapshot.data.isNotEmpty) ? ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) => ListTile(
            // title: Text(snapshot.data[index].movie.title, style: blackSubtitle),
            // subtitle: Text(snapshot.data[index].bookingPlace, style: blackContentRegular),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // child: Image.network('${imageBaseURL}w92${snapshot.data[index].movie.posterPath}')
            ), 
          ),
        ) : const Center(child: Text('No Tickets')) 
        : const Center(child: CircularProgressIndicator()) 
      ),
    );
  }

}