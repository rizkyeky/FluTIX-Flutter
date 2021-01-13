part of 'page.dart';

class BookSeatPage extends Page<BookSeatBloc> {
  BookSeatPage({Key key}) : super(key: key);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 24,
                width: 240,
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 3),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
            ),
            const SizedBox(height: 24,),
            Container(
              height: 420,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, indexHuruf) => ColumnBuilder(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  itemCount: 9,
                  itemBuilder: (context, indexAngka) => Container(
                    margin: const EdgeInsets.only(right: 6),
                    child: XSelectedBox(
                      isDisable: bloc.bookedSeats
                        .contains(bloc.seats[indexHuruf][indexAngka]),
                      disableColorBorder: mainColor,
                      defaultColorBorder: borderColor,
                      selectedColorBorder: accentColor,
                      onSelected: (isSelected) => bloc
                        .selectSeats(bloc.seats[indexHuruf][indexAngka]),
                      height: 36, 
                      width: 36, 
                      text: bloc.seats[indexHuruf][indexAngka]
                    )
                  )
                )   
              ),
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 3),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text('  Available', style: blackContentRegular),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 3),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text('  Booked', style: blackContentRegular),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: accentColor, width: 3),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text('  Selected', style: blackContentRegular),
                  ],
                )
              ]
            ),
            const SizedBox(height: 42,),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (contextScaffold) => FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: mainColor,
          onPressed: () {
            if (bloc.selectedSeats.isNotEmpty) {
              // bloc.onSelectSeats();
              Navigator.pushNamed(context, '/checkout');
            } else {
              Scaffold.of(contextScaffold).showSnackBar(snackBar(
                contentText: 'Choose Date and Place',
                labelText: 'DISMISS',
                onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
              ));
            }
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
