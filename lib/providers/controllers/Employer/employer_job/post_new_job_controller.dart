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
    print("fetchInitialProfileDatafetchInitialProfileData");
    /// Basic info
    titleController.text = "UI/UX Designer";
    departmentController.text = "Advertising & Marketing";
    typeController.text = "Full-Time";
    descriptionController.text =
    "We’re seeking a creative UI/UX Designer to craft intuitive, visually appealing, "
        "and user-centered digital experiences. The ideal candidate should have experience "
        "in wireframing, prototyping, and collaborating closely with product and development teams.";
    tagsController.text = "Figma, Adobe XD, Sketch, User Research, Prototyping";
    salaryController.text = "8 - 12 Lacs PA";
    categoryController.text = "Gen Z";

    /// Location
    areaController.text = "Indiranagar";
    cityController.text = "Bengaluru";
    stateController.text = "Karnataka";
    countryController.text = "India";

    /// Dummy gallery images
    final galleryImages = [
      "https://res.cloudinary.com/demo/image/upload/v1700000101/jobs/uiux_workspace.png",
      "https://res.cloudinary.com/demo/image/upload/v1700000102/jobs/design_team.png",
      "https://res.cloudinary.com/demo/image/upload/v1700000103/jobs/prototype_mockup.png",
    ];

    /// Update job data in state
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
