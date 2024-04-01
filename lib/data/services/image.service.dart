import 'dart:developer';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagesSingleton {
  static ImagesSingleton? _instance;
  final cloudinary = Cloudinary.full(
    apiKey: "568359618655378",
    apiSecret: "Z84WWqnyvixvKUFfeqhLom8RuFg",
    cloudName: "duvdq4fkz",
  );
  ImagesSingleton._internal();

  static ImagesSingleton getInstance() {
    _instance ??= ImagesSingleton._internal();
    return _instance!;
  }

  Future<String?> uploadPhoto(
      XFile image, String? folder, String userId) async {
    if (kIsWeb) {
      try {
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            fileBytes: await image.readAsBytes(),
            resourceType: CloudinaryResourceType.image,
            folder: folder,
            fileName: userId,
          ),
        );
        if (response.isSuccessful) {
          return response.secureUrl;
        } else {
          log('Error', error: response.error);
          return null;
        }
      } catch (err) {
        log('Error', error: err);
        return null;
      }
    } else {
      try {
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: image.path,
            resourceType: CloudinaryResourceType.image,
            folder: folder,
            fileName: userId,
          ),
        );
        if (response.isSuccessful) {
          return response.secureUrl;
        } else {
          log('Error', error: response.error);
          return null;
        }
      } catch (err) {
        log('Error', error: err);
        return null;
      }
    }
  }

  Future<String?> uploadPdf(
      PlatformFile file, String? folder, String userId) async {
    if (kIsWeb) {
      try {
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            fileBytes: file.bytes,
            resourceType: CloudinaryResourceType.auto,
            folder: folder,
            fileName: userId,
          ),
        );
        if (response.isSuccessful) {
          return response.secureUrl;
        } else {
          log('Error', error: response.error);
          return null;
        }
      } catch (err) {
        log('Error', error: err);
        return null;
      }
    } else {
      try {
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            fileBytes: file.bytes,
            resourceType: CloudinaryResourceType.auto,
            folder: folder,
            fileName: userId,
          ),
        );
        if (response.isSuccessful) {
          return response.secureUrl;
        } else {
          log('Error', error: response.error);
          return null;
        }
      } catch (err) {
        log('Error', error: err);
        return null;
      }
    }
  }
}