import 'package:dei_champions/constants/enums.dart';
import 'package:image_picker/image_picker.dart';

import '../../employer/job_post_model.dart';



class AddEditJobState {
  final JobPostModel? jobData;
  final PageState pageState;
  final PageState updateState;
  final List<XFile>? jobLocalImages;
  final bool isUploading;


  AddEditJobState({
    this.jobData,
    this.jobLocalImages,
    this.isUploading = false,
    this.pageState = PageState.initial,
    this.updateState = PageState.initial,
  });

  factory AddEditJobState.initial() =>
      AddEditJobState();

  AddEditJobState copyWith({
    JobPostModel? jobData,
    PageState? pageState,
    PageState? updateState,
    bool? isUploading,
    List<XFile>? jobLocalImages
  }) {
    return AddEditJobState(
      jobData: jobData ?? this.jobData,
      pageState: pageState ?? this.pageState,
      updateState: updateState ?? this.updateState,
      isUploading: isUploading ?? this.isUploading,
      jobLocalImages: jobLocalImages ?? this.jobLocalImages,
    );
  }
}

