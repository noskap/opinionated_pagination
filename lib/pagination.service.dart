import 'package:flutter/material.dart';
import './pagination.constants.dart';

class PaginationService {
  // Returns List<String> if testMode is true, otherwise List<Widget>
  List getPageNumbers({
    required int paginationPage,
    required int numberOfPages,
    bool testMode = false,
    int? skip,
    int? limit,
    required Function(int) onTap,
  }) {
    if (testMode == false) {
      assert(skip != null);
      assert(limit != null);
    }
    List<Widget> row = [];
    List<String> rowNames = []; // For testing

    void addRow(
        {required ButtonTypes type, required int pageNumber, required int i}) {
      Widget rowToAdd;
      String rowToAddTest;
      switch (type) {
        case ButtonTypes.left:
          rowToAddTest = type.name;
          rowToAdd = PaginationConstants.leftButton(
              pageNumber: pageNumber, onTap: onTap);
          break;
        case ButtonTypes.ellipsis:
          rowToAddTest = type.name;
          rowToAdd = PaginationConstants.ellipsisButton(
              pageNumber: pageNumber,
              numberOfPages: numberOfPages,
              skip: skip,
              onTap: onTap);
          break;
        case ButtonTypes.right:
          rowToAddTest = type.name;
          rowToAdd = PaginationConstants.rightButton(
              pageNumber: pageNumber, onTap: onTap);
          break;

        case ButtonTypes.number:
          rowToAddTest = '${pageNumber + 1}';
          rowToAdd = PaginationConstants.numberButton(
              pageNumber: pageNumber,
              numberOfPages: numberOfPages,
              i: i,
              skip: skip,
              onTap: onTap);
          break;
      }
      rowNames.add(rowToAddTest);
      row.add(rowToAdd);
    }

    // If numberOfPages is less than totalButtons, no pagination controls are needed
    if (numberOfPages <= PaginationConstants.totalButtons) {
      for (int i = 0; i < numberOfPages; i++) {
        addRow(type: ButtonTypes.number, pageNumber: i, i: i);
      }
    } else {
      for (int i = 0; i < PaginationConstants.totalButtons; i++) {
        switch (i) {
          case 0:
            addRow(
                type:
                    paginationPage > 0 ? ButtonTypes.left : ButtonTypes.number,
                pageNumber: paginationPage,
                i: i);
            break;
          case 1:
            int pageNumber = i;
            if (paginationPage > 1) {
              pageNumber = 0;
            } else if (paginationPage > 0 && i != 5) {
              pageNumber = i - 1;
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
            }
            addRow(
                type: paginationPage > 2
                    ? ButtonTypes.ellipsis
                    : ButtonTypes.number,
                pageNumber: pageNumber,
                i: i);
            break;
          case 3:
            int pageNumber = paginationPage;
            if (paginationPage == 0) {
              pageNumber = i;
            } else if (paginationPage == 1 || paginationPage == 2) {
              pageNumber = 2;
            } else if (paginationPage == (numberOfPages - 1)) {
              pageNumber = numberOfPages - 4;
            } else if (paginationPage == (numberOfPages - 2)) {
              pageNumber = numberOfPages - 3;
            }
            addRow(type: ButtonTypes.number, pageNumber: pageNumber, i: i);
            break;
          case 4:
            int pageNumber = paginationPage;
            if (paginationPage < (numberOfPages - 3)) {
              pageNumber = paginationPage + 1;
              if (paginationPage == 0) {
                pageNumber = i;
              } else if (paginationPage < 3) {
                pageNumber = 3;
              }
            } else if (paginationPage == (numberOfPages - 1)) {
              pageNumber = paginationPage - 2;
            } else if (paginationPage == (numberOfPages - 2)) {
              pageNumber = paginationPage;
            } else if (paginationPage == (numberOfPages - 3)) {
              pageNumber = paginationPage + 1;
            }
            addRow(
                type: paginationPage < (numberOfPages - 3)
                    ? ButtonTypes.ellipsis
                    : ButtonTypes.number,
                pageNumber: pageNumber,
                i: i);
            break;
          case 5:
            int pageNumber = paginationPage + 2;
            if (paginationPage == (numberOfPages - 1)) {
              pageNumber = paginationPage - 1;
            } else if (paginationPage == (numberOfPages - 2)) {
              pageNumber = paginationPage + 1;
            } else if (i == 5) {
              pageNumber = numberOfPages - 1;
            }
            addRow(type: ButtonTypes.number, pageNumber: pageNumber, i: i);
            break;
          case 6:
            addRow(
                type: paginationPage < (numberOfPages - 1)
                    ? ButtonTypes.right
                    : ButtonTypes.number,
                pageNumber: paginationPage,
                i: i);
            break;
        }
      }
    }
    return testMode ? rowNames : row;
  }
}
