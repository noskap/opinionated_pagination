This is a pagination library that:

- manages your pagination navigation for you
- automatically calculates what page you are on, and what buttons to show
- is very lightweight and generic
- supports all Flutter platforms
- works with any state management solution
- is very opinionated

## Getting started

1. Install the package: `flutter pub add opinionated_pagination`
2. Have at it

## Usage

Basic example using `setState`

```dart
int paginationPage = 0;
final int limit = 5;
final int itemCount = 120;
final _pageGroupEnd = (paginationPage + 1) * limit;
final _pageGroupStart = _pageGroupEnd - (limit - 1);
var widget = OpinionatedPagination(
  pageNumber: paginationPage,
  totalItems: itemCount,
  skip: paginationPage,
  limit: limit,
  onPageChanged: (int? i) {
    if (i != null) {
      setState(() {
        paginationPage = i;
      });
    }
  },
);
```
A more fully formed example can be found on the [example](https://pub.dev/packages/opinionated_pagination/example) page
