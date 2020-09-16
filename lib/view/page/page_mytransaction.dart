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
      future: bloc.getTransactions(),
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
                      '${imageBaseURL}w92${snapshot.data[index].picture}',
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
                        child: Text(snapshot.data[index].title, 
                          style: blueTitle, 
                          maxLines: 3,
                          textAlign: TextAlign.left, 
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        snapshot.data[index].amount.toString(),
                        style: blueSubtitle,
                      ),
                      Text(
                        snapshot.data[index].subtitle, 
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
      )
    );
  }

}