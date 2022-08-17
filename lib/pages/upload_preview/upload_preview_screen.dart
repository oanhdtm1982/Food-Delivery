import 'package:flutter/material.dart';
import 'package:food_delivery/pages/upload_preview/components/body_upload_preview.dart';
import 'package:food_delivery/widgets/size_config.dart';

class UploadPreviewScreen extends StatelessWidget {
  static String routeName = '/UploadPreviewScreen';
  const UploadPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyUploadPreview(),
    );
  }
}
