import 'package:deehelp/core/components/dimens_test.dart';
import 'package:deehelp/core/components/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'my_text_style.dart';

class TransActionIconItem {
  final String icon;
  final List<String> label;
  final bool isActive;
  final Color activeColor;
  final VoidCallback? onTap;

  TransActionIconItem({
    this.onTap,
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.activeColor,
  });
}

final List<TransActionIconItem> transactionIconsList = [
  TransActionIconItem(
    icon: R.images.svgCategory,
    label: ["mobile_recharge", "reject_mobile_recharge"],
    isActive: true,
    activeColor: Color(0xFF2B5BEE),
  ),
  TransActionIconItem(
    icon: R.images.svgCategory,
    label: ["top_up"],
    isActive: true,
    activeColor: Color(0xFFA855F7),
  ),
  TransActionIconItem(
    icon: R.images.svgCategory,
    label: ["gift_card_purchase"],
    isActive: true,
    activeColor: Color(0xFF3B82F6),
  ),
  TransActionIconItem(
    icon: R.images.svgCategory,
    label: ["send_money"],
    isActive: true,
    activeColor: Color(0xFFF97316),
  ),
];

// Widget spaceSide(
//   double width, {
//   Color? color = Colors.transparent,
//   double height = 0,
//   EdgeInsetsGeometry? margin,
// }) {
//   return Container(
//     margin: margin,
//     color: color,
//     height: height,
//     child: width.horizontalSpace,
//   );
// }

class CustomMainTransactionListTileCard extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final Color backgroundColor;
  final double radius;
  final VoidCallback? onPressed;
  final String? title;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final String? balance;
  final String? date;
  final String? trxType;
  final Widget? leading;
  final Widget? trailing;
  final bool? showBorder;
  final bool isPress;
  final String remark;

  // final TransactionHistoryModel? item;

  const CustomMainTransactionListTileCard({
    super.key,
    this.width = double.infinity,
    this.backgroundColor = Colors.transparent,
    this.radius = 0,
    this.onPressed,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.balance,
    this.date,
    this.trxType,
    this.isPress = false,
    this.padding,
    this.margin,
    this.showBorder = true,
    this.remark = "",
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: width,
          padding: (padding ??
              const EdgeInsetsDirectional.symmetric(
                vertical: DimensTest.space10,
              )),
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder == true
                ? const Border(
                    bottom: BorderSide(
                      color: Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: ListTile(
            minTileHeight: 0,
            minVerticalPadding: DimensTest.space8,
            horizontalTitleGap: DimensTest.space8,
            leading: leading ??
                buildDynamicIconItem(
                  TransActionIconItem(
                    icon: R.images.svgCategory,
                    label: ["mobile_recharge", "reject_mobile_recharge"],
                    isActive: true,
                    activeColor: Color(0xFF2B5BEE),
                  ),
                ),
            title: Padding(
              padding:
                  const EdgeInsetsDirectional.only(bottom: DimensTest.space8),
              child: Row(
                // spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      title ?? "Outra coisa aqui",
                      style: MyTextStyle.sectionTitle3,
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        textAlign: TextAlign.end,
                        // "${trxType ?? ""}${balance ?? ""}",
                        "Alguma coisa aqui",
                        style: MyTextStyle.sectionTitle3.copyWith(
                          color: Color(0xFFEB4E3D),
                          // color: false
                          //     ? Color(0xFF35C75A)
                          //     : false
                          //         ? Color(0xFFEB4E3D)
                          //         : Color(0xFF1E293B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Row(
              // spacing: 120,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle ?? "algo aqui",
                        style: subtitleStyle ??
                            MyTextStyle.sectionSubTitle1.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF475569)),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Trx Id: ",
                                style: subtitleStyle ??
                                    MyTextStyle.caption1Style.copyWith(
                                      fontSize: DimensTest.fontSmall,
                                      color: Color(
                                          0xFF475569), //MyColor.getBodyTextColor(),
                                    ),
                              ),
                              TextSpan(
                                text: "sasasa",
                                style: subtitleStyle ??
                                    MyTextStyle.caption1Style.copyWith(
                                        fontSize: DimensTest.fontSmall,
                                        color: Color(
                                            0xFF475569) //MyColor.getBodyTextColor(),
                                        ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Clipboard.setData(
                                    //   ClipboardData(text: item?.trx ?? ""),
                                    // ).then((_) {
                                    //   CustomSnackBar.showToast(
                                    //     message: MyStrings.copiedToClipBoard.tr,
                                    //   );
                                    // });
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          textAlign: TextAlign.end,
                          date ?? "27/11/2025 04: AM",
                          style: MyTextStyle.caption2Style.copyWith(
                            fontSize: DimensTest.fontExtraSmall,
                            color:
                                Color(0xFF475569), //MyColor.getBodyTextColor(),
                          ),
                        ),
                      ),
                      // spaceDown(Dimensions.space10),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFF475569), //MyColor.getBodyTextColor(),
                        size: DimensTest.space10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDynamicIconItem(TransActionIconItem? service) {
    if (service == null) {
      return SizedBox.shrink();
    }
    return UICustomAppCard(
      backgroundColor: service.activeColor.withValues(alpha: 0.1),
      borderColor: Colors.transparent,
      padding: EdgeInsets.all(DimensTest.space12),
      width: DimensTest.space48,
      height: DimensTest.space48,
      radius: DimensTest.largeRadius,
      child: service.icon == "balance_subtract"
          ? FittedBox(
              child: Icon(
                Icons.remove,
                size: DimensTest.space24,
                color: service.activeColor,
              ),
            )
          : service.icon == "balance_add"
              ? FittedBox(
                  child: Icon(
                    Icons.add,
                    size: DimensTest.space24,
                    color: service.activeColor,
                  ),
                )
              : UIMyAssetsImageWidget(
                  isSvg: true,
                  assetPath: service.icon,
                  width: DimensTest.space24,
                  height: DimensTest.space24,
                  color: service.activeColor,
                ),
    );
  }
}
