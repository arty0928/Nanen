import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:wonders/logic/data/mission_data.dart';
import 'package:wonders/logic/data/wonder_data.dart';
import 'image_picker_util.dart'; // Import the utility file

class UploadImage extends StatefulWidget {
  final int missionIndex;
  final MissionList selectedMission;
  final WonderData data;
  const UploadImage({Key? key, required this.missionIndex, required this.selectedMission, required this.data});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;

  Future<File> saveFilePermanently(String imagePath) async {
    print("saveFilePermanently");
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final savedIamge = File('${directory.path}/$name');
    print(savedIamge);

    return File(imagePath).copy(savedIamge.path);
  }

  Future<void> selectImage() async {
    print("selectImage");

    await getImageFromPicker((File image) async {
      setState(() {
        _image = image;
      });

      if (_image != null) {
        final savedImagePath = await saveFilePermanently(_image!.path);

        widget.selectedMission.missionPic = savedImagePath.path;
        widget.selectedMission.missionPicIsDone = true;
        print(widget.selectedMission.missionPic);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_image != null)
                  Image.file(
                    _image!,
                    // File(widget.selectedMission.missionPic),
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                else
                  buildImagePickerButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImagePickerButton() {
    return IconButton(
      onPressed: selectImage,
      icon: const Icon(Icons.image_outlined),
    );
  }
}
