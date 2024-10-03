import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../ViewModels/ImageViewModel.dart';


class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<ImageViewModel>(
              builder: (context, imageViewModel, child) {
                return imageViewModel.image != null
                    ? Image.file(imageViewModel.image!)
                    : Image.network('https://via.placeholder.com/150');  // Placeholder image URL
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<ImageViewModel>(context, listen: false).pickImage();
              },
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Provider.of<ImageViewModel>(context, listen: false).uploadImage();
                Fluttertoast.showToast(
                  msg: "Image uploaded successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
