import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/contants/my_colors.dart';

class LoadingSpinkit {
  //Loading Page
  static const loadingPage = SpinKitFadingCube(
    color: MyColors.primaryColor,
    size: 30,
  );

  //Loading Image
  static const loadingImage = SpinKitFadingCircle(
    color: MyColors.primaryColor,
    size: 25.0,
  );

  //Loading Button
  static const loadingButton = SpinKitRing(
    color: MyColors.primaryColor,
    size: 35.0,
  );
}
