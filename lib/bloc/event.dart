// event.dart

/// Base event class for DataFetchingBloc
abstract class DatafetchingEvent {}

/// Event to trigger data fetching
class DataFetchingEvent extends DatafetchingEvent {}

/// Event to trigger data deletion
class DataDeletingEvent extends DatafetchingEvent {}

class RemoveProductEvent extends DatafetchingEvent {
  final String productId;

  RemoveProductEvent({required this.productId});
}

