part of 'bloc.dart';

class TestBloc {

  final BehaviorSubject<List<String>> _selectedItemController = BehaviorSubject();
  Stream<List<String>> get selectedItemStream => _selectedItemController.stream;

  final List<String> _selectedItem = [];
  List<String> get selectedItem => _selectedItem;

  Future<List<String>> getItems() async {
    return Future<List<String>>.delayed(const Duration(seconds: 3))
      .then((value) => List.generate(20, (index) => '$index'));
  }

  void addItem(String name) {
    _selectedItem.add(name);
    _selectedItemController.sink.add(_selectedItem);
  }

  void removeItem(String name) {
    _selectedItem.remove(name);
    _selectedItemController.sink.add(_selectedItem);
  }
}