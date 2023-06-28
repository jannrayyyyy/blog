import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState(xFile: null));
  Future<void> onImagePick(ImageSource imageSource) async {
    final imagePicked =
        await ImagePicker().pickImage(source: imageSource).then((value) {
      return value;
    });
    if (imagePicked == null) {
      return;
    } else {
      Future.delayed(const Duration(seconds: 2));
      emit(ImageState(xFile: imagePicked));
    }
  }
}
