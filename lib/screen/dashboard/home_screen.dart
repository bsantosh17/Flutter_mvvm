import 'package:flutter/material.dart';
import 'package:flutter_new/screen/dashboard/viewModel/HomeViewModel.dart';
import 'package:flutter_new/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/utils/NetworkUtil.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkConnectivityAndFetch();
    });


  }

  Future<void> checkConnectivityAndFetch() async {
    bool isOnline = await NetworkUtil.isConnected();
    if(!isOnline){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No internet connection")),
      );
    }   else {
      final mobViewModel = Provider.of<HomeViewModel>(context, listen: false);
      mobViewModel.fetchDataProduct();
    }
    }


  @override
  Widget build(BuildContext context) {
    final mobVM = Provider.of<HomeViewModel>(context);

    if (mobVM.loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (mobVM.error != null) {
      return Center(child: Text('Error: ${mobVM.error}'));
    }

    // Check if products is null before accessing its properties
    if (mobVM.products == null || mobVM.products!.isEmpty) {
      return Center(child: Text('No products available.'));
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mobVM.products!.length,
                itemBuilder: (context, index) {
                  final product = mobVM.products![index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            product.image != null
                                ? Image.network(
                              product.image!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                                : Image.asset(
                              "assets/login.jpg",
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    CustomText(text: product.title),
                                  ],
                                ),
                              ),
                            )
          
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomText(text: "hello")
        ],
      ),
    );
  }
}