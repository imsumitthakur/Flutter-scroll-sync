import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recharge/category_bloc.dart';
import 'package:recharge/recharge_category.dart';

const _backGroundColor = Color(0xFFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFF2BBEBA);
// const categoryHeight = 55.0;
// const productHeight = 110.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Recharge(),
    );
  }
}

class Recharge extends StatefulWidget {
  @override
  _RechargeState createState() => _RechargeState();
}

class _RechargeState extends State<Recharge>
    with SingleTickerProviderStateMixin {
  // TabController _tabController;
  final _bloc = CategoryBloc();

  @override
  void initState() {
    // _tabController = TabController(vsync: this, length: 10);
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                child: TabBar(
                  onTap: _bloc.onCategorySelected,
                  controller: _bloc.tabController,
                  isScrollable: true,
                  indicatorWeight: 0.2,
                  tabs: _bloc.tabs.map((e) => TabWidget(e)).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _bloc.scrollController,
                  itemCount: _bloc.items.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final item = _bloc.items[index];
                    if (item.isCategory) {
                      return CategoryWidgetItem(item.productCategory);
                    } else {
                      return ProductWidgetItem(item.product);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final CategoryTab categoryTab;

  const TabWidget(this.categoryTab);

  @override
  Widget build(BuildContext context) {
    final selected = categoryTab.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryTab.productCategory.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryWidgetItem extends StatelessWidget {
  const CategoryWidgetItem(this.productCategory);
  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHeight,
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Text(
        productCategory.name,
        style: TextStyle(
          color: _blueColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProductWidgetItem extends StatelessWidget {
  const ProductWidgetItem(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          elevation: 6,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Image.asset(product.image),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: _blueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.description,
                      maxLines: 2,
                      style: TextStyle(
                        color: _blueColor,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: _greenColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
