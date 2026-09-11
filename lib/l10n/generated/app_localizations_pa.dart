// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਪੂਜਾ ਪੰਡਿਤ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get yes => 'ਹਾਂ';

  @override
  String get no => 'ਨਹੀਂ';

  @override
  String get pleaseEnterValidPhone => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ।';

  @override
  String autoVerificationFailed(String error) {
    return 'ਆਟੋ-ਪੁਸ਼ਟੀਕਰਨ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get verificationFailed => 'ਪੁਸ਼ਟੀਕਰਨ ਅਸਫਲ ਰਿਹਾ।';

  @override
  String get otpSentSuccessfully => 'OTP ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ।';

  @override
  String unableToSendOtp(String error) {
    return 'OTP ਭੇਜਣ ਵਿੱਚ ਅਸਮਰੱਥ: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ OTP ਦਰਜ ਕਰੋ ਜਾਂ ਨਵੇਂ ਦੀ ਬੇਨਤੀ ਕਰੋ।';

  @override
  String get invalidOtp => 'ਗਲਤ OTP।';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP ਪੁਸ਼ਟੀਕਰਨ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'ਕੋਈ ਪ੍ਰਮਾਣਿਤ ਵਰਤੋਂਕਾਰ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get firebaseUserTokenEmpty => 'Firebase ਵਰਤੋਂਕਾਰ ਟੋਕਨ ਖਾਲੀ ਹੈ।';

  @override
  String get backendInvalidTokens => 'ਬੈਕਐਂਡ API ਨੇ ਵੈਧ ਟੋਕਨ ਵਾਪਸ ਨਹੀਂ ਦਿੱਤੇ।';

  @override
  String loginFailed(String error) {
    return 'ਲੌਗਇਨ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'ਵਾਪਸੀ \'ਤੇ ਸੁਆਗਤ ਹੈ! ਆਪਣੇ ਮੋਬਾਈਲ ਨੰਬਰ ਨਾਲ ਸਾਈਨ ਇਨ ਕਰੋ';

  @override
  String get verifyOtp => 'OTP ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get mobileNumber => 'ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get enterOtpSentToMobile =>
      'ਆਪਣੇ ਮੋਬਾਈਲ \'ਤੇ ਭੇਜਿਆ 6-ਅੰਕਾਂ ਦਾ OTP ਦਰਜ ਕਰੋ।';

  @override
  String get willSendOneTimePassword =>
      'ਅਸੀਂ ਤੁਹਾਡੇ ਨੰਬਰ \'ਤੇ ਇੱਕ ਵਾਰ ਦਾ ਪਾਸਵਰਡ ਭੇਜਾਂਗੇ।';

  @override
  String get codeLabel => 'ਕੋਡ';

  @override
  String get phoneNumberLabel => 'ਫ਼ੋਨ ਨੰਬਰ';

  @override
  String get changeNumber => 'ਨੰਬਰ ਬਦਲੋ';

  @override
  String get sendOtp => 'OTP ਭੇਜੋ';

  @override
  String registrationFailed(String error) {
    return 'ਰਜਿਸਟ੍ਰੇਸ਼ਨ ਅਸਫਲ ਰਹੀ: $error';
  }

  @override
  String get completeYourProfile => 'ਆਪਣੀ ਪ੍ਰੋਫਾਈਲ ਪੂਰੀ ਕਰੋ';

  @override
  String get addRemainingDetails =>
      'ਐਪ ਵਰਤਣਾ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਬਾਕੀ ਵੇਰਵੇ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get fullNameLabel => 'ਪੂਰਾ ਨਾਮ';

  @override
  String get nameRequired => 'ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get emailLabel => 'ਈਮੇਲ';

  @override
  String get emailRequired => 'ਈਮੇਲ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get phoneNumberFieldLabel => 'ਫ਼ੋਨ ਨੰਬਰ';

  @override
  String get phoneNumberRequired => 'ਫ਼ੋਨ ਨੰਬਰ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get dateOfBirthLabel => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get dobRequired => 'ਜਨਮ ਮਿਤੀ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get genderLabel => 'ਲਿੰਗ';

  @override
  String get genderRequired => 'ਲਿੰਗ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get genderMale => 'ਪੁਰਸ਼';

  @override
  String get genderFemale => 'ਇਸਤਰੀ';

  @override
  String get specializationLabel => 'ਵਿਸ਼ੇਸ਼ਤਾ';

  @override
  String get specializationRequired => 'ਵਿਸ਼ੇਸ਼ਤਾ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get languageLabel => 'ਭਾਸ਼ਾ';

  @override
  String get languageRequired => 'ਭਾਸ਼ਾ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get languageOptionEnglish => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get languageOptionMalayalam => 'ਮਲਿਆਲਮ';

  @override
  String get languageOptionTamil => 'ਤਮਿਲ';

  @override
  String get languageOptionHindi => 'ਹਿੰਦੀ';

  @override
  String get bioLabel => 'ਬਾਇਓ';

  @override
  String get bioRequired => 'ਬਾਇਓ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get continueLabel => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get profileNotFound => 'ਪ੍ਰੋਫਾਈਲ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get unableToLoadProfile => 'ਪ੍ਰੋਫਾਈਲ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ।';

  @override
  String get logOutQuestion => 'ਲੌਗ ਆਉਟ ਕਰਨਾ ਹੈ?';

  @override
  String get signInAgainMessage =>
      'ਐਪ ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ ਤੁਹਾਨੂੰ ਦੁਬਾਰਾ ਸਾਈਨ ਇਨ ਕਰਨਾ ਪਵੇਗਾ।';

  @override
  String get logOut => 'ਲੌਗ ਆਉਟ';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਲੌਗ ਆਉਟ ਹੋ ਗਿਆ। ਸਰਵਰ ਸਿੰਕ ਅਸਫਲ ਰਿਹਾ।';

  @override
  String get accountAndSettings => 'ਖਾਤਾ ਅਤੇ ਸੈਟਿੰਗਾਂ';

  @override
  String get loadingProfile => 'ਪ੍ਰੋਫਾਈਲ ਲੋਡ ਹੋ ਰਹੀ ਹੈ...';

  @override
  String get panditProfile => 'ਪੰਡਿਤ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'ਤੁਹਾਡੀ ਪ੍ਰੋਫਾਈਲ ਦੇ ਵੇਰਵੇ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ';

  @override
  String get acceptInstantRequests => 'ਤੁਰੰਤ ਬੇਨਤੀਆਂ ਸਵੀਕਾਰ ਕਰੋ';

  @override
  String get getNotifiedNewRequest => 'ਨਵੀਂ ਪੂਜਾ ਬੇਨਤੀ ਆਉਣ \'ਤੇ ਸੂਚਿਤ ਕਰੋ';

  @override
  String get socketLiveUpdates => 'ਸਾਕਟ ਲਾਈਵ ਅੱਪਡੇਟ';

  @override
  String get keepBookingFeedSynced => 'ਬੁਕਿੰਗ ਫੀਡ ਨੂੰ ਸਿੰਕ ਰੱਖੋ';

  @override
  String get currentBookingStatus => 'ਮੌਜੂਦਾ ਬੁਕਿੰਗ ਸਥਿਤੀ';

  @override
  String get noActiveBooking => 'ਕੋਈ ਸਰਗਰਮ ਬੁਕਿੰਗ ਨਹੀਂ';

  @override
  String get loggingOut => 'ਲੌਗ ਆਉਟ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get pastBookings => 'ਪਿਛਲੀਆਂ ਬੁਕਿੰਗਾਂ';

  @override
  String get noCompletedBookingsYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਪੂਰੀ ਹੋਈ ਬੁਕਿੰਗ ਨਹੀਂ।';

  @override
  String get previousPage => 'ਪਿਛਲਾ ਪੰਨਾ';

  @override
  String get nextPage => 'ਅਗਲਾ ਪੰਨਾ';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'ਪੂਜਾ ਸੇਵਾ';

  @override
  String get dietyNotSpecified => 'ਦੇਵਤਾ ਨਿਰਧਾਰਿਤ ਨਹੀਂ';

  @override
  String get crowdPrayerTag => 'ਸਮੂਹਿਕ ਪ੍ਰਾਰਥਨਾ';

  @override
  String get bookedFor => 'ਕਿਸ ਲਈ ਬੁੱਕ ਕੀਤਾ ਗਿਆ';

  @override
  String get nameNotProvided => 'ਨਾਮ ਪ੍ਰਦਾਨ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String get birthStar => 'ਜਨਮ ਨਕਸ਼ੱਤਰ';

  @override
  String get bookedOn => 'ਬੁੱਕ ਕੀਤਾ ਗਿਆ';

  @override
  String get panditLabel => 'ਪੰਡਿਤ';

  @override
  String get completedLabel => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String get notesLabel => 'ਨੋਟਸ';

  @override
  String get statusCompleted => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String get statusAccepted => 'ਸਵੀਕਾਰ ਕੀਤਾ';

  @override
  String get statusRejected => 'ਰੱਦ ਕੀਤਾ';

  @override
  String get statusExpired => 'ਮਿਆਦ ਪੁੱਗੀ';

  @override
  String get statusNoPanditAvailable => 'ਕੋਈ ਪੰਡਿਤ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get statusPending => 'ਬਕਾਇਆ';

  @override
  String get availableBookingOpportunities => 'ਉਪਲਬਧ ਬੁਕਿੰਗ ਮੌਕੇ';

  @override
  String get currentActiveBooking => 'ਮੌਜੂਦਾ ਸਰਗਰਮ ਬੁਕਿੰਗ';

  @override
  String dietyPrefix(String diety) {
    return 'ਦੇਵਤਾ: $diety';
  }

  @override
  String get completeBooking => 'ਬੁਕਿੰਗ ਪੂਰੀ ਕਰੋ';

  @override
  String get freeToAcceptNext =>
      'ਤੁਸੀਂ ਅਗਲੀ ਉਪਲਬਧ ਬੁਕਿੰਗ ਸਵੀਕਾਰ ਕਰਨ ਲਈ ਸੁਤੰਤਰ ਹੋ।';

  @override
  String get noBookingsAvailable => 'ਹੁਣੇ ਕੋਈ ਬੁਕਿੰਗ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get dobShort => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get birthStarShort => 'ਜਨਮ ਨਕਸ਼ੱਤਰ';

  @override
  String get dietyShort => 'ਦੇਵਤਾ';

  @override
  String get crowdPrayerLabel => 'ਸਮੂਹਿਕ ਪ੍ਰਾਰਥਨਾ';

  @override
  String get processing => 'ਪ੍ਰੋਸੈਸ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get finishCurrentTaskFirst => 'ਪਹਿਲਾਂ ਮੌਜੂਦਾ ਕੰਮ ਪੂਰਾ ਕਰੋ';

  @override
  String get acceptRequest => 'ਬੇਨਤੀ ਸਵੀਕਾਰ ਕਰੋ';

  @override
  String get rejectRequestTooltip => 'ਬੇਨਤੀ ਰੱਦ ਕਰੋ';

  @override
  String get statusOnline => 'ਆਨਲਾਈਨ';

  @override
  String get statusBusy => 'ਰੁੱਝਿਆ ਹੋਇਆ';

  @override
  String get statusOffline => 'ਆਫਲਾਈਨ';

  @override
  String get tabHome => 'ਹੋਮ';

  @override
  String get tabActivity => 'ਗਤੀਵਿਧੀ';

  @override
  String get tabAccount => 'ਖਾਤਾ';

  @override
  String get waitingForBookings => 'ਬੁਕਿੰਗਾਂ ਦੀ ਉਡੀਕ ਹੈ';

  @override
  String get socketConnected => 'ਸਾਕਟ ਕਨੈਕਟ ਹੋ ਗਈਆ';

  @override
  String get socketDisconnected => 'ਸਾਕਟ ਡਿਸਕਨੈਕਟ ਹੋ ਗਈਆ';

  @override
  String get onlineAndReadyForBookings => 'ਆਨਲਾਈਨ ਅਤੇ ਬੁਕਿੰਗਾਂ ਲਈ ਤਿਆਰ';

  @override
  String get busyWithActiveBooking => 'ਸਰਗਰਮ ਬੁਕਿੰਗ ਨਾਲ ਰੁੱਝਿਆ ਹੋਇਆ';

  @override
  String get unknownError => 'ਅਣਜਾਣ ਗਲਤੀ';

  @override
  String unableToGoOnline(String error) {
    return 'ਆਨਲਾਈਨ ਜਾਣ ਵਿੱਚ ਅਸਮਰੱਥ: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'ਸਾਕਟ ਉਪਲਬਧ ਨਹੀਂ: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ਆਨਲਾਈਨ ਰਹਿਣ ਵਿੱਚ ਅਸਮਰੱਥ: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'ਪਿਛਲੀਆਂ ਬੁਕਿੰਗਾਂ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀਆਂ: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name ਸਵੀਕਾਰ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'ਬੁਕਿੰਗ ਸਵੀਕਾਰ ਨਹੀਂ ਹੋ ਸਕੀ: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'ਬੁਕਿੰਗ #$id ਕਿਸੇ ਹੋਰ ਪੰਡਿਤ ਦੁਆਰਾ ਸਵੀਕਾਰ ਕੀਤੀ ਗਈ।';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'ਬੁਕਿੰਗ #$id ਪੇਸ਼ਕਸ਼ ਦੀ ਮਿਆਦ ਪੁੱਗ ਗਈ।';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'ਬੁਕਿੰਗ #$id ਹੁਣ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';
  }

  @override
  String rejectedBooking(String name) {
    return '$name ਰੱਦ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'ਬੁਕਿੰਗ ਰੱਦ ਨਹੀਂ ਹੋ ਸਕੀ: $error';
  }

  @override
  String get unableToAcceptBooking => 'ਬੁਕਿੰਗ ਸਵੀਕਾਰ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ';

  @override
  String get unableToRejectBooking => 'ਬੁਕਿੰਗ ਰੱਦ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ';

  @override
  String get unableToCompleteBooking => 'ਬੁਕਿੰਗ ਪੂਰੀ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ';

  @override
  String completedBooking(String name) {
    return '$name ਪੂਰੀ ਹੋਈ';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'ਬੁਕਿੰਗ ਪੂਰੀ ਨਹੀਂ ਹੋ ਸਕੀ: $error';
  }
}
