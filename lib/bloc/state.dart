import 'package:apicallingflutter/hive/model.dart';

abstract class DataFetchingstate{

}
class DataFetchingInitial extends DataFetchingstate{

}
class DataFetchingLoading extends DataFetchingstate{

}
class DataDeletingLoading extends DataFetchingstate{

}
 class DataFetched extends DataFetchingstate{
  final Welcome welcome;
  DataFetched({required this.welcome});
 }

 class Error extends DataFetchingstate{
  final String error;
  Error({required this.error});

 }
class DataDeleted extends DataFetchingstate {
 final String message;
 DataDeleted({required this.message});
}




