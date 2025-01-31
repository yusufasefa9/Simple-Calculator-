import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class MediaStorage extends StatefulWidget {
  @override
  _MediaStorageState createState() => _MediaStorageState();
}

class _MediaStorageState extends State<MediaStorage> {
  List<File> _mediaFiles = [];

  Future<void> _pickFile(FileType fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: fileType);

    if (result != null) {
      File file = File(result.files.single.path!);
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final File newFile = await file.copy('$appDocPath/${file.path.split('/').last}');
      setState(() {
        _mediaFiles.add(newFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Storage'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _pickFile(FileType.image),
            child: Text('Pick Image'),
          ),
          ElevatedButton(
            onPressed: () => _pickFile(FileType.video),
            child: Text('Pick Video'),
          ),
          ElevatedButton(
            onPressed: () => _pickFile(FileType.audio),
            child: Text('Pick Audio'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _mediaFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_mediaFiles[index].path.split('/').last),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}