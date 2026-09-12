// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'പൂജാ പണ്ഡിറ്റ്';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get yes => 'അതെ';

  @override
  String get no => 'ഇല്ല';

  @override
  String get pleaseEnterValidPhone => 'ദയവായി സാധുവായ ഫോൺ നമ്പർ നൽകുക.';

  @override
  String autoVerificationFailed(String error) {
    return 'സ്വയമേവയുള്ള സ്ഥിരീകരണം പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get verificationFailed => 'സ്ഥിരീകരണം പരാജയപ്പെട്ടു.';

  @override
  String get otpSentSuccessfully => 'OTP വിജയകരമായി അയച്ചു.';

  @override
  String unableToSendOtp(String error) {
    return 'OTP അയയ്ക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'ദയവായി സാധുവായ OTP നൽകുക അല്ലെങ്കിൽ പുതിയത് അഭ്യർത്ഥിക്കുക.';

  @override
  String get invalidOtp => 'അസാധുവായ OTP.';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP സ്ഥിരീകരണം പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get noAuthenticatedUserFound =>
      'സാധൂകരിച്ച ഉപയോക്താവിനെ കണ്ടെത്തിയില്ല.';

  @override
  String get firebaseUserTokenEmpty => 'Firebase ഉപയോക്തൃ ടോക്കൺ ശൂന്യമാണ്.';

  @override
  String get backendInvalidTokens =>
      'ബാക്കെൻഡ് API സാധുവായ ടോക്കണുകൾ നൽകിയില്ല.';

  @override
  String loginFailed(String error) {
    return 'ലോഗിൻ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'തിരികെ സ്വാഗതം! നിങ്ങളുടെ മൊബൈൽ നമ്പർ ഉപയോഗിച്ച് സൈൻ ഇൻ ചെയ്യുക';

  @override
  String get verifyOtp => 'OTP സ്ഥിരീകരിക്കുക';

  @override
  String get mobileNumber => 'മൊബൈൽ നമ്പർ';

  @override
  String get enterOtpSentToMobile =>
      'നിങ്ങളുടെ മൊബൈലിലേക്ക് അയച്ച 6 അക്ക OTP നൽകുക.';

  @override
  String get willSendOneTimePassword =>
      'നിങ്ങളുടെ നമ്പറിലേക്ക് ഒരു തവണ പാസ്‌വേഡ് അയയ്ക്കും.';

  @override
  String get codeLabel => 'കോഡ്';

  @override
  String get phoneNumberLabel => 'ഫോൺ നമ്പർ';

  @override
  String get changeNumber => 'നമ്പർ മാറ്റുക';

  @override
  String get sendOtp => 'OTP അയയ്ക്കുക';

  @override
  String registrationFailed(String error) {
    return 'രജിസ്ട്രേഷൻ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get completeYourProfile => 'നിങ്ങളുടെ പ്രൊഫൈൽ പൂർത്തിയാക്കുക';

  @override
  String get addRemainingDetails =>
      'ആപ്പ് ഉപയോഗിച്ചു തുടങ്ങാൻ ബാക്കിയുള്ള വിവരങ്ങൾ ചേർക്കുക.';

  @override
  String get fullNameLabel => 'മുഴുവൻ പേര്';

  @override
  String get nameRequired => 'പേര് ആവശ്യമാണ്';

  @override
  String get emailLabel => 'ഇമെയിൽ';

  @override
  String get emailRequired => 'ഇമെയിൽ ആവശ്യമാണ്';

  @override
  String get phoneNumberFieldLabel => 'ഫോൺ നമ്പർ';

  @override
  String get phoneNumberRequired => 'ഫോൺ നമ്പർ ആവശ്യമാണ്';

  @override
  String get dateOfBirthLabel => 'ജനന തീയതി';

  @override
  String get dobRequired => 'ജനന തീയതി ആവശ്യമാണ്';

  @override
  String get genderLabel => 'ലിംഗം';

  @override
  String get genderRequired => 'ലിംഗം ആവശ്യമാണ്';

  @override
  String get genderMale => 'പുരുഷൻ';

  @override
  String get genderFemale => 'സ്ത്രീ';

  @override
  String get specializationLabel => 'സ്പെഷ്യലൈസേഷൻ';

  @override
  String get specializationRequired => 'സ്പെഷ്യലൈസേഷൻ ആവശ്യമാണ്';

  @override
  String get languageLabel => 'ഭാഷ';

  @override
  String get languageRequired => 'ഭാഷ ആവശ്യമാണ്';

  @override
  String get languageOptionEnglish => 'ഇംഗ്ലീഷ്';

  @override
  String get languageOptionMalayalam => 'മലയാളം';

  @override
  String get languageOptionTamil => 'തമിഴ്';

  @override
  String get languageOptionHindi => 'ഹിന്ദി';

  @override
  String get bioLabel => 'ബയോ';

  @override
  String get bioRequired => 'ബയോ ആവശ്യമാണ്';

  @override
  String get continueLabel => 'തുടരുക';

  @override
  String get profileNotFound => 'പ്രൊഫൈൽ കണ്ടെത്തിയില്ല.';

  @override
  String get unableToLoadProfile => 'പ്രൊഫൈൽ ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല.';

  @override
  String get logOutQuestion => 'ലോഗ് ഔട്ട് ചെയ്യണോ?';

  @override
  String get signInAgainMessage =>
      'ആപ്പ് ഉപയോഗിക്കാൻ നിങ്ങൾ വീണ്ടും സൈൻ ഇൻ ചെയ്യേണ്ടിവരും.';

  @override
  String get logOut => 'ലോഗ് ഔട്ട്';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'പ്രാദേശികമായി ലോഗ് ഔട്ട് ചെയ്തു. സെർവർ സമന്വയം പരാജയപ്പെട്ടു.';

  @override
  String get accountAndSettings => 'അക്കൗണ്ടും ക്രമീകരണങ്ങളും';

  @override
  String get loadingProfile => 'പ്രൊഫൈൽ ലോഡ് ചെയ്യുന്നു...';

  @override
  String get panditProfile => 'പണ്ഡിറ്റ് പ്രൊഫൈൽ';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'നിങ്ങളുടെ പ്രൊഫൈൽ വിവരങ്ങൾ ഇവിടെ ദൃശ്യമാകും';

  @override
  String get acceptInstantRequests => 'തൽക്ഷണ അഭ്യർത്ഥനകൾ സ്വീകരിക്കുക';

  @override
  String get getNotifiedNewRequest =>
      'പുതിയ പൂജ അഭ്യർത്ഥന വരുമ്പോൾ അറിയിപ്പ് ലഭിക്കുക';

  @override
  String get socketLiveUpdates => 'സോക്കറ്റ് തത്സമയ അപ്‌ഡേറ്റുകൾ';

  @override
  String get keepBookingFeedSynced =>
      'ബുക്കിംഗ് ഫീഡ് സമന്വയിപ്പിച്ചു നിലനിർത്തുക';

  @override
  String get currentBookingStatus => 'നിലവിലെ ബുക്കിംഗ് സ്ഥിതി';

  @override
  String get noActiveBooking => 'സജീവ ബുക്കിംഗ് ഇല്ല';

  @override
  String get loggingOut => 'ലോഗ് ഔട്ട് ചെയ്യുന്നു...';

  @override
  String get pastBookings => 'മുൻകാല ബുക്കിംഗുകൾ';

  @override
  String get noCompletedBookingsYet => 'ഇതുവരെ പൂർത്തിയായ ബുക്കിംഗുകൾ ഇല്ല.';

  @override
  String get previousPage => 'മുമ്പത്തെ പേജ്';

  @override
  String get nextPage => 'അടുത്ത പേജ്';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'പൂജാ സേവനം';

  @override
  String get dietyNotSpecified => 'ദേവത വ്യക്തമാക്കിയിട്ടില്ല';

  @override
  String get crowdPrayerTag => 'കൂട്ട പ്രാർത്ഥന';

  @override
  String get bookedFor => 'ആർക്ക് വേണ്ടി ബുക്ക് ചെയ്തു';

  @override
  String get nameNotProvided => 'പേര് നൽകിയിട്ടില്ല';

  @override
  String get birthStar => 'ജന്മ നക്ഷത്രം';

  @override
  String get bookedOn => 'ബുക്ക് ചെയ്ത തീയതി';

  @override
  String get panditLabel => 'പണ്ഡിറ്റ്';

  @override
  String get completedLabel => 'പൂർത്തിയായി';

  @override
  String get notesLabel => 'കുറിപ്പുകൾ';

  @override
  String get statusCompleted => 'പൂർത്തിയായി';

  @override
  String get statusAccepted => 'സ്വീകരിച്ചു';

  @override
  String get statusOngoing => 'പുരോഗതിയിൽ';

  @override
  String get statusRejected => 'നിരസിച്ചു';

  @override
  String get statusExpired => 'കാലഹരണപ്പെട്ടു';

  @override
  String get statusNoPanditAvailable => 'പണ്ഡിറ്റ് ലഭ്യമല്ല';

  @override
  String get statusPending => 'തീർപ്പാകാത്തത്';

  @override
  String get availableBookingOpportunities => 'ലഭ്യമായ ബുക്കിംഗ് അവസരങ്ങൾ';

  @override
  String get currentActiveBooking => 'നിലവിലെ സജീവ ബുക്കിംഗ്';

  @override
  String dietyPrefix(String diety) {
    return 'ദേവത: $diety';
  }

  @override
  String get completeBooking => 'ബുക്കിംഗ് പൂർത്തിയാക്കുക';

  @override
  String get startBooking => 'അർപ്പണം ആരംഭിക്കുക';

  @override
  String get uploadArpanamVideo => 'അർപ്പണത്തിന്റെ വീഡിയോ ചേർക്കുക';

  @override
  String get videoUploaded => 'അർപ്പണത്തിന്റെ വീഡിയോ അപ്‌ലോഡ് ചെയ്തു';

  @override
  String get videoFromCamera => 'വീഡിയോ റെക്കോർഡ് ചെയ്യുക';

  @override
  String get videoFromGallery => 'ഗാലറിയിൽ നിന്ന് തിരഞ്ഞെടുക്കുക';

  @override
  String get videoFromFiles => 'ഫയലുകളിൽ നിന്ന് തിരഞ്ഞെടുക്കുക';

  @override
  String get invalidArpanamVideo => 'സാധുവായ ഒരു വീഡിയോ ഫയൽ തിരഞ്ഞെടുക്കുക.';

  @override
  String get videoPickerUnavailable =>
      'വീഡിയോ റെക്കോർഡ് ചെയ്യുകയോ തിരഞ്ഞെടുക്കുകയോ ലഭ്യമല്ല. ആപ്പ് പുനരാരംഭിച്ച് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get videoCompressionFailed => 'വീഡിയോ കംപ്രസ് ചെയ്യാൻ കഴിഞ്ഞില്ല.';

  @override
  String get videoUploadFailed =>
      'വീഡിയോ അപ്‌ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല. വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get freeToAcceptNext =>
      'അടുത്ത ലഭ്യമായ ബുക്കിംഗ് സ്വീകരിക്കാൻ നിങ്ങൾക്ക് സ്വാതന്ത്ര്യമുണ്ട്.';

  @override
  String get noBookingsAvailable => 'ഇപ്പോൾ ബുക്കിംഗുകളൊന്നും ലഭ്യമല്ല.';

  @override
  String get dobShort => 'ജനന തീയതി';

  @override
  String get birthStarShort => 'ജന്മ നക്ഷത്രം';

  @override
  String get dietyShort => 'ദേവത';

  @override
  String get crowdPrayerLabel => 'കൂട്ട പ്രാർത്ഥന';

  @override
  String get processing => 'പ്രോസസ്സ് ചെയ്യുന്നു...';

  @override
  String get finishCurrentTaskFirst => 'ആദ്യം നിലവിലെ ജോലി പൂർത്തിയാക്കുക';

  @override
  String get acceptRequest => 'അഭ്യർത്ഥന സ്വീകരിക്കുക';

  @override
  String get rejectRequestTooltip => 'അഭ്യർത്ഥന നിരസിക്കുക';

  @override
  String rejectBookingWarning(String name) {
    return '$name നിരസിച്ചാൽ ബുക്കിംഗ് നിങ്ങളുടെ പട്ടികയിൽ നിന്ന് നീക്കം ചെയ്യപ്പെടും. ഇത് പഴയപടിയാക്കാൻ കഴിയില്ല.';
  }

  @override
  String get statusOnline => 'ഓൺലൈൻ';

  @override
  String get statusBusy => 'തിരക്കിലാണ്';

  @override
  String get statusOffline => 'ഓഫ്‌ലൈൻ';

  @override
  String get tabHome => 'ഹോം';

  @override
  String get tabActivity => 'പ്രവർത്തനം';

  @override
  String get tabAccount => 'അക്കൗണ്ട്';

  @override
  String get waitingForBookings => 'ബുക്കിംഗുകൾക്കായി കാത്തിരിക്കുന്നു';

  @override
  String get socketConnected => 'സോക്കറ്റ് കനെക്ട് ആയി';

  @override
  String get socketDisconnected => 'സോക്കറ്റ് ഡിസ്കനെക്ട് ആയി';

  @override
  String get onlineAndReadyForBookings => 'ഓൺലൈനിലും ബുക്കിംഗുകൾക്ക് തയ്യാറും';

  @override
  String get busyWithActiveBooking => 'സജീവമായ ബുക്കിംഗിൽ തിരക്കിലാണ്';

  @override
  String get unknownError => 'അജ്ഞാത പിശക്';

  @override
  String unableToGoOnline(String error) {
    return 'ഓൺലൈനിൽ പോകാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'സോക്കറ്റ് ലഭ്യമല്ല: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ഓൺലൈനിൽ തുടരാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'മുൻകാല ബുക്കിംഗുകൾ ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name സ്വീകരിച്ചു';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'ബുക്കിംഗ് സ്വീകരിക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'ബുക്കിംഗ് #$id മറ്റൊരു പണ്ഡിറ്റ് സ്വീകരിച്ചു.';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'ബുക്കിംഗ് #$id ഓഫർ കാലഹരണപ്പെട്ടു.';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'ബുക്കിംഗ് #$id ഇനി ലഭ്യമല്ല.';
  }

  @override
  String rejectedBooking(String name) {
    return '$name നിരസിച്ചു';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'ബുക്കിംഗ് നിരസിക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String get unableToAcceptBooking => 'ബുക്കിംഗ് സ്വീകരിക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get unableToRejectBooking => 'ബുക്കിംഗ് നിരസിക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get unableToCompleteBooking => 'ബുക്കിംഗ് പൂർത്തിയാക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String completedBooking(String name) {
    return '$name പൂർത്തിയാക്കി';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'ബുക്കിംഗ് പൂർത്തിയാക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'ബുക്കിംഗ് ആരംഭിക്കാൻ കഴിഞ്ഞില്ല: $error';
  }
}
