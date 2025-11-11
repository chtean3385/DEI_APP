import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../models/profile/edit_profile/profile_model.dart';
import '../../../../models/state_models/profile/profile_state.dart';
import '../../../../widgets/pickers/image_picker.dart';

class EditEmployerProfileController extends StateNotifier<ProfileState> {
  EditEmployerProfileController() : super(ProfileState.initial()) {
    fetchInitialProfileData();
  }

  // final ChefService _chefService = ChefService();
  /// basic info
  final nameController = TextEditingController();
  final joinedDateController = TextEditingController();
  final contactPersonController = TextEditingController();
  final websiteController = TextEditingController();
  final tagController = TextEditingController();
  final companySizeController = TextEditingController();

  /// contact info
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final pinCodeController = TextEditingController();

  /// People & Culture
  final peopleCultureController = TextEditingController();

  /// Recruitments
  final recruitmentsController = TextEditingController();

  /// about company
  final aboutCompanyController = TextEditingController();

  @override
  void dispose() {
    debugPrint("🔥 EditEmployerProfileController disposed");
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    joinedDateController.dispose();
    contactPersonController.dispose();
    websiteController.dispose();
    tagController.dispose();
    companySizeController.dispose();

    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    pinCodeController.dispose();

    peopleCultureController.dispose();
    recruitmentsController.dispose();
    aboutCompanyController.dispose();

    super.dispose();
  }

  void removeUrlGalleryImage(int index) {
    final currentProfile = state.profileData;
    if (currentProfile != null &&
        currentProfile.galleryImageUrls != null &&
        index < currentProfile.galleryImageUrls!.length) {
      final updatedUrls = List<String>.from(currentProfile.galleryImageUrls!);
      updatedUrls.removeAt(index);

      // update ProfileModel with new list
      final updatedProfile = currentProfile.copyWith(
        galleryImageUrls: updatedUrls,
      );
      state = state.copyWith(profileData: updatedProfile);
    }
  }

  void removeLocalGalleryImage(int index) {
    if (state.galleryLocalImages != null &&
        index < state.galleryLocalImages!.length) {
      final updatedLocal = List<XFile>.from(state.galleryLocalImages!);
      updatedLocal.removeAt(index);
      state = state.copyWith(galleryLocalImages: updatedLocal);
    }
  }

  void fetchInitialProfileData() {
    /// basic info

    nameController.text = "Vedhasekaran and Akalya Inc 123";
    contactPersonController.text = "Riyaz Dhayalan";
    joinedDateController.text = "01/02/2000";
    companySizeController.text = "51-200 employees";
    websiteController.text = "https://www.rozecifexacavu.ws";
    tagController.text = "Corrupti est qui c";

    addressController.text = "Corrupti est qui c";
    emailController.text = "Corrupti est qui c";
    mobileController.text = "Corrupti est qui c";
    cityController.text = "Corrupti est qui c";
    stateController.text = "Corrupti est qui c";
    countryController.text = "Corrupti est qui c";
    pinCodeController.text = "Corrupti est qui c";

    final singleTextRecruitments =
        "We focus on hiring individuals with both technical excellence and cultural alignment.\n"
        "Our recruitment process ensures transparency, fairness, and opportunity for all.\n"
        "We invest in long-term employee growth through mentorship and skill development.";
    final cultureText =
        "Ut odit delectus animi — our team thrives on collaboration and creativity.\n"
        "We foster an inclusive work environment that values every individual’s contribution.\n"
        "Continuous learning and mutual respect form the backbone of our culture.";
    final aboutUsText =
        "Vedhasekaran and Akalya Inc 123 is a dynamic organization headquartered in Dhanbad, Jharkhand.\n"
        "We specialize in providing innovative business solutions across multiple industries,\n"
        "helping clients optimize operations and achieve sustainable growth.";

    final galleryImages = [
      "https://res.cloudinary.com/dv4aury9e/image/upload/v1755079508/blogs/szose5lsflyu8jhadcks.png",
      "https://res.cloudinary.com/dv4aury9e/image/upload/v1755079773/blogs/shvioyrmukgh4gbqa824.png",
      "https://res.cloudinary.com/dv4aury9e/image/upload/v1755083343/blogs/jkp1efnarxmnnnusarve.png",
    ];
    final coverImage =
        "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120309/DEICHAMP/n1sby4rpjlz5lciwej85.jpg";
    final profileImage =
        "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120375/DEICHAMP/oh6xk6yndlo1ievdxi3y.jpg";

    recruitmentsController.text = singleTextRecruitments;
    peopleCultureController.text = cultureText;
    aboutCompanyController.text = aboutUsText;

    state = state.copyWith(
      profileData: (state.profileData ?? ProfileModel()).copyWith(
        galleryImageUrls: galleryImages,
        profileImageUrl: profileImage,
        coverImageUrl: coverImage,
      ),
    );
  }

  Future<void> pickProfileImage() async {
    final picked = await pickImageFromGalleryOrCamera(
      isCircleShape: false,
      isSquareCrop: true,
      ratio: CropAspectRatioPreset.square,
    );
    if (picked != null) {
      state = state.copyWith(profileFile: picked);
    }
  }

  Future<void> pickCoverImage() async {
    final picked = await pickImageFromGalleryOrCamera(
      isCircleShape: false,
      isSquareCrop: true,
      ratio: CropAspectRatioPreset.ratio16x9,
      isLockAspectRatio: false,
    );
    if (picked != null) {
      state = state.copyWith(coverFile: picked);
    }
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
        ...(state.galleryLocalImages ?? <XFile>[]),
        picked,
      ];
      state = state.copyWith(galleryLocalImages: updatedLocalImages);
    }
  }
}
