import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/favorites/components/ui_verification_flag.dart';
import 'package:yousafe/features/favorites/favourite_model.dart';
import 'package:yousafe/shared/components/buttons/secondary_outline_button.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UIFavouriteCard extends StatelessWidget {
  final FavouriteModel favouriteModel;
  final VoidCallback? onTap;

  const UIFavouriteCard({
    super.key,
    required this.favouriteModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.getTextStyle;
    final colors = Colors.grey;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Imagem principal de fundo
              Positioned.fill(
                child: Image.asset(
                  favouriteModel.image,
                  fit: BoxFit.cover,
                ),
              ),

              // Ícone de favorito no canto superior direito
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Image(
                    image: AssetImage(ImageConfig.favoriteFill),
                    color: AppColors.bottomNavigationSelected,
                    width: 18,
                  ),
                  // child: Icon(
                  //   Icons.favorite_border,
                  //   size: 20,
                  //   color: Colors.red,
                  // ),
                ),
              ),

              // Overlay com informações na parte inferior
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.5), // opaco
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          favouriteModel.plate,
                          style: context.getTextStyle.small.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        favouriteModel.description,
                        style: context.getTextStyle.small.copyWith(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      UIVerificationFlag(isVerified: favouriteModel.isVerified),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Card(
    //   elevation: 2,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       // Imagem principal
    //       // ClipRRect(
    //       //   borderRadius: BorderRadius.circular(12),
    //       //   child: Image(
    //       //     ,
    //       //     fit: BoxFit.cover,
    //       //   ),
    //       // ),
    //        Container(
    //               width: 90,
    //               height: 90,
    //               margin: const EdgeInsets.only(right: 16),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 image: DecorationImage(
    //                   image: AssetImage(favouriteModel.image),
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),

    //       // Overlay inferior para informações
    //       Positioned(
    //         bottom: 0,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //           padding: const EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //             borderRadius: const BorderRadius.only(
    //               bottomLeft: Radius.circular(12),
    //               bottomRight: Radius.circular(12),
    //             ),
    //             gradient: LinearGradient(
    //               begin: Alignment.bottomCenter,
    //               end: Alignment.topCenter,
    //               colors: [
    //                 Colors.black.withOpacity(0.8),
    //                 Colors.transparent,
    //               ],
    //             ),
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 favouriteModel.plate,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 14,
    //                 ),
    //               ),
    //               Text(
    //                 favouriteModel.description,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),

    //       // Ícone de favoritos no canto superior direito
    //       Positioned(
    //         top: 8,
    //         right: 8,
    //         child: Container(
    //           padding: const EdgeInsets.all(6),
    //           decoration: BoxDecoration(
    //             color: Colors.black.withOpacity(0.4),
    //             shape: BoxShape.circle,
    //           ),
    //           child: Image(
    //             image: AssetImage(ImageConfig.favoriteFill),
    //             width: 24,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     padding: const EdgeInsets.all(16),
    //     decoration: BoxDecoration(
    //       // color: Colors.white,
    //       borderRadius: BorderRadius.circular(16),
    //       border: Border.all(
    //         color: colors.shade300,
    //         width: 1,
    //       ),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // Imagem do item
    //             Container(
    //               width: 90,
    //               height: 90,
    //               margin: const EdgeInsets.only(right: 16),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 image: DecorationImage(
    //                   image: AssetImage(favouriteModel.image),
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),

    //             // Informações do item
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     favouriteModel.description,
    //                     style: context.getTextStyle.medium,
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   const SizedBox(height: 8),
    //                   Text(
    //                     "Roubo/Furto",
    //                     style: context.getTextStyle.smallMedium,
    //                   ),
    //                   const SizedBox(height: 8),
    //                   Container(
    //                     padding: EdgeInsets.all(4),
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(4),
    //                       color: Colors.grey.shade200,
    //                       border: Border.all(
    //                         color: Colors.grey.shade400,
    //                       ),
    //                     ),
    //                     child: Text(
    //                       favouriteModel.plate,
    //                       style: context.getTextStyle.small.copyWith(
    //                         fontSize: 10,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),

    //             // Ícone de like
    //             GestureDetector(
    //               onTap: onTap,
    //               child: Image.asset(
    //                 ImageConfig.favoriteFill,
    //                 color: AppColors.bottomNavigationSelected,
    //                 width: 18,
    //                 height: 18,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'resolvido':
        return Colors.green;
      case 'em andamento':
        return Colors.orange;
      case 'urgente':
        return Colors.red;
      default:
        return AppColors.primaryColor;
    }
  }
}
