part of 'share.dart';

Future<File> getImage() async {
  final ImagePicker imagePicker = ImagePicker();

  final PickedFile image = await imagePicker.getImage(source: ImageSource.gallery);
  return File.fromRawPath(await image.readAsBytes());
}

Future<String> uploadImage(File image) async {
  final String fileName = basename(image.path);

  final StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  final StorageUploadTask task = ref.putFile(image);
  final StorageTaskSnapshot snapshot = await task.onComplete;

  return snapshot.ref.getDownloadURL() as String;
}


// Future<String> getImageFromFirebase(String imageName) async {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final StorageReference ref = storage.ref();
//   final StorageUploadTask task = ref.child().;
//   final StorageTaskSnapshot snapshot = await task.onComplete;

//   return snapshot.ref.getDownloadURL() as String;
// }