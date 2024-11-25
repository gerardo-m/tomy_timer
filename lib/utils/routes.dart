class TomyTimerRoutes{

  static const home = '/';
  /// id: optional. If provided it will load the meeting with that id.
  /// Otherwise it will create a new meeting.
  static const meeting = '/meeting';
  /// One of the two must be present
  /// 
  /// id: is checked first. If provided it will try to load the corresponding
  /// report with that id.
  /// 
  /// meeting_id: If provided it will generate a new report based on the
  /// meeting data
  static const report = '/report';
  static const pastMeetings = '/past_meetings';
  static const settings = '/settings';

  static const templates = '/templates';
  /// id: required 
  static const template = '/template';
  /// id: required
  static const templateItem = '/template_item';
  static const qrCode = 'qr_code';
}
  