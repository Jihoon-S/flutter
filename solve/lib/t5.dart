import 'package:lib/study_lib.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class T5 extends ITextTest {
  List<String> args = [];
  List<String> output = [];

  @override
  String get authorName => 'jh';

  String grayscaleToChar(int grayValue) {
    final List<String> chars = [
      '@',
      '#',
      'S',
      '%',
      '?',
      '*',
      '+',
      ';',
      ':',
      ','
    ];

    final index = (grayValue / 26).round().clamp(0, 9);

    return chars[index];
  }

  String imageToText(img.Image image) {
    final buffer = StringBuffer();

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final grayValue = img.getLuminance(pixel).toInt();

        final char = grayscaleToChar(grayValue);

        buffer.write(char);
      }
      buffer.writeln();
    }

    return buffer.toString();
  }

  Future<img.Image> handleImage(imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final image = img.decodeImage(bytes)!;
      final resizedImage = img.copyResize(image, width: 60, height: 60);
      final grayscaleImage = img.grayscale(resizedImage);
      return grayscaleImage;
    } else {
      return img.Image.empty();
    }
  }

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    if (output.isEmpty) {
      for (var arg in args) {
        handleImage(arg).then(
          (image) {
            output.add(imageToText(image));
            print(imageToText(image));
          },
        );
      }
    }

    return output;
  }

  @override
  void setInput(List<String> args) {
    this.args = args;
  }
}
