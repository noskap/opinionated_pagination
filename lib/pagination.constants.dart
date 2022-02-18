import 'package:flutter/material.dart';

class PaginationConstants {
  static String ellipsis = '...';

  static const int totalButtons = 7;

  static Icon arrowIcon(IconData icon) => Icon(icon, color: Colors.black, size: 15.0);

  static GestureDetector leftButton({required int pageNumber, int? skip, int? limit, bool testMode = false, required Function onTap}) {
    return GestureDetector(
      onTap: onTap(),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(children: [arrowIcon(Icons.arrow_back_ios), _thing]),
      ),
    );
  }

  static const _thing = SizedBox(height: 2.0);
  static const _style = TextStyle(color: Colors.black);

  static GestureDetector ellipsisButton({
    required int pageNumber,
    required int numberOfPages,
    required Function onTap,
    int? skip,
    int? limit,
    bool testMode = false,
  }) {
    return GestureDetector(
      onTap: onTap(),
      child: Padding(
        padding: EdgeInsets.only(right: pageNumber < numberOfPages ? 10.0 : 0),
        child: Column(
          children: [
            Text(ellipsis, style: _style),
            _thing,
            pageNumber == skip ? Container(height: 2, width: 14.0, color: Colors.black) : Container(height: 2),
          ],
        ),
      ),
    );
  }

  static GestureDetector rightButton({required Function onTap, int? skip, int? limit, bool testMode = false}) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(children: [arrowIcon(Icons.arrow_forward_ios), _thing]),
    );
  }

  static GestureDetector numberButton({
    required int pageNumber,
    required int numberOfPages,
    required int i,
    int? skip,
    required Function onTap,
    int? limit,
    bool testMode = false,
  }) {
    return GestureDetector(
      onTap: onTap(),
      child: Padding(
        padding: EdgeInsets.only(right: i < numberOfPages ? 10.0 : 0),
        child: Column(
          children: [
            Text((pageNumber + 1).toString().padLeft(2, '0'), style: _style),
            _thing,
            pageNumber == skip ? Container(height: 2, width: 14.0, color: Colors.black) : Container(height: 2),
          ],
        ),
      ),
    );
  }

  static final List<PageTest> tests = [
    PageTest(page: 0, expected: ['1', '2', '3', '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
    PageTest(page: 1, expected: [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
    PageTest(page: 2, expected: [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
    PageTest(page: 3, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
    PageTest(page: 23, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
    PageTest(page: 24, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name]),
    PageTest(page: 25, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name]),
    PageTest(page: 26, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', '25', '26', '27']),
  ];
}

class PageTest {
  late final int page;
  late final List<String> expected;

  PageTest({required this.page, required this.expected});
}

enum ButtonTypes {
  left,
  ellipsis,
  right,
  number,
}
