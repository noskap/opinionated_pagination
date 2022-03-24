import 'package:flutter_test/flutter_test.dart';
import 'package:opinionated_pagination/pagination.constants.dart';
import 'package:opinionated_pagination/pagination.service.dart';

void runTests() {
  for (int i = 0; i < page27Tests.length; i++) {
    final PageTest index = page27Tests[i];
    runTest(i + 1, index.page, index.expected, 27);
  }
  for (int i = 0; i < page11Tests.length; i++) {
    final PageTest index = page11Tests[i];
    runTest(i + 1, index.page, index.expected, 11);
  }
  for (int i = 0; i < page4Tests.length; i++) {
    final PageTest index = page4Tests[i];
    runTest(i + 1, index.page, index.expected, 4);
  }
  for (int i = 0; i < page7Tests.length; i++) {
    final PageTest index = page7Tests[i];
    runTest(i + 1, index.page, index.expected, 7);
  }
}

void runTest(int index, int paginationPage, List<String> expected, int numberOfPages) {
  test('Test $index', () {
    final List<String> test = PaginationService().getPageNumbers(
      paginationPage: paginationPage,
      numberOfPages: numberOfPages,
      testMode: true,
      onTap: (int? i) {},
    ) as List<String>;
    didPass(test, expected, index);
  });
}

final List<PageTest> page27Tests = [
  PageTest(page: 0, expected: ['1', '2', '3', '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 1, expected: [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 2, expected: [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 3, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 23, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 24, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name]),
  PageTest(page: 25, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name]),
  PageTest(page: 26, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', '25', '26', '27']),
];

final List<PageTest> page11Tests = [
  PageTest(page: 0, expected: [
    '1',
    '2',
    '3',
    '4',
    ButtonTypes.ellipsis.name,
    '11',
    ButtonTypes.right.name,
  ]),
  PageTest(page: 1, expected: [
    ButtonTypes.left.name,
    '1',
    '2',
    '3',
    ButtonTypes.ellipsis.name,
    '11',
    ButtonTypes.right.name,
  ]),
  PageTest(page: 2, expected: [
    ButtonTypes.left.name,
    '1',
    '2',
    '3',
    ButtonTypes.ellipsis.name,
    '11',
    ButtonTypes.right.name,
  ]),
  PageTest(page: 3, expected: [
    ButtonTypes.left.name,
    '1',
    ButtonTypes.ellipsis.name,
    '4',
    ButtonTypes.ellipsis.name,
    '11',
    ButtonTypes.right.name,
  ]),
  PageTest(page: 9, expected: [
    ButtonTypes.left.name,
    '1',
    ButtonTypes.ellipsis.name,
    '9',
    '10',
    '11',
    ButtonTypes.right.name,
  ]),
  PageTest(page: 10, expected: [
    ButtonTypes.left.name,
    '1',
    ButtonTypes.ellipsis.name,
    '8',
    '9',
    '10',
    '11',
  ]),
];

final List<PageTest> page4Tests = [
  PageTest(page: 0, expected: ['1', '2', '3', '4']),
  PageTest(page: 1, expected: ['1', '2', '3', '4']),
  PageTest(page: 2, expected: ['1', '2', '3', '4']),
  PageTest(page: 3, expected: ['1', '2', '3', '4']),
];
final List<PageTest> page7Tests = [
  PageTest(page: 0, expected: ['1', '2', '3', '4', '5', '6', '7']),
  PageTest(page: 1, expected: ['1', '2', '3', '4', '5', '6', '7']),
  PageTest(page: 2, expected: ['1', '2', '3', '4', '5', '6', '7']),
  PageTest(page: 3, expected: ['1', '2', '3', '4', '5', '6', '7']),
  PageTest(page: 4, expected: ['1', '2', '3', '4', '5', '6', '7']),
  PageTest(page: 5, expected: ['1', '2', '3', '4', '5', '6', '7']),
  PageTest(page: 6, expected: ['1', '2', '3', '4', '5', '6', '7']),
];

class PageTest {
  late final int page;
  late final List<String> expected;

  PageTest({required this.page, required this.expected});
}

List<bool> didPass(List<String> expected, List<String> result, int index) {
  List<bool> passed = [];
  for (int i = 0; i < expected.length; i++) {
    // if (expected[i] != result[i]) print('ERROR: Test $index: Case $i: ${result[i]} should be ${expected[i]}'); // For Debugging
    passed.add(expected[i] == result[i]);
    expect(expected[i], result[i], reason: 'Test $index: Case $i: ${result[i]} should be ${expected[i]}');
  }
  return passed;
}

void main() {
  runTests();
}
