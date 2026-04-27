import 'package:flutter/material.dart';

enum ProductStatus {
  approved,
  pending,
  canceled,
}

class ProductItem {
  final String title;
  final String subtitle;
  final ProductStatus status;
  final IconData icon;

  const ProductItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
  });
}

const allProducts = [
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    icon: Icons.directions_car_rounded,
  ),
  ProductItem(
    title: 'CG Titan 150',
    subtitle: 'Vermelha • 2018 • ABC-1234',
    status: ProductStatus.pending,
    icon: Icons.two_wheeler_rounded,
  ),
  ProductItem(
    title: 'iPhone 13',
    subtitle: 'Azul • IMEI cadastrado',
    status: ProductStatus.canceled,
    icon: Icons.phone_iphone_rounded,
  ),
];

class TestListProdPage extends StatelessWidget {
  const TestListProdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: const [
              _Header(),
              _Description(),
              _ProductTabs(),
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

class _ProductTabs extends StatelessWidget {
  const _ProductTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.10),
          ),
        ),
      ),
      child: TabBar(
        isScrollable: false,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        labelPadding: const EdgeInsets.only(right: 10),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white70,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 15,
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
      children: [
        const _AddProductTile(),
        if (products.isEmpty)
          const _EmptyProducts()
        else
          ...products.map(
            (product) => _ProductTile(
              title: product.title,
              subtitle: product.subtitle,
              icon: product.icon,
              status: product.status,
            ),
          ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Meus itens',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Positioned(
            left: 20,
            child: IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 26,
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
      height: 82,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 26),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.white.withOpacity(0.10),
          ),
        ),
      ),
      child: Text(
        'Cadastre carros, motos e celulares para acompanhar ocorrências e receber alertas rapidamente.',
        style: TextStyle(
          color: Colors.white.withOpacity(0.66),
          fontSize: 17,
          height: 1.35,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _StatusFilter extends StatelessWidget {
  final ProductStatus selectedStatus;
  final ValueChanged<ProductStatus> onChanged;

  const _StatusFilter({
    required this.selectedStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _StatusChip(
              label: 'Aprovados',
              selected: selectedStatus == ProductStatus.approved,
              onTap: () => onChanged(ProductStatus.approved),
            ),
            _StatusChip(
              label: 'Pendentes',
              selected: selectedStatus == ProductStatus.pending,
              onTap: () => onChanged(ProductStatus.pending),
            ),
            _StatusChip(
              label: 'Cancelados',
              selected: selectedStatus == ProductStatus.canceled,
              onTap: () => onChanged(ProductStatus.canceled),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _StatusChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: selected ? Colors.white : const Color(0xFF181818),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white.withOpacity(0.10),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white.withOpacity(0.72),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _AddProductTile extends StatelessWidget {
  const _AddProductTile();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 108,
        padding: const EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.10),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.black,
                size: 42,
              ),
            ),
            const SizedBox(width: 22),
            const Text(
              'Adicionar item',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ProductStatus status;

  const _ProductTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      padding: const EdgeInsets.symmetric(horizontal: 26),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.10),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              color: Color(0xFF181818),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.58),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_horiz_rounded,
            color: Colors.white.withOpacity(0.55),
            size: 30,
          ),
        ],
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
            color: Colors.white.withOpacity(0.55),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
