
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recharge/recharge_category.dart';

const categoryHeight = 55.0;
const productHeight = 110.0;

class CategoryBloc with ChangeNotifier {
  List<CategoryTab> tabs = [];
  List<Item> items = [];
  TabController tabController;
  ScrollController scrollController = ScrollController();
  bool _listen = true;

  void init(TickerProvider tickerProvider) {
    tabController =
        TabController(vsync: tickerProvider, length: categories.length);

    double offsetFrom = 0.0;
    double offsetTo = 0.0;

    for (int i = 0; i < categories.length; i++) {
      final category = categories[i];

      if (i > 0) {
        offsetFrom += categories[i - 1].products.length * productHeight;
      }

      if (i < categories.length - 1) {
        offsetTo =
            offsetFrom + categories[i + 1].products.length * productHeight;
      } else {
        offsetTo = double.infinity;
      }

      tabs.add(
        CategoryTab(
          productCategory: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetFrom,
          offsetTo: offsetTo,
        ),
      );

      items.add(Item(productCategory: category));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(Item(product: product));
      }
    }

    scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    if (_listen) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];
        if (scrollController.offset >= tab.offsetFrom &&
            scrollController.offset <= tab.offsetTo &&
            !tab.selected) {
          onCategorySelected(i, animationRequired: false);
          tabController.animateTo(i);
          break;
        }
      }
    }
  }

  void onCategorySelected(int index, {bool animationRequired = true}) async {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      final condition =
          selected.productCategory.name == tabs[i].productCategory.name;
      tabs[i] = tabs[i].copyWith(
        condition,
      );
    }
    notifyListeners();

    if (animationRequired) {
      _listen = false;
      await scrollController.animateTo(
        selected.offsetFrom,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      _listen = true;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }
}

class CategoryTab {
  final ProductCategory productCategory;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;

  CategoryTab({
    @required this.productCategory,
    @required this.selected,
    @required this.offsetFrom,
    @required this.offsetTo,
  });

  CategoryTab copyWith(bool selected) => CategoryTab(
        productCategory: productCategory,
        selected: selected,
        offsetFrom: offsetFrom,
        offsetTo: offsetTo,
      );
}

class Item {
  const Item({
    this.productCategory,
    this.product,
  });

  final ProductCategory productCategory;
  final Product product;

  bool get isCategory => productCategory != null;
}
