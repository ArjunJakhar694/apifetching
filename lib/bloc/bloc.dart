import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository.dart';
import '../hive/model.dart'; // Import Welcome model if needed
import 'event.dart';
import 'state.dart';

class DataFetchingBloc extends Bloc<DatafetchingEvent,DataFetchingstate> {
  final Repository repository;

  DataFetchingBloc({required this.repository}) : super(DataFetchingInitial()) {
    on<DataFetchingEvent>((event, emit) async {
      emit(DataFetchingLoading());

      try {
        final welcomedata = await repository.datafetch();
        final cachedData = await repository.gethivedata();

        if (cachedData != null) {
          emit(DataFetched(welcome: cachedData));
        } else {
          emit(Error(error: "No data found in Hive"));
        }
      } catch (e) {
        emit(Error(error: e.toString()));
      }
    });
    on<DataDeletingEvent>((event, emit) async {
      emit(DataDeletingLoading());
      await Future.delayed(Duration(milliseconds: 300));
      try {
        final deletedata = await repository.deleteAllData();
        if (deletedata == null) {
          print("The data is deled");

          emit(DataDeleted(message: 'Not found'));
        }
        else {
          print("The data is not deleted"); // Show empty or deleted state
        }
      } catch (e) {
        emit(Error(error: e.toString()));
      }
    });
    // on<RemoveProductEvent>((event, emit) async {
    //   final currentState = state;
    //   if (currentState is DataFetched) {
    //     final updatedList = currentState.welcome.productList
    //         .where((product) => product.entityId != event.productId)
    //         .toList();
    //
    //     // Manually create a new Welcome object
    //     final updatedWelcome = Welcome(
    //       productList: updatedList,
    //       attributeValueList: currentState.welcome.attributeValueList,
    //       success: currentState.welcome.success,
    //       message: currentState.welcome.message,
    //       showSwatchOnCollection: currentState.welcome.showSwatchOnCollection,
    //     );
    //
    //     emit(DataFetched(welcome: updatedWelcome));
    //   }
    // });
    // on<RemoveProductEvent>((event, emit) async {
    //   final currentState = state;
    //   if (currentState is DataFetched) {
    //     final updatedList = currentState.welcome.productList
    //         .where((product) => product.entityId != event.productId)
    //         .toList();
    //
    //     // Manually create a new Welcome object
    //     final updatedWelcome = Welcome(
    //       productList: updatedList,
    //       attributeValueList: currentState.welcome.attributeValueList,
    //       success: currentState.welcome.success,
    //       message: currentState.welcome.message,
    //       showSwatchOnCollection: currentState.welcome.showSwatchOnCollection,
    //     );
    //
    //     emit(DataFetched(welcome: updatedWelcome));
    //   }
    // });
    on<RemoveProductEvent>((event, emit) async {
      final currentState = state;
      if (currentState is DataFetched) {
        final oldProductList = currentState.welcome.productList;

        // Get index of product to remove
        final removeIndex = oldProductList.indexWhere((p) => p.entityId == event.productId);

        if (removeIndex == -1) return; // Product not found

        // Remove product from productList
        final updatedProductList = List<ProductList>.from(oldProductList)..removeAt(removeIndex);

        // Remove corresponding attribute values at the same index
        final updatedAttributes = currentState.welcome.attributeValueList.map((attr) {
          final updatedValues = List<String>.from(attr.value);
          if (removeIndex < updatedValues.length) {
            updatedValues.removeAt(removeIndex);
          }
          return AttributeValueList(
            attributeName: attr.attributeName,
            value: updatedValues,
          );
        }).toList();

        final updatedWelcome = Welcome(
          productList: updatedProductList,
          attributeValueList: updatedAttributes,
          success: currentState.welcome.success,
          message: currentState.welcome.message,
          showSwatchOnCollection: currentState.welcome.showSwatchOnCollection,
        );

        emit(DataFetched(welcome: updatedWelcome));
      }
    });

  }
}
