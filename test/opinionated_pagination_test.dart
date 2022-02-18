import 'package:flutter_test/flutter_test.dart';
import 'package:opinionated_pagination/pagination.constants.dart';
import 'package:opinionated_pagination/pagination.service.dart';

void runTests() {
  for (int i = 0; i < tests.length; i++) {
    final PageTest index = tests[i];
    runTest(i + 1, index.page, index.expected);
  }
}

void runTest(int index, int paginationPage, List<String> expected) {
  test('Test $index', () {
    final List<String> test =
        PaginationService().getPageNumbers(paginationPage: paginationPage, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
    List<bool> passed = didPass(test, expected, index);

    // print('PAGINATION TEST $index *-*-*-*-* ${passed.every((element) => element == true)} $test');
  });
}

final List<PageTest> tests = [
  PageTest(page: 0, expected: ['1', '2', '3', '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 1, expected: [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 2, expected: [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 3, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 23, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name]),
  PageTest(page: 24, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name]),
  PageTest(page: 25, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name]),
  PageTest(page: 26, expected: [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', '25', '26', '27']),
];

class PageTest {
  late final int page;
  late final List<String> expected;

  PageTest({required this.page, required this.expected});
}

List<bool> didPass(List<String> test, List<String> expected, int index) {
  List<bool> passed = [];
  for (int i = 0; i < test.length; i++) {
    if (test[i] != expected[i]) print('ERROR: Test $index: Case $i: ${test[i]} should be ${expected[i]}');
    passed.add(test[i] == expected[i]);
    expect(test[i], expected[i], reason: 'Test $index: Case $i: ${test[i]} should be ${expected[i]}');
  }
  return passed;
}

void main() {
  runTests();
  // test('', () {
  // final calculator = PaginationService();
  // final List<String> test1 = calculator.getPageNumbers(paginationPage: 0, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected1 = ['1', '2', '3', '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name];
  // final List<String> test2 = calculator.getPageNumbers(paginationPage: 1, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected2 = [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name];
  // final List<String> test3 = calculator.getPageNumbers(paginationPage: 2, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected3 = [ButtonTypes.left.name, '1', '2', '3', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name];
  // final List<String> test4 = calculator.getPageNumbers(paginationPage: 3, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected4 = [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '4', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name];
  // final List<String> test5 = calculator.getPageNumbers(paginationPage: 23, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected5 = [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', ButtonTypes.ellipsis.name, '27', ButtonTypes.right.name];
  // final List<String> test6 = calculator.getPageNumbers(paginationPage: 24, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected6 = [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name];
  // final List<String> test7 = calculator.getPageNumbers(paginationPage: 25, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected7 = [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '25', '26', '27', ButtonTypes.right.name];
  // final List<String> test8 = calculator.getPageNumbers(paginationPage: 26, numberOfPages: 27, testMode: true, onTap: () {}) as List<String>;
  // final expected8 = [ButtonTypes.left.name, '1', ButtonTypes.ellipsis.name, '24', '25', '26', '27'];
  // });
}
