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
      body: FutureBuilder<Object>(
        future: null,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => ListTile(
              // title: ,
            )
          );
        }
      ),
    );
  }

}