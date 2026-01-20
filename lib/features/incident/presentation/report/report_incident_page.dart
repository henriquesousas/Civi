import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/incident/presentation/providers/report_incident_event_provider.dart';
import 'package:deehelp/features/incident/presentation/providers/report_incident_viewmodel_provider.dart';
import 'package:deehelp/features/incident/presentation/report/events/report_incident_event.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/register/report_incident_card_detailed.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/register/report_incident_card_immediately.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/register/card_select_image.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/error/incident_error_overlay.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/register/report_incident_warning_indicator.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/register/report_incident_loading_progress_overlay.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReportIncidentPage extends ConsumerStatefulWidget {
  const ReportIncidentPage({super.key});

  @override
  ConsumerState<ReportIncidentPage> createState() => _AddIncidentPageState();
}

class _AddIncidentPageState extends ConsumerState<ReportIncidentPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    LocationService().getCurrentLocation().then(
      (place) {
        if (!mounted) return null;
        if (place == null) return null;
        ref
            .read(reportIncidentViewmodelProvider.notifier)
            .addCurrentPlace(place);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportIncidentViewmodelProvider);
    final viewModel = ref.watch(reportIncidentViewmodelProvider.notifier);

    ref.listen(
      reportIncidentEventProvider,
      (previous, event) {
        if (event == null) return;
        event.when(error: (error) {
          if (context.canPop()) {
            context.pop();
          }
          showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.transparent,
            pageBuilder: (_, __, ___) => IncidentErrorOverlay(onRetry: () {
              if (context.canPop()) {
                context.pop();
              }
            }),
          );
        }, loadProgress: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.transparent,
            pageBuilder: (_, __, ___) =>
                const ReportIncidentLoadingProgressOverlay(),
          );
        }, successfully: () {
          if (context.canPop()) {
            context.pop();
          }
          context.pushReplacement(AppRouter.reportIncidentSuccess);
        });
      },
    );

    return UICustomScaffold(
      pageTitle: "Registrar incidente",
      onBackButtonTap: () {
        ref.invalidate(reportIncidentViewmodelProvider);
        context.pop();
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    CardSelectImage(
                      product: state.product,
                      press: () async {
                        final product = await context.push<Product?>(
                          AppRouter.myProducts,
                          extra: {ProductListingPage.isAddIncidentKey: true},
                        );
                        if (product != null) {
                          viewModel.selectProduct(product);
                        }
                      },
                    ),
                    const ReportIncidentCardImmediately(),
                    const ReportIncidentCardDetailed(),
                    const Spacer(),
                    const ReportIncidentWarningIndicator(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
