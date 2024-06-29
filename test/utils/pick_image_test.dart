import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ImagePicker, ImageCropper])
void main() {
  // final mockImagePicker = MockImagePicker();
  // final mockImageCropper = MockImageCropper();
  // const mockImagePath = 'lib/src/assets/image/Screenshot (149).png';

  // when(mockImagePicker.pickImage(source: ImageSource.gallery)).thenAnswer(
  //   (_) async {
  //     logger.i("CALL IMAGE PICKER");
  //     return XFile(mockImagePath);
  //   },
  // );

  // when(mockImageCropper.cropImage(sourcePath: mockImagePath)).thenAnswer(
  //   (_) async {
  //     logger.i("CALL IMAGE Cropper");
  //     return CroppedFile(mockImagePath);
  //   },
  // );

  // testWidgets('pickImage successfully picks and crops an image',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Builder(
  //           builder: (BuildContext context) {
  //             return ElevatedButton(
  //               onPressed: () async {
  //                 final result = await pickImage(context);
  //                 logger.i("RESULT: $result");
  //               },
  //               child: const Text('Pick and Crop Image'),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );

  //   await tester.tap(find.byType(ElevatedButton));
  //   await tester.pumpAndSettle();
  //   await tester.tap(find.text('Gallery'));
  //   await tester.pumpAndSettle();

  //   verify(mockImagePicker.pickImage(source: ImageSource.gallery)).called(1);
  //   verify(mockImageCropper.cropImage(sourcePath: mockImagePath)).called(1);
  // });
}
