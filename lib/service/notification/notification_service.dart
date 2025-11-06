import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';

class NotificationService {
  final ApiHandler _apiHandler;

  NotificationService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  Future<BaseModel> getNotificationsData() async {
    // String url = await ApiUrls.faq;
    // final result = await _apiHandler.get(url: url);
    final result = await apiData;
    if (result is Map<String, dynamic>) {
      final base = BaseModel.fromJson(result);
      if (base.isSuccess) {
        return base;
      } else {
        throw (base.message);
      }
    } else {
      throw Exception('Invalid response format');
    }
  }

  final apiData = {
    "success": true,
    "data": [
      {
        "id": "1",
        "title": "New Job Application",
        "description": "John Doe applied for Senior Developer position",
        "createdAt": "2025-11-06T09:02:51.296Z",
        "iconName": "fileAlt",
        "iconBgColor": "4283190845",
        "statusColor": "4280391411",
        "isRead": false
      },
      {
        "id": "2",
        "title": "Interview Scheduled",
        "description": "Your interview is scheduled for tomorrow at 10:00 AM",
        "createdAt": "2025-11-06T08:00:00.296Z",
        "iconName": "calendar",
        "iconBgColor": "4294966016",
        "statusColor": "4294930176",
        "isRead": false
      },
      {
        "id": "3",
        "title": "New Message",
        "description": "You have a new message from ABC Corporation",
        "createdAt": "2025-11-06T06:00:00.296Z",
        "iconName": "envelope",
        "iconBgColor": "4294111989",
        "statusColor": "0",
        "isRead": true
      },
      {
        "id": "4",
        "title": "Profile Viewed",
        "description": "HR from Tech Solutions viewed your profile",
        "createdAt": "2025-11-06T04:00:00.296Z",
        "iconName": "user",
        "iconBgColor": "4288585374",
        "statusColor": "4288585374",
        "isRead": false
      },
      {
        "id": "5",
        "title": "Application Approved",
        "description": "Your application for UI Designer has been approved",
        "createdAt": "2025-11-06T02:00:00.296Z",
        "iconName": "check",
        "iconBgColor": "4280391411",
        "statusColor": "4280391411",
        "isRead": true
      },
      {
        "id": "6",
        "title": "Job Recommendation",
        "description": "We found a new opening for Flutter Developer",
        "createdAt": "2025-11-05T21:00:00.296Z",
        "iconName": "briefcase",
        "iconBgColor": "4282339765",
        "statusColor": "4282339765",
        "isRead": false
      },
      {
        "id": "7",
        "title": "Reminder",
        "description": "Don’t forget to update your resume",
        "createdAt": "2025-11-05T19:00:00.296Z",
        "iconName": "bell",
        "iconBgColor": "4294198070",
        "statusColor": "4294198070",
        "isRead": false
      },
      {
        "id": "8",
        "title": "Interview Completed",
        "description": "You completed your interview at XYZ Company",
        "createdAt": "2025-11-05T09:30:00.296Z",
        "iconName": "calendar",
        "iconBgColor": "4294961979",
        "statusColor": "4294930176",
        "isRead": true
      },
      {
        "id": "9",
        "title": "Offer Received",
        "description": "Congratulations! You received an offer letter",
        "createdAt": "2025-11-05T07:15:00.296Z",
        "iconName": "fileAlt",
        "iconBgColor": "4281545523",
        "statusColor": "4282339765",
        "isRead": false
      },
      {
        "id": "10",
        "title": "New Company Message",
        "description": "Recruiter from QTech sent you a message",
        "createdAt": "2025-11-04T18:10:00.296Z",
        "iconName": "comment",
        "iconBgColor": "4288585374",
        "statusColor": "0",
        "isRead": true
      },
      {
        "id": "11",
        "title": "Interview Reminder",
        "description": "Your interview starts in 30 minutes",
        "createdAt": "2025-11-04T14:00:00.296Z",
        "iconName": "bell",
        "iconBgColor": "4294198070",
        "statusColor": "4294198070",
        "isRead": false
      },
      {
        "id": "12",
        "title": "Application Under Review",
        "description": "Your application is currently under review",
        "createdAt": "2025-11-03T10:00:00.296Z",
        "iconName": "fileAlt",
        "iconBgColor": "4283190845",
        "statusColor": "4280391411",
        "isRead": true
      },
      {
        "id": "13",
        "title": "Profile Updated",
        "description": "You successfully updated your work experience",
        "createdAt": "2025-11-03T06:00:00.296Z",
        "iconName": "user",
        "iconBgColor": "4288585374",
        "statusColor": "4288585374",
        "isRead": false
      },
      {
        "id": "14",
        "title": "System Alert",
        "description": "App version 2.0 is now available. Please update.",
        "createdAt": "2025-11-02T15:00:00.296Z",
        "iconName": "bell",
        "iconBgColor": "4294198070",
        "statusColor": "0",
        "isRead": true
      },
      {
        "id": "15",
        "title": "Feedback Request",
        "description": "Please rate your recent interview experience",
        "createdAt": "2025-11-02T10:00:00.296Z",
        "iconName": "comment",
        "iconBgColor": "4288585374",
        "statusColor": "0",
        "isRead": false
      }
    ]
  };

}
