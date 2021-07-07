class ProductCategory {
  final String? name;
  final List<Product>? products;

  const ProductCategory({
    this.name,
    this.products,
  });
}

class Product {
  final String? name;
  final String? description;
  final double? price;
  final String? image;

  const Product({
    this.name,
    this.description,
    this.price,
    this.image,
  });
}

const categories = [
  ProductCategory(
    name: "POPULAR PLANS",
    products: [
      Product(
        name: 'df',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 299.00,
      ),
      Product(
        name: 'df',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'df',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'df',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
    ],
  ),
  ProductCategory(
    name: "NO DAILY LIMIT",
    products: [
      Product(
        name: 'Awsome p2 ',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'dSumitf',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'Amodcs',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'ktirt',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
    ],
  ),
  ProductCategory(
    name: "4G DATA",
    products: [
      Product(
        name: '34545',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'dfgdfg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'Samiksha',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'ddfsdy3f',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
    ],
  ),
  ProductCategory(
    name: "INTL ROAMING",
    products: [
      Product(
        name: '34545',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'dfgdfg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'Samiksha',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'ddfsdy3f',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
    ],
  ),
  ProductCategory(
    name: "ISD",
    products: [
      Product(
        name: '34545',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'dfgdfg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'Samiksha',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
      Product(
        name: 'ddfsdy3f',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        price: 20.00,
      ),
    ],
  ),
];
