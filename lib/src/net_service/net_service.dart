import 'package:dio/dio.dart';

/// 使用dio默认配置
final Dio dio = Dio();

class ResultData {
  dynamic data;

  /// true 请求成功 false 请求失败，show data
  bool result;

  ResultData(this.data, this.result);
}

enum Method {
  GET,
  POST,
  UPLOAD,
  DOWNLOAD,
}

abstract class MSNetService {
  Future<Map<String, dynamic>> getHeaders();

  String getBasicUrl();

  ///域名 后缀
  String getBasicSuffixUrl();

  /// 数据处理
  ResultData handleDataSource<R>(
    Response response,
    Method method,
  );

//  /// 附件下载
//  @deprecated
//  Future<ResultData> download(String url, String savePath) async {
//    return await request(url, method: Method.DOWNLOAD, fileSavePath: savePath);
//  }

  ///  请求部分
  Future<ResultData> request<R>(
    String url, {
    Method method = Method.POST,
    data,
    @Deprecated('使用 queryParameters') Map<String, dynamic>? params,
    Map<String, dynamic>? queryParameters,
    String? filePath,
    String? fileName,
    String? fileSavePath,
  }) async {
    try {
      Response response;

      var headers = await getHeaders();
      if (headers != null) {
        dio.options.headers = headers;
      }
      var baseUrl = getBasicUrl();
      dio.options.baseUrl = baseUrl;

      switch (method) {
        case Method.GET:
          response = await dio.get(
            getBasicSuffixUrl() + url,
            queryParameters: params ?? queryParameters,
          );
          break;
        case Method.POST:
          response = await dio.post(
            getBasicSuffixUrl() + url,
            data: data,
            queryParameters: params ?? queryParameters,
          );
          break;
        case Method.UPLOAD:
          {
            // MultipartFile data = await MultipartFile.fromFile(filePath, filename: fileName);
            // FormData formData = FormData.fromMap({'file' :data});

            FormData formData = FormData();
            if (params != null) {
              formData = FormData.fromMap(params);
            }
            formData.files.add(
              MapEntry(
                "file",
                await MultipartFile.fromFile(filePath!, filename: fileName),
              ),
            );
            response =
                await dio.post(getBasicSuffixUrl() + url, data: formData);
            break;
          }
        case Method.DOWNLOAD:
          response =
              await dio.download(getBasicSuffixUrl() + url, fileSavePath);
          break;
      }

      return handleDataSource<R>(
        response,
        method,
      );
    } catch (exception) {
      print('$exception');
      return ResultData(exception.toString(), false);
    }
  }
}
