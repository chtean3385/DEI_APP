import 'dart:convert';

import 'package:dei_champions/models/profile/edit_profile/skills_info_model.dart';
import 'package:dei_champions/models/profile/edit_profile/work_experience_model.dart';

import 'basic_profile_details_model.dart';
import 'education_info_model.dart';
import 'job_preference_model.dart';
import 'location_info_model.dart';

class ProfileModel {
  final List<SkillsInfoModel>? skillsInfo;
  final List<EducationInfoModel>? education;
  final List<WorkExperienceInfoModel>? workExperience;
  final JobPreferenceModel? jobPreference;
  final BasicProfileDetailsModel? basicProfileDetailsModel;
  final LocationInfoModel? locationInfoModel;

  ProfileModel({
    this.education,
    this.workExperience,
    this.jobPreference,
    this.basicProfileDetailsModel,
    this.locationInfoModel,
    this.skillsInfo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    education: json['education'] != null
        ? List<EducationInfoModel>.from(
        json['education'].map((e) => EducationInfoModel.fromJson(e)))
        : [],
    workExperience: json['workExperience'] != null
        ? List<WorkExperienceInfoModel>.from(
        json['workExperience'].map((e) => WorkExperienceInfoModel.fromJson(e)))
        : [],
    jobPreference: json['jobPreference'] != null
        ? JobPreferenceModel.fromJson(json['jobPreference'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'education': education?.map((e) => e.toJson()).toList(),
    'workExperience': workExperience?.map((e) => e.toJson()).toList(),
    'jobPreference': jobPreference?.toJson(),
  };

  @override
  String toString() => jsonEncode(toJson());
}