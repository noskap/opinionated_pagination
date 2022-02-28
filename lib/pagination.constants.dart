import 'package:flutter/material.dart';

enum ButtonTypes {
  left,
  ellipsis,
  right,
  number,
}

class PaginationConstants {
  static String ellipsis = '...';

  static const int totalButtons = 7;

  static Icon arrowIcon(IconData icon) =>
      Icon(icon, color: Colors.black, size: 15.0);

  static const _thing = SizedBox(height: 2.0);
  static const _style = TextStyle(color: Colors.black);

  static GestureDetector leftButton(
      {required int pageNumber, required Function(int) onTap}) {
    return GestureDetector(
      onTap: () => onTap(pageNumber - 1),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(children: [arrowIcon(Icons.arrow_back_ios), _thing]),
      ),
    );
  }

  static GestureDetector ellipsisButton(
      {required int pageNumber,
      required int numberOfPages,
      required Function(int) onTap,
      int? skip}) {
    return GestureDetector(
      onTap: () => onTap(pageNumber),
      child: Padding(
        padding: EdgeInsets.only(right: pageNumber < numberOfPages ? 10.0 : 0),
        child: Column(
          children: [
            Text(ellipsis, style: _style),
            _thing,
            pageNumber == skip
                ? Container(height: 2, width: 14.0, color: Colors.black)
                : Container(height: 2),
          ],
        ),
      ),
    );
  }

  static GestureDetector rightButton(
      {required int pageNumber, required Function(int) onTap}) {
    return GestureDetector(
      onTap: () => onTap(pageNumber + 1),
      child: Column(children: [arrowIcon(Icons.arrow_forward_ios), _thing]),
    );
  }

  static GestureDetector numberButton({
    required int pageNumber,
    required int numberOfPages,
    required int i,
    int? skip,
    required Function(int) onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(pageNumber),
      child: Padding(
        padding: EdgeInsets.only(right: i < numberOfPages ? 10.0 : 0),
        child: Column(
          children: [
            Text((pageNumber + 1).toString().padLeft(2, '0'), style: _style),
            _thing,
            pageNumber == skip
                ? Container(height: 2, width: 14.0, color: Colors.black)
                : Container(height: 2),
          ],
        ),
      ),
    );
  }
}
