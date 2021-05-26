import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:yessoft/consts/urls.dart';
import 'package:yessoft/module_upload/response/imgbb/imgbb_response.dart';
import 'package:yessoft/utils/logger/logger.dart';

@provide
class UploadRepository {
  Future<ImgBBResponse> upload(String filePath) async {
    var client = Dio();
    FormData data = FormData.fromMap({
      'image': await MultipartFile.fromFile(filePath),
    });

    Logger().info('UploadRepo', 'Uploading: ' + filePath);

    Response response ;
//    = await client.post(
//      Urls.API_UPLOAD,
//      data: data,
//    );
    Logger().info('Got a Response', response.toString());

    if (response == null) {
      return null;
    }
    return ImgBBResponse(url: response.data);
  }
}
