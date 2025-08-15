import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/size_config.dart';

import '../../../app/localization/image_config.dart';

class Welcome {
  String? title;
  String? description;
  String? image;

  Welcome({this.title, this.description, this.image});

  double getWidthForIndex(int index) {
    List<double> widths = [
      SizeConfig.width298,
      SizeConfig.width298,
      SizeConfig.width298
    ];
    if (index >= 0 && index < widths.length) {
      return widths[index];
    }
    return SizeConfig.width298;
  }

  double getHeightForIndex(int index) {
    List<double> heights = [
      SizeConfig.height303,
      SizeConfig.height272,
      SizeConfig.height282
    ];
    if (index >= 0 && index < heights.length) {
      return heights[index];
    }
    return SizeConfig.height313;
  }

  double getHeightForImageIndex(int index) {
    List<double> heights = [
      SizeConfig.height30,
      SizeConfig.height78,
      SizeConfig.height73
    ];
    if (index >= 0 && index < heights.length) {
      return heights[index];
    }
    return SizeConfig.height30;
  }

  double getHeightForSizeIndex(int index) {
    List<double> heights = [
      SizeConfig.height77,
      SizeConfig.height105,
      SizeConfig.height99
    ];
    if (index >= 0 && index < heights.length) {
      return heights[index];
    }
    return SizeConfig.height77;
  }

  static List<Welcome> getPages = [
    Welcome(
      title: StringConfig.discover,
      description: StringConfig.onBoard1,
      image: ImageConfig.onBoard1,
    ),
    Welcome(
      title: StringConfig.purchase,
      description: StringConfig.onBoard2,
      image: ImageConfig.onBoard2,
    ),
    Welcome(
      title: StringConfig.delivery,
      description: StringConfig.onBoard3,
      image: ImageConfig.onBoard3,
    ),
  ];
}
