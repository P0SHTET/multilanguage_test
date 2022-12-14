import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  //
  //
  // auth-service

  @GET('download/wicando/mobile-main/{lang}/?format=json')
  Future<String> getDictionary(@Path('lang') String lang);

}