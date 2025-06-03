import 'package:apicallingflutter/bloc/bloc.dart';
import 'package:apicallingflutter/bloc/event.dart';
import 'package:apicallingflutter/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print("added");
    context.read<DataFetchingBloc>().add(DataFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 100,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // go back on tap
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            const SizedBox(width: 5),
            const Text(
              "Account",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          "Compare Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<DataFetchingBloc>().add(DataFetchingEvent());
            },
            icon: const Icon(Icons.sync, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              context.read<DataFetchingBloc>().add(DataDeletingEvent());
            },
            icon: const Icon(Icons.delete, color: Colors.black),
          ),
        ],


      ),
      body: BlocConsumer<DataFetchingBloc, DataFetchingstate>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error fetching data")),
            );
          }
        },
        builder: (context, state) {
          if (state is DataFetchingLoading) {
            return const Center(child: CircularProgressIndicator());
          }else if(state is DataDeletingLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is DataDeleted){
           return Container(
               child:Text("Not found")
           );
          }
          else if (state is DataFetched) {
            final dataList = state.welcome.productList;

            return Container(

              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Product Cards Horizontal List
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataList.length,
                      separatorBuilder: (context, index) => Container(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      itemBuilder: (context, index) {
                        final item = dataList[index];
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 160,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Image.network(item.thumbNail,
                                          height: 100),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(item.entityId),
                                          const Spacer(),
                                          const Icon(Icons.favorite),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        item.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "No Review Yet",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<DataFetchingBloc>()
                                              .add(RemoveProductEvent(productId: item.entityId));
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          color: Colors.red,
                                          child: const Center(
                                            child: Text(
                                              "ADD TO CART",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Material(
                                    elevation: 4,
                                    shape: const CircleBorder(),
                                    color: Colors.white,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Handle close
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  Container(
                    color: Colors.grey[200],
                    height: 60,
                    width: 905,
                    alignment: Alignment.centerLeft, // Start horizontally, center vertically
                    padding: const EdgeInsets.symmetric(horizontal: 16), // Optional left padding
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
,
                  Container(

                    child:
                  SizedBox(

                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataList.length,
                      separatorBuilder: (context, index) => Container(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      itemBuilder: (context, index) {
                        final item = dataList[index];
                        return Container(
                          width: 160,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align children to start (left)
                            mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
                            children: [
                              Text(
                                item.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center, // Center text content
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    height: 60,
                    width: 905,
                    alignment: Alignment.centerLeft, // Start horizontally, center vertically
                    padding: const EdgeInsets.symmetric(horizontal: 16), // Optional left padding
                    child: Text(
                      "SKU",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: () {
                      final attributeList = state.welcome.attributeValueList;
                      // Find the SKU attribute safely
                      final attributeSku = state.welcome.attributeValueList.firstWhere(
                            (attr) => attr.attributeName.toLowerCase() == 'sku',
                      );


                      if (attributeSku.value.isEmpty) {
                        return const Center(child: Text("SKU data not available"));
                      }

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: attributeSku.value.length,
                        separatorBuilder: (context, index) => Container(
                          width: 2,
                          color: Colors.grey.shade300,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 160,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              attributeSku.value[index], // Correct access to SKU value
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        },
                      );
                    }(),
                  ),




                  // 🔹 New Horizontal ListView: Product Names

                ],
              ),
            );
          } else if (state is Error) {
            return const Center(child: Text("Data not found"));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
