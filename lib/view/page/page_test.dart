import 'package:flutter/material.dart';
import 'package:flutix_training/bloc/bloc.dart';

class TestPage extends StatelessWidget {
  TestPage({Key key}) : super(key: key);

  final TestBloc bloc = TestBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: bloc.getItems(),
        builder: (_, snapshotFuture) => (snapshotFuture.hasData) ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 36,),
            StreamBuilder<List<String>>(
              stream: bloc.selectedItemStream,
              initialData: const [],
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              }
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 500,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshotFuture.data.length,
                itemBuilder: (context, index) => StreamBuilder<List<String>>(
                  initialData: const [],
                  stream: bloc.selectedItemStream,
                  builder: (context, snapshot) {

                    final List<String> selectedItems = [];
                    selectedItems.addAll(snapshot.data);

                    return Card(
                      color: (selectedItems.contains(snapshotFuture.data[index])) ? Colors.amber : Colors.white,
                      child: InkWell(
                        onTap : () {
                          if (selectedItems.contains(snapshotFuture.data[index])) {
                            bloc.removeItem(snapshotFuture.data[index]);
                          }
                          else {
                            bloc.addItem(snapshotFuture.data[index]);
                          }
                        },
                        child: Container(height: 100, width: 100, child: Text(snapshotFuture.data[index]),),
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        )
        : const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}