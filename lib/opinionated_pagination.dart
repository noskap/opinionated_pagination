import 'package:flutter/material.dart';
import './pagination.constants.dart';
import './pagination.service.dart';

class OpinionatedPagination extends StatelessWidget {
  final int totalItems;
  final int pageNumber;
  final int skip;
  final int limit;
  final Function(int) onPageChanged;

  const OpinionatedPagination(
      {required this.pageNumber,
      required this.totalItems,
      required this.skip,
      required this.limit,
      required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    List<Widget> row = [];
    int numberOfPages = (totalItems / limit).ceil();

    // If numberOfPages is less than totalButtons, no pagination controls are needed
    if (numberOfPages <= PaginationConstants.totalButtons) {
      for (int i = 0; i < numberOfPages; i++) {
        row.add(PaginationConstants.numberButton(
            i: i,
            numberOfPages: numberOfPages,
            pageNumber: pageNumber,
            onTap: onPageChanged));
      }
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: row);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: PaginationService().getPageNumbers(
          paginationPage: pageNumber,
          numberOfPages: numberOfPages,
          skip: skip,
          limit: limit,
          onTap: onPageChanged,
        ) as List<Widget>,
      );
    }
  }
}
