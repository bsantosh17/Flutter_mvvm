import 'package:flutter/material.dart';
import 'package:flutter_new/screen/dashboard/viewModel/ProfileViewModel.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {


  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    viewModel.getProfileData(); // Call to fetch data
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    if (viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(child: Text('Error: ${viewModel.error}'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: ListView.builder(
        itemCount: viewModel.profileList.length,
        itemBuilder: (context, index) {
          final datas = viewModel.profileList[index];
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: datas.image != null
            ? NetworkImage(datas.image!)
            : AssetImage('assets/images/login.jpg') as ImageProvider),
            title: Text(datas.title.toString()), // Return a widget for each item
          );
        },
      ),
    );
  }
}