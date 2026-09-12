// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಪೂಜಾ ಪಂಡಿತ್';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get yes => 'ಹೌದು';

  @override
  String get no => 'ಇಲ್ಲ';

  @override
  String get pleaseEnterValidPhone =>
      'ದಯವಿಟ್ಟು ಮಾನ್ಯ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ.';

  @override
  String autoVerificationFailed(String error) {
    return 'ಸ್ವಯಂಚಾಲಿತ ಪರಿಶೀಲನೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get verificationFailed => 'ಪರಿಶೀಲನೆ ವಿಫಲವಾಗಿದೆ.';

  @override
  String get otpSentSuccessfully => 'OTP ಯಶಸ್ವಿಯಾಗಿ ಕಳುಹಿಸಲಾಗಿದೆ.';

  @override
  String unableToSendOtp(String error) {
    return 'OTP ಕಳುಹಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'ದಯವಿಟ್ಟು ಮಾನ್ಯ OTP ನಮೂದಿಸಿ ಅಥವಾ ಹೊಸದನ್ನು ವಿನಂತಿಸಿ.';

  @override
  String get invalidOtp => 'ಅಮಾನ್ಯ OTP.';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP ಪರಿಶೀಲನೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'ದೃಢೀಕರಿಸಿದ ಬಳಕೆದಾರರು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get firebaseUserTokenEmpty => 'Firebase ಬಳಕೆದಾರ ಟೋಕನ್ ಖಾಲಿಯಾಗಿದೆ.';

  @override
  String get backendInvalidTokens =>
      'ಬ್ಯಾಕೆಂಡ್ API ಮಾನ್ಯ ಟೋಕನ್‌ಗಳನ್ನು ಹಿಂತಿರುಗಿಸಲಿಲ್ಲ.';

  @override
  String loginFailed(String error) {
    return 'ಲಾಗಿನ್ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'ಮತ್ತೆ ಸ್ವಾಗತ! ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get verifyOtp => 'OTP ಪರಿಶೀಲಿಸಿ';

  @override
  String get mobileNumber => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get enterOtpSentToMobile =>
      'ನಿಮ್ಮ ಮೊಬೈಲ್‌ಗೆ ಕಳುಹಿಸಿದ 6-ಅಂಕಿಯ OTP ನಮೂದಿಸಿ.';

  @override
  String get willSendOneTimePassword =>
      'ನಾವು ನಿಮ್ಮ ಸಂಖ್ಯೆಗೆ ಒಂದು ಬಾರಿಯ ಪಾಸ್‌ವರ್ಡ್ ಕಳುಹಿಸುತ್ತೇವೆ.';

  @override
  String get codeLabel => 'ಕೋಡ್';

  @override
  String get phoneNumberLabel => 'ಫೋನ್ ಸಂಖ್ಯೆ';

  @override
  String get changeNumber => 'ಸಂಖ್ಯೆ ಬದಲಿಸಿ';

  @override
  String get sendOtp => 'OTP ಕಳುಹಿಸಿ';

  @override
  String registrationFailed(String error) {
    return 'ನೋಂದಣಿ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get completeYourProfile => 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get addRemainingDetails =>
      'ಅಪ್ಲಿಕೇಶನ್ ಬಳಸಲು ಪ್ರಾರಂಭಿಸಲು ಉಳಿದ ವಿವರಗಳನ್ನು ಸೇರಿಸಿ.';

  @override
  String get fullNameLabel => 'ಪೂರ್ಣ ಹೆಸರು';

  @override
  String get nameRequired => 'ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String get emailLabel => 'ಇಮೇಲ್';

  @override
  String get emailRequired => 'ಇಮೇಲ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get phoneNumberFieldLabel => 'ಫೋನ್ ಸಂಖ್ಯೆ';

  @override
  String get phoneNumberRequired => 'ಫೋನ್ ಸಂಖ್ಯೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get dateOfBirthLabel => 'ಜನ್ಮ ದಿನಾಂಕ';

  @override
  String get dobRequired => 'ಜನ್ಮ ದಿನಾಂಕ ಅಗತ್ಯವಿದೆ';

  @override
  String get genderLabel => 'ಲಿಂಗ';

  @override
  String get genderRequired => 'ಲಿಂಗ ಅಗತ್ಯವಿದೆ';

  @override
  String get genderMale => 'ಪುರುಷ';

  @override
  String get genderFemale => 'ಸ್ತ್ರೀ';

  @override
  String get specializationLabel => 'ವಿಶೇಷತೆ';

  @override
  String get specializationRequired => 'ವಿಶೇಷತೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get languageLabel => 'ಭಾಷೆ';

  @override
  String get languageRequired => 'ಭಾಷೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get languageOptionEnglish => 'ಇಂಗ್ಲಿಷ್';

  @override
  String get languageOptionMalayalam => 'ಮಲಯಾಳಂ';

  @override
  String get languageOptionTamil => 'ತಮಿಳು';

  @override
  String get languageOptionHindi => 'ಹಿಂದಿ';

  @override
  String get bioLabel => 'ಬಯೋ';

  @override
  String get bioRequired => 'ಬಯೋ ಅಗತ್ಯವಿದೆ';

  @override
  String get continueLabel => 'ಮುಂದುವರಿಸಿ';

  @override
  String get profileNotFound => 'ಪ್ರೊಫೈಲ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get unableToLoadProfile => 'ಪ್ರೊಫೈಲ್ ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get logOutQuestion => 'ಲಾಗ್ ಔಟ್ ಮಾಡುವುದೇ?';

  @override
  String get signInAgainMessage =>
      'ಅಪ್ಲಿಕೇಶನ್ ಪ್ರವೇಶಿಸಲು ನೀವು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get logOut => 'ಲಾಗ್ ಔಟ್';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'ಸ್ಥಳೀಯವಾಗಿ ಲಾಗ್ ಔಟ್ ಆಗಿದೆ. ಸರ್ವರ್ ಸಿಂಕ್ ವಿಫಲವಾಗಿದೆ.';

  @override
  String get accountAndSettings => 'ಖಾತೆ ಮತ್ತು ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get loadingProfile => 'ಪ್ರೊಫೈಲ್ ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get panditProfile => 'ಪಂಡಿತ್ ಪ್ರೊಫೈಲ್';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ವಿವರಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ';

  @override
  String get acceptInstantRequests => 'ತತ್ಕ್ಷಣದ ವಿನಂತಿಗಳನ್ನು ಸ್ವೀಕರಿಸಿ';

  @override
  String get getNotifiedNewRequest => 'ಹೊಸ ಪೂಜಾ ವಿನಂತಿ ಬಂದಾಗ ಸೂಚನೆ ಪಡೆಯಿರಿ';

  @override
  String get socketLiveUpdates => 'ಸಾಕೆಟ್ ಲೈವ್ ಅಪ್‌ಡೇಟ್‌ಗಳು';

  @override
  String get keepBookingFeedSynced => 'ಬುಕಿಂಗ್ ಫೀಡ್ ಅನ್ನು ಸಿಂಕ್ ಮಾಡಿ ಇರಿಸಿ';

  @override
  String get currentBookingStatus => 'ಪ್ರಸ್ತುತ ಬುಕಿಂಗ್ ಸ್ಥಿತಿ';

  @override
  String get noActiveBooking => 'ಯಾವುದೇ ಸಕ್ರಿಯ ಬುಕಿಂಗ್ ಇಲ್ಲ';

  @override
  String get loggingOut => 'ಲಾಗ್ ಔಟ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get pastBookings => 'ಹಿಂದಿನ ಬುಕಿಂಗ್‌ಗಳು';

  @override
  String get noCompletedBookingsYet => 'ಇನ್ನೂ ಪೂರ್ಣಗೊಂಡ ಬುಕಿಂಗ್‌ಗಳಿಲ್ಲ.';

  @override
  String get previousPage => 'ಹಿಂದಿನ ಪುಟ';

  @override
  String get nextPage => 'ಮುಂದಿನ ಪುಟ';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'ಪೂಜಾ ಸೇವೆ';

  @override
  String get dietyNotSpecified => 'ದೇವತೆ ನಿರ್ದಿಷ್ಟಪಡಿಸಿಲ್ಲ';

  @override
  String get crowdPrayerTag => 'ಸಾಮೂಹಿಕ ಪ್ರಾರ್ಥನೆ';

  @override
  String get bookedFor => 'ಯಾರಿಗಾಗಿ ಬುಕ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get nameNotProvided => 'ಹೆಸರು ಒದಗಿಸಿಲ್ಲ';

  @override
  String get birthStar => 'ಜನ್ಮ ನಕ್ಷತ್ರ';

  @override
  String get bookedOn => 'ಬುಕ್ ಮಾಡಿದ ದಿನಾಂಕ';

  @override
  String get panditLabel => 'ಪಂಡಿತ್';

  @override
  String get completedLabel => 'ಪೂರ್ಣಗೊಂಡಿದೆ';

  @override
  String get notesLabel => 'ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get statusCompleted => 'ಪೂರ್ಣಗೊಂಡಿದೆ';

  @override
  String get statusAccepted => 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get statusOngoing => 'ಮುಂದುವರಿಯುತ್ತಿದೆ';

  @override
  String get statusRejected => 'ತಿರಸ್ಕರಿಸಲಾಗಿದೆ';

  @override
  String get statusExpired => 'ಅವಧಿ ಮುಗಿದಿದೆ';

  @override
  String get statusNoPanditAvailable => 'ಪಂಡಿತ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get statusPending => 'ಬಾಕಿ ಇದೆ';

  @override
  String get availableBookingOpportunities => 'ಲಭ್ಯವಿರುವ ಬುಕಿಂಗ್ ಅವಕಾಶಗಳು';

  @override
  String get currentActiveBooking => 'ಪ್ರಸ್ತುತ ಸಕ್ರಿಯ ಬುಕಿಂಗ್';

  @override
  String dietyPrefix(String diety) {
    return 'ದೇವತೆ: $diety';
  }

  @override
  String get completeBooking => 'ಬುಕಿಂಗ್ ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get startBooking => 'ಅರ್ಪಣಮ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get uploadArpanamVideo => 'ಅರ್ಪಣಮ್ ವೀಡಿಯೊ ಸೇರಿಸಿ';

  @override
  String get videoUploaded => 'ಅರ್ಪಣಮ್ ವೀಡಿಯೊ ಅಪ್‌ಲೋಡ್ ಆಗಿದೆ';

  @override
  String get videoFromCamera => 'ವೀಡಿಯೊ ರೆಕಾರ್ಡ್ ಮಾಡಿ';

  @override
  String get videoFromGallery => 'ಗ್ಯಾಲರಿಯಿಂದ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get videoFromFiles => 'ಫೈಲ್‌ಗಳಿಂದ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get invalidArpanamVideo => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ವೀಡಿಯೊ ಫೈಲ್ ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get videoPickerUnavailable =>
      'ವೀಡಿಯೊ ರೆಕಾರ್ಡ್ ಅಥವಾ ಆಯ್ಕೆ ಲಭ್ಯವಿಲ್ಲ. ದಯವಿಟ್ಟು ಆ್ಯಪ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get videoCompressionFailed => 'ವೀಡಿಯೊವನ್ನು ಸಂಕುಚಿತಗೊಳಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get videoUploadFailed =>
      'ವೀಡಿಯೊ ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get freeToAcceptNext =>
      'ಮುಂದಿನ ಲಭ್ಯವಿರುವ ಬುಕಿಂಗ್ ಅನ್ನು ಸ್ವೀಕರಿಸಲು ನೀವು ಮುಕ್ತರಾಗಿದ್ದೀರಿ.';

  @override
  String get noBookingsAvailable => 'ಈಗ ಯಾವುದೇ ಬುಕಿಂಗ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get dobShort => 'ಜನ್ಮ ದಿನಾಂಕ';

  @override
  String get birthStarShort => 'ಜನ್ಮ ನಕ್ಷತ್ರ';

  @override
  String get dietyShort => 'ದೇವತೆ';

  @override
  String get crowdPrayerLabel => 'ಸಾಮೂಹಿಕ ಪ್ರಾರ್ಥನೆ';

  @override
  String get processing => 'ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get finishCurrentTaskFirst => 'ಮೊದಲು ಪ್ರಸ್ತುತ ಕಾರ್ಯವನ್ನು ಮುಗಿಸಿ';

  @override
  String get acceptRequest => 'ವಿನಂತಿ ಸ್ವೀಕರಿಸಿ';

  @override
  String get rejectRequestTooltip => 'ವಿನಂತಿ ತಿರಸ್ಕರಿಸಿ';

  @override
  String rejectBookingWarning(String name) {
    return '$name ಅವರನ್ನು ತಿರಸ್ಕರಿಸಿದರೆ ಬುಕಿಂಗ್ ನಿಮ್ಮ ಪಟ್ಟಿಯಿಂದ ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ. ಇದನ್ನು ಹಿಂಪಡೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ.';
  }

  @override
  String get statusOnline => 'ಆನ್‌ಲೈನ್';

  @override
  String get statusBusy => 'ಬ್ಯುಸಿ ಆಗಿದೆ';

  @override
  String get statusOffline => 'ಆಫ್‌ಲೈನ್';

  @override
  String get tabHome => 'ಮುಖಪುಟ';

  @override
  String get tabActivity => 'ಚಟುವಟಿಕೆ';

  @override
  String get tabAccount => 'ಖಾತೆ';

  @override
  String get waitingForBookings => 'ಬುಕಿಂಗ್‌ಗಳಿಗಾಗಿ ಕಾಯುತ್ತಿದೆ';

  @override
  String get socketConnected => 'ಸಾಕೆಟ್ ಸಂಪರ್ಕಗೊಂಡಿದೆ';

  @override
  String get socketDisconnected => 'ಸಾಕೆಟ್ ಸಂಪರ್ಕ ಕಡಿತದೆ';

  @override
  String get onlineAndReadyForBookings =>
      'ಆನ್‌ಲೈನ್‌ನಲ್ಲಿದೆ ಮತ್ತು ಬುಕಿಂಗ್‌ಗಳಿಗೆ ಸಿದ್ಧವಾಗಿದೆ';

  @override
  String get busyWithActiveBooking => 'ಸಕ್ರಿಯ ಬುಕಿಂಗ್‌ನೊಂದಿಗೆ ಬ್ಯುಸಿ ಆಗಿದೆ';

  @override
  String get unknownError => 'ಅಪರಿಚಿತ ದೋಷ';

  @override
  String unableToGoOnline(String error) {
    return 'ಆನ್‌ಲೈನ್‌ಗೆ ಹೋಗಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'ಸಾಕೆಟ್ ಲಭ್ಯವಿಲ್ಲ: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಉಳಿಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'ಹಿಂದಿನ ಬುಕಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name ಅನ್ನು ಸ್ವೀಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'ಬುಕಿಂಗ್ ಸ್ವೀಕರಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'ಬುಕಿಂಗ್ #$id ಅನ್ನು ಇನ್ನೊಬ್ಬ ಪಂಡಿತ್ ಸ್ವೀಕರಿಸಿದ್ದಾರೆ.';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'ಬುಕಿಂಗ್ #$id ಆಫರ್ ಅವಧಿ ಮುಗಿದಿದೆ.';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'ಬುಕಿಂಗ್ #$id ಇನ್ನು ಮುಂದೆ ಲಭ್ಯವಿಲ್ಲ.';
  }

  @override
  String rejectedBooking(String name) {
    return '$name ಅನ್ನು ತಿರಸ್ಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'ಬುಕಿಂಗ್ ತಿರಸ್ಕರಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get unableToAcceptBooking => 'ಬುಕಿಂಗ್ ಸ್ವೀಕರಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get unableToRejectBooking => 'ಬುಕಿಂಗ್ ತಿರಸ್ಕರಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get unableToCompleteBooking => 'ಬುಕಿಂಗ್ ಪೂರ್ಣಗೊಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String completedBooking(String name) {
    return '$name ಪೂರ್ಣಗೊಂಡಿದೆ';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'ಬುಕಿಂಗ್ ಪೂರ್ಣಗೊಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'ಬುಕಿಂಗ್ ಪ್ರಾರಂಭಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }
}
