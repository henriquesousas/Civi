// import 'package:deehelp/core/animation/fade_slide_transition_animator.dart';
// import 'package:deehelp/core/components/buttons/ui_outline_button.dart';
// import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
// import 'package:deehelp/core/components/ui_app_bar.dart';
// import 'package:deehelp/core/extensions/context_extension.dart';
// import 'package:deehelp/core/theme/app_colors.dart';
// import 'package:deehelp/features/my_products/presentation/create/steps/step_add_photo_page.dart';
// import 'package:deehelp/features/my_products/presentation/create/steps/step_item_detail_page.dart';
// import 'package:deehelp/features/my_products/presentation/create/steps/step_summary_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/components/buttons/ui_primary_button.dart';
// import '../../../../core/components/loader/loading.dart';
// import '../../../../core/ui/localization/resources.dart';
// import '../../../../core/router/router_constants.dart';
// import '../../../../core/widgets/progress_indicator/step_indicator.dart';
// import 'bloc/create_item_bloc.dart';
// import 'bloc/item_event.dart';
// import 'bloc/item_state.dart';
// import 'steps/step_choose_type_page.dart';
// import 'steps/step_obs_page.dart';

// enum ItemStep {
//   type,
//   details,
//   obs,
//   photo,
//   summary,
// }

// class CreateItemPage extends StatefulWidget {
//   const CreateItemPage({super.key});

//   @override
//   State<CreateItemPage> createState() => _CreateItemPageState();
// }

// class _CreateItemPageState extends State<CreateItemPage> {
//   int _currentStepIndex = 0;
//   bool _isNavigateLastPage = false;

//   ItemStep get _currentStep => ItemStep.values[_currentStepIndex];
//   final PageController _pageController = PageController();

//   @override
//   void initState() {
//     super.initState();
//     context.read<CreateItemBloc>().add(LoadItemsEvent());
//   }

//   void _previous() {
//     context.read<CreateItemBloc>().add(ChangePageEvent(page: -1));
//     if (_currentStepIndex > 0) {
//       setState(() => _currentStepIndex--);
//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _next() {
//     if (_isNavigateLastPage) {
//       _navigateLastPage();
//       return;
//     }
//     if (_currentStepIndex < ItemStep.values.length - 1) {
//       setState(() => _currentStepIndex++);
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _save(ItemState state) {
//     context.read<CreateItemBloc>().add(
//           UploadImageEvent(file: state.image!.file),
//         );
//   }

//   void _navigateSpecificPage(int index) {
//     _isNavigateLastPage = true;
//     setState(() => _currentStepIndex = index);
//     _pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   void _navigateLastPage() {
//     final last = _currentStepIndex = (ItemStep.values.length - 1);
//     context.read<CreateItemBloc>().add(ChangePageEvent(page: last));
//   }

//   bool _handleButtonState(ItemState state) {
//     switch (_currentStep) {
//       case ItemStep.type:
//         return state.isFormSelectItemTypeValid;
//       case ItemStep.details:
//         return state.isFormItemDetailValid;
//       case ItemStep.photo:
//         return state.isPhotoValid;
//       case ItemStep.summary:
//         return true;
//       default:
//         return true;
//     }
//   }

//   String _handleButtonText(ItemState state) {
//     switch (_currentStep) {
//       case ItemStep.summary:
//         return R.strings.confirm;
//       default:
//         return R.strings.next;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CreateItemBloc, ItemState>(
//       listener: (context, state) {
//         if (state.status == ItemStatus.updatePage) {
//           if (state.page != null) {
//             final pageIndex = state.page!;
//             if (pageIndex >= 0) {
//               _navigateSpecificPage(state.page!);
//             }
//           }
//         }

//         if (state.status == ItemStatus.loading) {
//           Loading.instance().show(context: context, text: "Aguarde");
//         }

//         if (state.status == ItemStatus.success) {
//           Loading.instance().hide();
//           context.pushReplacement(RouterConstant.itemRegisterSuccess);
//         }

//         if (state.status == ItemStatus.error) {
//           Loading.instance().hide();
//           final snackBar = SnackBar(
//             backgroundColor: AppColors.errorColor,
//             content: Text(state.errorMessage!),
//             // action: SnackBarAction(
//             //   label: 'Undo',
//             //   onPressed: () {},
//             // ),
//             duration: const Duration(seconds: 4),
//           );

//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       },
//       builder: (context, state) {
//         return PopScope(
//           canPop: false,
//           onPopInvokedWithResult: (didPop, result) async {
//             if (!mounted) return;

//             final exit = await context.showQuestionDialog(
//                 R.strings.cancelRegister, R.strings.cancelRegisterMessage);

//             if (exit) {
//               Navigator.of(context).pop();
//             }
//           },
//           child: Scaffold(
//             backgroundColor: Colors.grey[50],
//             appBar: UIAppBar(
//               title: R.strings.appNewItemTitle,
//               leading: IconButton(
//                 onPressed: () async {
//                   final exit = await context.showQuestionDialog(
//                       R.strings.cancelRegister,
//                       R.strings.cancelRegisterMessage);

//                   if (!mounted) return;

//                   if (exit) {
//                     Navigator.of(context).pop();
//                   }
//                 },
//                 icon: const Icon(Icons.arrow_back),
//               ),
//             ),
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Row(
//                 spacing: 10,
//                 children: [
//                   if (_currentStepIndex > 0)
//                     Expanded(
//                       child: UIOutlineButton(
//                         text: context.strings.back,
//                         press: _previous,
//                       ),
//                     ),
//                   Expanded(
//                     child: UIPrimaryButton(
//                       text: _handleButtonText(state),
//                       press: _handleButtonState(state)
//                           ? (_currentStepIndex == 4
//                               ? () => _save(state)
//                               : _next)
//                           : null,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   children: [
//                     StepIndicator(
//                       step: _currentStepIndex,
//                       labels: R.strings.createItemSteps,
//                     ),
//                     Expanded(
//                       child: FadeSlideTransitionAnimator(
//                         child: PageView(
//                           controller: _pageController,
//                           physics: const NeverScrollableScrollPhysics(),
//                           children: const [
//                             StepChooseTypePage(),
//                             StepItemDetailPage(),
//                             StepObsPage(),
//                             StepAddPhotoPage(),
//                             StepSummaryPage(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
