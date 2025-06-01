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
    on<RemoveProductEvent>((event, emit) async {
      final currentState = state;

      if (currentState is DataFetched) {
        final oldWelcome = currentState.welcome;

        // 1. Remove the product
        final updatedProductList = oldWelcome.productList
            .where((product) => product.entityId != event.productId)
            .toList();

        // 2. Update the attributeValueList by removing the SKU
        final updatedAttributeList = oldWelcome.attributeValueList.map((attribute) {
          if (attribute.attributeName.toLowerCase() == 'sku') {
            final updatedValues = attribute.value
                .where((sku) => sku != event.productId)
                .toList();
            return AttributeValueList(
              attributeName: attribute.attributeName,
              value: updatedValues,
            );
          } else {
            return attribute;
          }
        }).toList();

        // 3. Create the updated Welcome object
        final updatedWelcome = Welcome(
          productList: updatedProductList,
          attributeValueList: updatedAttributeList,
          success: oldWelcome.success,
          message: oldWelcome.message,
          showSwatchOnCollection: oldWelcome.showSwatchOnCollection,
        );

        // 4. Emit the updated state
        emit(DataFetched(welcome: updatedWelcome));
      }
    });

  }
}
