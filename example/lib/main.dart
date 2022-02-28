import 'package:flutter/material.dart';
import 'package:opinionated_pagination/opinionated_pagination.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Opinionated Pagination Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int paginationPage = 0;
  final int limit = 5;
  final int itemCount = 120;

  @override
  Widget build(BuildContext context) {
    // final page = ref.watch(paginationPageProvider);
    final _pageGroupEnd = (paginationPage + 1) * limit;
    final _pageGroupStart = _pageGroupEnd - (limit - 1);
    return Scaffold(appBar: AppBar(title: Text('Opinionated Pagination Example'),),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Showing $_pageGroupStart to ${_pageGroupEnd > itemCount ? itemCount : _pageGroupEnd} of $itemCount'),
              ],
            ),
            Divider(height: 22.0, thickness: 1.0, color: Colors.grey.shade300),
            OpinionatedPagination(
              pageNumber: paginationPage,
              totalItems: itemCount,
              skip: paginationPage,
              limit: limit,
              onPageChanged: (int? i) {
                if (i != null) {
                  // ref.read(paginationPageProvider.state).state = i;
                  setState(() {
                    paginationPage = i;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
