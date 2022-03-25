import 'package:flutter/material.dart';
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
    int numberOfPages = (totalItems / limit).ceil();

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
