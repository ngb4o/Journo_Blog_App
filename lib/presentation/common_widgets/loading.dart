import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/contants/my_colors.dart';

class LoadingSpinkit {
  //Loading Page
  static const loadingPage = SpinKitFadingCube(
    color: MyColors.primaryColor,
    size: 45,
  );

  //Loading Image
  static const loadingImage = SpinKitFadingCircle(
    color: MyColors.primaryColor,
    size: 35.0,
  );

  //Loading Button
  static const loadingButton = SpinKitWave(
    color: MyColors.primaryColor,
    size: 40.0,
  );
}
