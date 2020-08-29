part of 'page.dart';

class BookTimePage extends Page<BookTimeBloc>{
  BookTimePage({Key key}) : super(key: key);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Choose Time and Place',
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
            Container(
              color: whiteColor,
              child: Column(
                children: [
                  Text('This Week', style: blackSubtitle,),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 48,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bloc.daysInWeek.length,
                  itemBuilder: (context, index) => StreamBuilder<int>(
                    stream: bloc.selectedDateStream,
                    builder: (context, snapshot) {
                      return Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: XSelectedBox(
                          isSelected: index == snapshot.data,
                          onSelected: (isSelected) {
                            if (isSelected) {
                              bloc.selectDate(index);
                            } else {
                              bloc.selectDate(-1);
                            }
                          },
                          width: 96,
                          text: '${bloc.daysInWeek[index]['name']} ${bloc.daysInWeek[index]['date']}'
                        ),
                      );
                    }
                  ),
                ),
            ),
            const SizedBox(height: 36,),
            ColumnBuilder(
              itemCount: bloc.timePlace.keys.toList().length,
              itemBuilder: (context, indexPlace) {
                
                final String place = bloc.timePlace.keys.toList()[indexPlace];

                return Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bloc.timePlace.keys.toList()[indexPlace], style: blackSubtitle,),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      height: 48,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bloc.items.length,
                        itemBuilder: (context, index) => StreamBuilder<Map<String, int>>(
                          initialData: const {},
                          stream: bloc.selectedTimePlaceStream,
                          builder: (context, snapshot) {

                            // final List<String> selectedItems = [];
                            // selectedItems.addAll(snapshot.data);

                            // return Card(
                            //   color: (selectedItems.contains(bloc.items[index])) ? Colors.amber : Colors.grey,
                            //   child: InkWell(
                            //     onTap : () {
                            //       if (selectedItems.contains(bloc.items[index])) {
                            //         bloc.removeItem(bloc.items[index]);
                            //       }
                            //       else {
                            //         bloc.addItem(bloc.items[index]);
                            //       }
                            //     },
                            //     child: Container(height: 100, width: 100, child: Text(bloc.items[index]),),
                            //   ),
                            // );
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: XSelectedBox(
                                isSelected: snapshot.data.containsKey(place) && snapshot.data.containsValue(index),
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    bloc.selectTimePlace(place, index);
                                  } else {
                                    bloc.selectTimePlace('', -1);
                                  }
                                },
                                width: 96,
                                text: bloc.timePlace[place][index]
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              );
              } 
            ),
            const SizedBox(height: 54,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.pushNamed(context, '/bookseat');
          bloc.printSelected();
        },
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}