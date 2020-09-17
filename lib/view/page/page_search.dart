part of 'page.dart';

class SearchPage extends Page<SearchBloc> {

  @override
  void dispose() {
  }

  @override
  void init() {
  }

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6),
                child: TextField(
                  focusNode: _searchNode, 
                  controller: _searchController,
                  onSubmitted:(value) {

                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white
                  ),
                ),
              )
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.switchSearch();
          if (_searchNode.hasFocus) {
            _searchNode.unfocus();
          }
          else {
            _searchNode.requestFocus();
          }
        },
        backgroundColor: mainColor,
        elevation: 0,
        highlightElevation: 0,
        child: StreamBuilder<bool>(
          initialData: false,
          stream: bloc.searchStream,
          builder: (context, snapshot) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            child: (snapshot.data) ? const Icon(Icons.close) : const Icon(Icons.search),
          )
        ),
      ),
    );
  }
}