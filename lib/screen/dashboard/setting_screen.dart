import 'package:flutter/material.dart';
import 'package:flutter_new/screen/dashboard/viewModel/SettingViewModel.dart';
import 'package:flutter_new/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MySettingScreen extends StatefulWidget {
  const MySettingScreen({super.key});

  @override
  State<MySettingScreen> createState() => _MySettingScreenState();
}

class _MySettingScreenState extends State<MySettingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final settingVm = Provider.of<SettingViewModel>(context, listen: false);
    settingVm.getSettingData();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SettingViewModel>(context);


    if (viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(child: CustomText(text: "Error: ${viewModel.error}"));
    }

    final response = viewModel.settingPhoto;
    if (response == null || response.photos == null || response.photos!.isEmpty) {
      return Center(child: CustomText(text: "No Records Found"));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
              CustomText(text: "Success: ${response.success}"),
              Expanded(
                  child:ListView.builder(
                      itemCount: response.photos!.length,
                      itemBuilder: (context,index){
                        final photos = response.photos![index];
                        return Card(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                photos.url != null
                                                                ? Image.network(
                                  photos.url!,
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
                                Text(photos.id.toString(),textAlign: TextAlign.left,),
                                CustomText(text: photos.user.toString()),
                                CustomText(text: photos.title!),
                                CustomText(text: photos.description!),
                              ],
                            ),
                          ),
                        );
                      }))
          ],
        ),
      ),
    );
  }
}