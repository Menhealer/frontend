import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImageResizeUtil {
  static const int maxSizeInBytes = 10 * 1024 * 1024;

  static Future<File> compressIfNeeded(File file) async {
    final originalSize = await file.length();

    // 10MB 이하는 그대로 사용
    if (originalSize <= maxSizeInBytes) {
      return file;
    }

    final tempDir = await getTemporaryDirectory();
    final targetPath = p.join(
      tempDir.path,
      '${DateTime.now().millisecondsSinceEpoch}_${p.basenameWithoutExtension(file.path)}.jpg',
    );

    // 1회 리사이징/압축만 시도
    final compressedXFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      format: CompressFormat.jpeg,
      quality: 85,
      minWidth: 1440,
      minHeight: 1440,
    );

    if (compressedXFile == null) {
      throw Exception('이미지 압축에 실패했어요');
    }

    final compressedFile = File(compressedXFile.path);
    final compressedSize = await compressedFile.length();

    // 10MB 초과 → 실패 처리
    if (compressedSize > maxSizeInBytes) {
      throw Exception('파일 크기가 너무 커서 업로드할 수 없어요 (10MB 초과)');
    }

    return compressedFile;
  }
}