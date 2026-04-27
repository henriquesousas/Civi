import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/add_new.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/product_list_view.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/product_tabs.dart';
import 'package:flutter/material.dart';

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key});

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: DefaultAppBar(
          title: "Meus produtos",
          showBackButton: true,
          press: () {},
        ),
        body: const SafeArea(
          child: Column(
            children: [
              // TopDescription(),
              AddNew(),
              SizedBox(height: SizeSpacing.m),
              ProductTabs(),
              SizedBox(height: SizeSpacing.m),
              Expanded(
                child: TabBarView(
                  children: [
                    ProductListView(),
                    ProductListView(),
                    ProductListView(),
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
