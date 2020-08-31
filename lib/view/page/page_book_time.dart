part of 'page.dart';

class BookTimePage extends Page<BookTimeBloc>{
  BookTimePage(this.movie, {Key key}) : super(key: key);

  final Movie movie;

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
                        itemCount: bloc.timePlace[place].length,
                        itemBuilder: (context, index) => StreamBuilder<Map<String, int>>(
                          initialData: const {},
                          stream: bloc.selectedTimePlaceStream,
                          builder: (context, snapshot) {
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
      floatingActionButton: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: mainColor,
            onPressed: () {
              Navigator.pushNamed(context, '/bookseat', arguments: {
                'movie': movie, 
                'book': bloc.selectedDateTimePlace
              });
            },
            child: const Icon(Icons.arrow_forward),
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}