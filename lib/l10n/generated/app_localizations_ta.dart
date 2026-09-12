// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'பூஜா பண்டிட்';

  @override
  String get cancel => 'ரத்து செய்';

  @override
  String get yes => 'ஆம்';

  @override
  String get no => 'இல்லை';

  @override
  String get pleaseEnterValidPhone => 'சரியான தொலைபேசி எண்ணை உள்ளிடவும்.';

  @override
  String autoVerificationFailed(String error) {
    return 'தானியங்கி சரிபார்ப்பு தோல்வியடைந்தது: $error';
  }

  @override
  String get verificationFailed => 'சரிபார்ப்பு தோல்வியடைந்தது.';

  @override
  String get otpSentSuccessfully => 'OTP வெற்றிகரமாக அனுப்பப்பட்டது.';

  @override
  String unableToSendOtp(String error) {
    return 'OTP அனுப்ப முடியவில்லை: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'சரியான OTP-ஐ உள்ளிடவும் அல்லது புதிய ஒன்றைக் கோரவும்.';

  @override
  String get invalidOtp => 'தவறான OTP.';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP சரிபார்ப்பு தோல்வியடைந்தது: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'அங்கீகரிக்கப்பட்ட பயனர் இல்லை.';

  @override
  String get firebaseUserTokenEmpty => 'Firebase பயனர் டோக்கன் காலியாக உள்ளது.';

  @override
  String get backendInvalidTokens => 'பின்தள API சரியான டோக்கன்களைத் தரவில்லை.';

  @override
  String loginFailed(String error) {
    return 'உள்நுழைவு தோல்வியடைந்தது: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'மீண்டும் வரவேற்கிறோம்! உங்கள் மொபைல் எண்ணுடன் உள்நுழையவும்';

  @override
  String get verifyOtp => 'OTP-ஐ சரிபார்க்கவும்';

  @override
  String get mobileNumber => 'மொபைல் எண்';

  @override
  String get enterOtpSentToMobile =>
      'உங்கள் மொபைலுக்கு அனுப்பப்பட்ட 6-இலக்க OTP-ஐ உள்ளிடவும்.';

  @override
  String get willSendOneTimePassword =>
      'உங்கள் எண்ணுக்கு ஒரு முறை கடவுச்சொல்லை அனுப்புவோம்.';

  @override
  String get codeLabel => 'குறியீடு';

  @override
  String get phoneNumberLabel => 'தொலைபேசி எண்';

  @override
  String get changeNumber => 'எண்ணை மாற்று';

  @override
  String get sendOtp => 'OTP அனுப்பு';

  @override
  String registrationFailed(String error) {
    return 'பதிவு தோல்வியடைந்தது: $error';
  }

  @override
  String get completeYourProfile => 'உங்கள் சுயவிவரத்தை நிறைவு செய்யவும்';

  @override
  String get addRemainingDetails =>
      'பயன்பாட்டைத் தொடங்க மீதமுள்ள விவரங்களைச் சேர்க்கவும்.';

  @override
  String get fullNameLabel => 'முழு பெயர்';

  @override
  String get nameRequired => 'பெயர் தேவை';

  @override
  String get emailLabel => 'மின்னஞ்சல்';

  @override
  String get emailRequired => 'மின்னஞ்சல் தேவை';

  @override
  String get phoneNumberFieldLabel => 'தொலைபேசி எண்';

  @override
  String get phoneNumberRequired => 'தொலைபேசி எண் தேவை';

  @override
  String get dateOfBirthLabel => 'பிறந்த தேதி';

  @override
  String get dobRequired => 'பிறந்த தேதி தேவை';

  @override
  String get genderLabel => 'பாலினம்';

  @override
  String get genderRequired => 'பாலினம் தேவை';

  @override
  String get genderMale => 'ஆண்';

  @override
  String get genderFemale => 'பெண்';

  @override
  String get specializationLabel => 'நிபுணத்துவம்';

  @override
  String get specializationRequired => 'நிபுணத்துவம் தேவை';

  @override
  String get languageLabel => 'மொழி';

  @override
  String get languageRequired => 'மொழி தேவை';

  @override
  String get languageOptionEnglish => 'ஆங்கிலம்';

  @override
  String get languageOptionMalayalam => 'மலையாளம்';

  @override
  String get languageOptionTamil => 'தமிழ்';

  @override
  String get languageOptionHindi => 'இந்தி';

  @override
  String get bioLabel => 'சுயவிவரக் குறிப்பு';

  @override
  String get bioRequired => 'சுயவிவரக் குறிப்பு தேவை';

  @override
  String get continueLabel => 'தொடரவும்';

  @override
  String get profileNotFound => 'சுயவிவரம் கிடைக்கவில்லை.';

  @override
  String get unableToLoadProfile => 'சுயவிவரத்தை ஏற்ற முடியவில்லை.';

  @override
  String get logOutQuestion => 'வெளியேறவா?';

  @override
  String get signInAgainMessage =>
      'பயன்பாட்டை அணுக மீண்டும் உள்நுழைய வேண்டும்.';

  @override
  String get logOut => 'வெளியேறு';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'உள்ளூரில் வெளியேறியது. சேவையக ஒத்திசைவு தோல்வியடைந்தது.';

  @override
  String get accountAndSettings => 'கணக்கு மற்றும் அமைப்புகள்';

  @override
  String get loadingProfile => 'சுயவிவரம் ஏற்றப்படுகிறது...';

  @override
  String get panditProfile => 'பண்டிட் சுயவிவரம்';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'உங்கள் சுயவிவர விவரங்கள் இங்கே தோன்றும்';

  @override
  String get acceptInstantRequests => 'உடனடி கோரிக்கைகளை ஏற்கவும்';

  @override
  String get getNotifiedNewRequest =>
      'புதிய பூஜை கோரிக்கை வரும்போது அறிவிப்பு பெறவும்';

  @override
  String get socketLiveUpdates => 'சாக்கெட் நேரடி புதுப்பிப்புகள்';

  @override
  String get keepBookingFeedSynced => 'முன்பதிவு ஃபீடை ஒத்திசைவாக வைக்கவும்';

  @override
  String get currentBookingStatus => 'தற்போதைய முன்பதிவு நிலை';

  @override
  String get noActiveBooking => 'செயலில் முன்பதிவு இல்லை';

  @override
  String get loggingOut => 'வெளியேறுகிறது...';

  @override
  String get pastBookings => 'கடந்த முன்பதிவுகள்';

  @override
  String get noCompletedBookingsYet =>
      'இதுவரை நிறைவு செய்யப்பட்ட முன்பதிவுகள் இல்லை.';

  @override
  String get previousPage => 'முந்தைய பக்கம்';

  @override
  String get nextPage => 'அடுத்த பக்கம்';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'பூஜை சேவை';

  @override
  String get dietyNotSpecified => 'தெய்வம் குறிப்பிடப்படவில்லை';

  @override
  String get crowdPrayerTag => 'கூட்டு பிரார்த்தனை';

  @override
  String get bookedFor => 'முன்பதிவு செய்யப்பட்டவர்';

  @override
  String get nameNotProvided => 'பெயர் வழங்கப்படவில்லை';

  @override
  String get birthStar => 'பிறந்த நட்சத்திரம்';

  @override
  String get bookedOn => 'முன்பதிவு செய்யப்பட்ட தேதி';

  @override
  String get panditLabel => 'பண்டிட்';

  @override
  String get completedLabel => 'நிறைவடைந்தது';

  @override
  String get notesLabel => 'குறிப்புகள்';

  @override
  String get statusCompleted => 'முடிந்தது';

  @override
  String get statusAccepted => 'ஏற்கப்பட்டது';

  @override
  String get statusOngoing => 'நடைபெறுகிறது';

  @override
  String get statusRejected => 'நிராகரிக்கப்பட்டது';

  @override
  String get statusExpired => 'காலாவதியானது';

  @override
  String get statusNoPanditAvailable => 'பண்டிட் கிடைக்கவில்லை';

  @override
  String get statusPending => 'நிலுவையில் உள்ளது';

  @override
  String get availableBookingOpportunities =>
      'கிடைக்கும் முன்பதிவு வாய்ப்புகள்';

  @override
  String get currentActiveBooking => 'தற்போதைய செயலில் முன்பதிவு';

  @override
  String dietyPrefix(String diety) {
    return 'தெய்வம்: $diety';
  }

  @override
  String get completeBooking => 'முன்பதிவை நிறைவு செய்';

  @override
  String get startBooking => 'அர்ப்பணம் தொடங்கு';

  @override
  String get uploadArpanamVideo => 'அர்ப்பணத்தின் காணொளியைச் சேர்';

  @override
  String get videoUploaded => 'அர்ப்பணத்தின் காணொளி பதிவேற்றப்பட்டது';

  @override
  String get invalidArpanamVideo =>
      'சரியான காணொளிக் கோப்பைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get videoCompressionFailed => 'காணொளியைச் சுருக்க முடியவில்லை.';

  @override
  String videoUploadFailed(String error) {
    return 'காணொளிப் பதிவேற்றம் தோல்வியடைந்தது: $error';
  }

  @override
  String get freeToAcceptNext =>
      'அடுத்த கிடைக்கும் முன்பதிவை ஏற்க நீங்கள் தயார்.';

  @override
  String get noBookingsAvailable => 'தற்போது முன்பதிவுகள் எதுவும் இல்லை.';

  @override
  String get dobShort => 'பி.தே';

  @override
  String get birthStarShort => 'பிறந்த நட்சத்திரம்';

  @override
  String get dietyShort => 'தெய்வம்';

  @override
  String get crowdPrayerLabel => 'கூட்டு பிரார்த்தனை';

  @override
  String get processing => 'செயலாக்கப்படுகிறது...';

  @override
  String get finishCurrentTaskFirst => 'முதலில் தற்போதைய பணியை முடிக்கவும்';

  @override
  String get acceptRequest => 'கோரிக்கையை ஏற்கவும்';

  @override
  String get rejectRequestTooltip => 'கோரிக்கையை நிராகரி';

  @override
  String rejectBookingWarning(String name) {
    return '$name நிராகரிக்கப்பட்டால், முன்பதிவு உங்கள் பட்டியலிலிருந்து அகற்றப்படும். இதை மீண்டும் மாற்ற முடியாது.';
  }

  @override
  String get statusOnline => 'ஆன்லைன்';

  @override
  String get statusBusy => 'பிஸியாக உள்ளது';

  @override
  String get statusOffline => 'ஆஃப்லைன்';

  @override
  String get tabHome => 'முகப்பு';

  @override
  String get tabActivity => 'செயல்பாடு';

  @override
  String get tabAccount => 'கணக்கு';

  @override
  String get waitingForBookings => 'முன்பதிவுகளுக்காக காத்திருக்கிறது';

  @override
  String get socketConnected => 'சாக்கெட் இணைக்கப்பட்டது';

  @override
  String get socketDisconnected => 'சாக்கெட் துணிக்கப்பட்டது';

  @override
  String get onlineAndReadyForBookings =>
      'ஆன்லைனில் உள்ளது, முன்பதிவுகளுக்குத் தயார்';

  @override
  String get busyWithActiveBooking =>
      'செயலில் உள்ள முன்பதிவுடன் பிஸியாக உள்ளது';

  @override
  String get unknownError => 'அறியப்படாத பிழை';

  @override
  String unableToGoOnline(String error) {
    return 'ஆன்லைனுக்கு செல்ல முடியவில்லை: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'சாக்கெட் கிடைக்கவில்லை: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ஆன்லைனில் தொடர முடியவில்லை: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'கடந்த முன்பதிவுகளை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name ஏற்கப்பட்டது';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'முன்பதிவை ஏற்க முடியவில்லை: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'முன்பதிவு #$id மற்றொரு பண்டிட்டால் ஏற்கப்பட்டது.';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'முன்பதிவு #$id சலுகை காலாவதியானது.';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'முன்பதிவு #$id இனி கிடைக்கவில்லை.';
  }

  @override
  String rejectedBooking(String name) {
    return '$name நிராகரிக்கப்பட்டது';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'முன்பதிவை நிராகரிக்க முடியவில்லை: $error';
  }

  @override
  String get unableToAcceptBooking => 'முன்பதிவை ஏற்க முடியவில்லை';

  @override
  String get unableToRejectBooking => 'முன்பதிவை நிராகரிக்க முடியவில்லை';

  @override
  String get unableToCompleteBooking => 'முன்பதிவை நிறைவு செய்ய முடியவில்லை';

  @override
  String completedBooking(String name) {
    return '$name நிறைவு செய்யப்பட்டது';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'முன்பதிவை நிறைவு செய்ய முடியவில்லை: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'முன்பதிவை தொடங்க முடியவில்லை: $error';
  }
}
