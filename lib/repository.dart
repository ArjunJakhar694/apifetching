import 'package:apicallingflutter/hive/model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class Repository{
Dio dio=Dio();
final String baseurl="https://webtest.maqadhe.com/mobikulhttp/catalog/comparelist?storeId=2&customerToken=imn21pbpua0d1sd5510r3uvubgw6rn7z&currency=KWD&websiteId=1&width=1093.000000&storeId=2&customerToken=imn21pbpua0d1sd5510r3uvubgw6rn7z&quoteId=";

Future<Welcome> datafetch()async{
  final data=await dio.get(baseurl);
  Map<dynamic, dynamic>wholedata=data.data;
  final welcome=Welcome.fromJson(wholedata);
  print("The data get from the Api ${welcome.productList}");


  final box = await Hive.openBox<Welcome>('compareData');
  print("The data stored in the hive ${box}");
  await box.put('data', welcome);
  return welcome;
}

Future <Welcome?> gethivedata() async{
final box = await Hive.openBox<Welcome>('compareData');
return box.get('data');
}
Future<Welcome?> deleteAllData() async {
  final box = await Hive.openBox<Welcome>('compareData');
  await box.clear(); // returns Future<int>, but we ignore it
  // explicitly return null to match expected return type
}


}
