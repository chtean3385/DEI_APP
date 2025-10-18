import 'package:dei_champions/models/state_models/employer/add_edit_job_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../models/employer/job_post_model.dart';
import '../../../../widgets/pickers/image_picker.dart';

class EmployerPostNewJobController extends StateNotifier<AddEditJobState> {
  EmployerPostNewJobController() : super(AddEditJobState.initial()) {
    // fetchInitialProfileData();
  }

  // final ChefService _chefService = ChefService();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final departmentController = TextEditingController();
  final salaryController = TextEditingController();
  final categoryController = TextEditingController();
  final typeController = TextEditingController();
  final tagsController = TextEditingController();

  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();


  @override
  void dispose() {
    debugPrint("🔥 EmployerPostNewJobController disposed");
    titleController.dispose();
    descriptionController.dispose();
    departmentController.dispose();
    salaryController.dispose();
    categoryController.dispose();
    tagsController.dispose();
    typeController.dispose();

    areaController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    super.dispose();
  }

  void removeUrlGalleryImage(int index) {
    final currentJobData = state.jobData;
    if (currentJobData != null &&
        currentJobData.jobImageUrls != null &&
        index < currentJobData.jobImageUrls!.length) {
      final updatedUrls = List<String>.from(currentJobData.jobImageUrls!);
      updatedUrls.removeAt(index);

      // update ProfileModel with new list
      final updatedJobData = currentJobData.copyWith(
        jobImageUrls: updatedUrls,
      );
      state = state.copyWith(jobData: updatedJobData);
    }
  }

  void removeLocalGalleryImage(int index) {
    if (state.jobLocalImages != null &&
        index < state.jobLocalImages!.length) {
      final updatedLocal = List<XFile>.from(state.jobLocalImages!);
      updatedLocal.removeAt(index);
      state = state.copyWith(jobLocalImages: updatedLocal);
    }
  }

  void fetchInitialProfileData() {
    /// basic info

    titleController.text = "Vedhasekaran and Akalya Inc 123";
    departmentController.text = "Riyaz Dhayalan";
    descriptionController.text = "01/02/2000";
    tagsController.text = "51-200 employees";
    salaryController.text = "https://www.rozecifexacavu.ws";
    categoryController.text = "Corrupti est qui c";

    areaController.text = "Corrupti est qui c";
    cityController.text = "Corrupti est qui c";
    stateController.text = "Corrupti est qui c";
    countryController.text = "Corrupti est qui c";


    final galleryImages = [
      "https://res.cloudinary.com/dv4aury9e/image/upload/v1755079508/blogs/szose5lsflyu8jhadcks.png",
      "https://res.cloudinary.com/dv4aury9e/image/upload/v1755079773/blogs/shvioyrmukgh4gbqa824.png",
      "https://res.cloudinary.com/dv4aury9e/image/upload/v1755083343/blogs/jkp1efnarxmnnnusarve.png",
    ];


    state = state.copyWith(
      jobData: (state.jobData ?? JobPostModel()).copyWith(
        jobImageUrls: galleryImages,
      ),
    );
  }

  Future<void> pickGalleryImage() async {
    final picked = await pickImageFromGalleryOrCamera(
      isCircleShape: false,
      isSquareCrop: false,
      ratio: CropAspectRatioPreset.ratio16x9,
      isLockAspectRatio: false,
    );
    if (picked != null) {
      final List<XFile> updatedLocalImages = [
        ...(state.jobLocalImages ?? <XFile>[]),
        picked,
      ];
      state = state.copyWith(jobLocalImages: updatedLocalImages);
    }
  }
}
