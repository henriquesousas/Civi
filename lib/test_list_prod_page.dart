import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProductStatus {
  approved,
  pending,
  canceled,
}

enum ProductType {
  car,
  motorcycle,
  phone,
}

class ProductItem {
  final String title;
  final String subtitle;
  final ProductStatus status;
  final ProductType type;

  const ProductItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.type,
  });
}

const allProducts = [
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'CG Titan 150',
    subtitle: 'Vermelha • 2018 • ABC-1234',
    status: ProductStatus.pending,
    type: ProductType.motorcycle,
  ),
  ProductItem(
    title: 'iPhone 13',
    subtitle: 'Azul • IMEI cadastrado',
    status: ProductStatus.canceled,
    type: ProductType.phone,
  ),
];

class TestListProdPage extends StatelessWidget {
  const TestListProdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF050505),
        body: SafeArea(
          child: Column(
            children: const [
              _Header(),
              _Description(),
              // _ProductTabs(),
              Expanded(
                child: TabBarView(
                  children: [
                    _ProductList(status: ProductStatus.approved),
                    _ProductList(status: ProductStatus.pending),
                    _ProductList(status: ProductStatus.canceled),
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Meus itens',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
          Positioned(
            left: 6,
            child: IconButton(
              splashRadius: 22,
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(.05),
        ),
      ),
      child: Text(
        'Cadastre veículos e celulares para acompanhar ocorrências e receber alertas rapidamente.',
        style: TextStyle(
          color: Colors.white.withOpacity(.62),
          fontSize: 13,
          height: 1.45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ProductTabs extends StatelessWidget {
  const _ProductTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white60,
        labelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
        tabs: const [
          Tab(text: 'APROVADOS'),
          Tab(text: 'PENDENTES'),
          Tab(text: 'CANCELADOS'),
        ],
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final ProductStatus status;

  const _ProductList({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final products =
        allProducts.where((product) => product.status == status).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      children: [
        const _AddProductTile(),
        const SizedBox(height: 12),
        if (products.isEmpty)
          const _EmptyProducts()
        else
          ...products.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _ProductTile(
                title: product.title,
                subtitle: product.subtitle,
                type: product.type,
                status: product.status,
              ),
            ),
          ),
      ],
    );
  }
}

class _AddProductTile extends StatelessWidget {
  const _AddProductTile();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF111111),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Container(
          height: 74,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Adicionar item',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 16,
                color: Colors.white.withOpacity(.35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final ProductType type;
  final ProductStatus status;

  const _ProductTile({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.status,
  });

  String get imageUrl {
    switch (type) {
      case ProductType.car:
        return 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200';

      case ProductType.motorcycle:
        return 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?q=80&w=1200';

      case ProductType.phone:
        return 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200';
    }
  }

  Color get statusColor {
    switch (status) {
      case ProductStatus.approved:
        return const Color(0xFF31D67B);

      case ProductStatus.pending:
        return const Color(0xFFFFB547);

      case ProductStatus.canceled:
        return const Color(0xFFFF6262);
    }
  }

  String get statusText {
    switch (status) {
      case ProductStatus.approved:
        return 'Aprovado';

      case ProductStatus.pending:
        return 'Pendente';

      case ProductStatus.canceled:
        return 'Cancelado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF111111),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Container(
          height: 86,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              /// IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              /// CONTENT
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.52),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(.12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.more_horiz_rounded,
                color: Colors.white.withOpacity(.30),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyProducts extends StatelessWidget {
  const _EmptyProducts();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Center(
        child: Text(
          'Nenhum item encontrado.',
          style: TextStyle(
            color: Colors.white.withOpacity(.45),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
