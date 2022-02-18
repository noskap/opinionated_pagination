import 'package:flutter/material.dart';
import 'package:opinionated_pagination/pagination.constants.dart';

class PaginationService {
  void runTests() {
    for (int i = 0; i < PaginationConstants.tests.length; i++) {
      final PageTest index = PaginationConstants.tests[i];
      runTest(i + 1, index.page, index.expected);
    }
  }

  void runTest(int index, int paginationPage, List<String> expected) {
    final List<String> test = getPageNumbers(paginationPage: paginationPage, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
    List<bool> passed4 = didPass(test, expected, index);

    print('PAGINATION TEST $index *-*-*-*-* ${passed4.every((element) => element == true)} $test');
  }

  List<bool> didPass(List<String> test, List<String> expected, int index) {
    List<bool> passed = [];
    for (int i = 0; i < test.length; i++) {
      if (test[i] != expected[i]) print('ERROR: Test $index: Case $i: ${test[i]} should be ${expected[i]}');
      passed.add(test[i] == expected[i]);
    }
    return passed;
  }

  List getPageNumbers({
    required int paginationPage,
    required int numberOfPages,
    bool testMode = false,
    int? skip,
    int? limit,
    required Function onTap,
  }) {
    if (testMode == false) {
      assert(skip != null);
      assert(limit != null);
    }
    List<Widget> row = [];
    List<String> rowNames = []; // For testing

    addRow({required ButtonTypes type, required int pageNumber, required int i}) {
      Widget rowToAdd;
      String rowToAddTest;
      switch (type) {
        case ButtonTypes.left:
          rowToAddTest = ButtonTypes.left.name;
          rowToAdd = PaginationConstants.leftButton(pageNumber: i, skip: skip, limit: limit, onTap: onTap());
          break;
        case ButtonTypes.ellipsis:
          rowToAddTest = ButtonTypes.ellipsis.name;
          rowToAdd = PaginationConstants.ellipsisButton(pageNumber: pageNumber, numberOfPages: numberOfPages, skip: skip, limit: limit, onTap: onTap());
          break;
        case ButtonTypes.right:
          rowToAddTest = ButtonTypes.right.name;
          rowToAdd = PaginationConstants.rightButton(skip: skip, limit: limit, onTap: onTap());
          break;

        case ButtonTypes.number:
          rowToAddTest = '${pageNumber + 1}';
          rowToAdd = PaginationConstants.numberButton(pageNumber: pageNumber, numberOfPages: numberOfPages, i: i, skip: skip, limit: limit, onTap: onTap());
          break;
      }
      rowNames.add(rowToAddTest);
      row.add(rowToAdd);
    }

    for (int i = 0; i < PaginationConstants.totalButtons; i++) {
      switch (i) {
        case 0:
          int pageNumber = i;
          if (paginationPage > 0 && i != 5) {
            pageNumber = i - 1;
          } else if (i == 5) {
            pageNumber = numberOfPages - 1;
          }
          addRow(type: paginationPage > 0 ? ButtonTypes.left : ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
        case 1:
          int pageNumber = i;
          if (paginationPage > 1) {
            pageNumber = 0;
          } else if (paginationPage == 2) {
            pageNumber = paginationPage;
          } else if (paginationPage > 0 && i != 5) {
            pageNumber = i - 1;
          } else if (i == 5) {
            pageNumber = numberOfPages - 1;
          }
          addRow(type: ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
        case 2:
          int pageNumber = i;
          if (paginationPage > 2) {
            pageNumber = paginationPage - 1;
            if (paginationPage == (numberOfPages - 1)) {
              pageNumber = numberOfPages - 5;
            } else if (paginationPage > (numberOfPages - 4)) {
              pageNumber = numberOfPages - 4;
            }
          } else if (paginationPage > 0 && i != 5) {
            pageNumber = i - 1;
          } else if (i == 5) {
            pageNumber = numberOfPages - 1;
          }
          addRow(type: paginationPage > 2 ? ButtonTypes.ellipsis : ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
        case 3:
          int pageNumber = paginationPage;
          if ((paginationPage > 3 && paginationPage < (numberOfPages - 3)) || paginationPage == (numberOfPages - 3)) {
            pageNumber = paginationPage;
          } else if (paginationPage == 0) {
            pageNumber = 3;
          } else if (paginationPage == 1) {
            pageNumber = 2;
          } else if (paginationPage == 2) {
            pageNumber = 2;
          } else if (paginationPage == (numberOfPages - 0)) {
            pageNumber = numberOfPages - 4;
          } else if (paginationPage == (numberOfPages - 1)) {
            pageNumber = numberOfPages - 4;
          } else if (paginationPage == (numberOfPages - 2)) {
            pageNumber = numberOfPages - 3;
          } else if (paginationPage > 0) {
            pageNumber = paginationPage;
          }

          addRow(type: ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
        case 4:
          int pageNumber = paginationPage + 1;
          if (paginationPage < (numberOfPages - 3)) {
            if (paginationPage == 0) {
              pageNumber = 4;
            } else if (paginationPage < 3) {
              pageNumber = 3;
            }
          } else {
            pageNumber = paginationPage;
            if (paginationPage == (numberOfPages - 1)) {
              pageNumber = paginationPage - 2;
            } else if (paginationPage == (numberOfPages - 2)) {
              pageNumber = paginationPage;
            } else if (paginationPage == (numberOfPages - 3)) {
              pageNumber = paginationPage + 1;
            } else if (paginationPage < numberOfPages) {
              pageNumber = paginationPage;
            }
          }
          addRow(type: paginationPage < (numberOfPages - 3) ? ButtonTypes.ellipsis : ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
        case 5:
          int pageNumber = paginationPage + 2;
          if (paginationPage == (numberOfPages - 1)) {
            pageNumber = paginationPage - 1;
          } else if (paginationPage == (numberOfPages - 2)) {
            pageNumber = paginationPage + 1;
          } else if (paginationPage > 0 && i != 5) {
            pageNumber = i - 1;
          } else if (i == 5) {
            pageNumber = numberOfPages - 1;
          }
          addRow(type: ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
        case 6:
          int pageNumber = paginationPage;
          if (paginationPage > (numberOfPages - 4)) {
            pageNumber = paginationPage;
          } else if (paginationPage > 0 && i != 5) {
            pageNumber = i - 1;
          } else if (i == 5) {
            pageNumber = numberOfPages - 1;
          }
          addRow(type: paginationPage < (numberOfPages - 1) ? ButtonTypes.right : ButtonTypes.number, pageNumber: pageNumber, i: i);
          break;
      }
    }
    return testMode ? rowNames : row;
  }
}
