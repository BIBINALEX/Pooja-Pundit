// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'पूजा पंडित';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get pleaseEnterValidPhone => 'कृपया एक मान्य फ़ोन नंबर दर्ज करें।';

  @override
  String autoVerificationFailed(String error) {
    return 'स्वतः सत्यापन विफल: $error';
  }

  @override
  String get verificationFailed => 'सत्यापन विफल हुआ।';

  @override
  String get otpSentSuccessfully => 'OTP सफलतापूर्वक भेजा गया।';

  @override
  String unableToSendOtp(String error) {
    return 'OTP भेजने में असमर्थ: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'कृपया एक मान्य OTP दर्ज करें या नया अनुरोध करें।';

  @override
  String get invalidOtp => 'अमान्य OTP।';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP सत्यापन विफल: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'कोई प्रमाणित उपयोगकर्ता नहीं मिला।';

  @override
  String get firebaseUserTokenEmpty => 'Firebase उपयोगकर्ता टोकन खाली है।';

  @override
  String get backendInvalidTokens => 'बैकएंड API ने मान्य टोकन नहीं लौटाए।';

  @override
  String loginFailed(String error) {
    return 'लॉगिन विफल: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'वापसी पर स्वागत है! अपने मोबाइल नंबर से साइन इन करें';

  @override
  String get verifyOtp => 'OTP सत्यापित करें';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get enterOtpSentToMobile =>
      'अपने मोबाइल पर भेजा गया 6-अंकीय OTP दर्ज करें।';

  @override
  String get willSendOneTimePassword =>
      'हम आपके नंबर पर एक बार का पासवर्ड भेजेंगे।';

  @override
  String get codeLabel => 'कोड';

  @override
  String get phoneNumberLabel => 'फ़ोन नंबर';

  @override
  String get changeNumber => 'नंबर बदलें';

  @override
  String get sendOtp => 'OTP भेजें';

  @override
  String registrationFailed(String error) {
    return 'पंजीकरण विफल: $error';
  }

  @override
  String get completeYourProfile => 'अपनी प्रोफ़ाइल पूरी करें';

  @override
  String get addRemainingDetails =>
      'ऐप का उपयोग शुरू करने के लिए शेष विवरण जोड़ें।';

  @override
  String get fullNameLabel => 'पूरा नाम';

  @override
  String get nameRequired => 'नाम आवश्यक है';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get emailRequired => 'ईमेल आवश्यक है';

  @override
  String get phoneNumberFieldLabel => 'फ़ोन नंबर';

  @override
  String get phoneNumberRequired => 'फ़ोन नंबर आवश्यक है';

  @override
  String get dateOfBirthLabel => 'जन्म तिथि';

  @override
  String get dobRequired => 'जन्म तिथि आवश्यक है';

  @override
  String get genderLabel => 'लिंग';

  @override
  String get genderRequired => 'लिंग आवश्यक है';

  @override
  String get genderMale => 'पुरुष';

  @override
  String get genderFemale => 'महिला';

  @override
  String get specializationLabel => 'विशेषज्ञता';

  @override
  String get specializationRequired => 'विशेषज्ञता आवश्यक है';

  @override
  String get languageLabel => 'भाषा';

  @override
  String get languageRequired => 'भाषा आवश्यक है';

  @override
  String get languageOptionEnglish => 'अंग्रेज़ी';

  @override
  String get languageOptionMalayalam => 'मलयालम';

  @override
  String get languageOptionTamil => 'तमिल';

  @override
  String get languageOptionHindi => 'हिन्दी';

  @override
  String get bioLabel => 'बायो';

  @override
  String get bioRequired => 'बायो आवश्यक है';

  @override
  String get continueLabel => 'जारी रखें';

  @override
  String get profileNotFound => 'प्रोफ़ाइल नहीं मिली।';

  @override
  String get unableToLoadProfile => 'प्रोफ़ाइल लोड करने में असमर्थ।';

  @override
  String get logOutQuestion => 'लॉग आउट करें?';

  @override
  String get signInAgainMessage =>
      'ऐप का उपयोग जारी रखने के लिए आपको फिर से साइन इन करना होगा।';

  @override
  String get logOut => 'लॉग आउट';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'स्थानीय रूप से लॉग आउट किया गया। सर्वर सिंक विफल हुआ।';

  @override
  String get accountAndSettings => 'खाता और सेटिंग्स';

  @override
  String get loadingProfile => 'प्रोफ़ाइल लोड हो रही है...';

  @override
  String get panditProfile => 'पंडित प्रोफ़ाइल';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'आपकी प्रोफ़ाइल का विवरण यहाँ दिखाई देगा';

  @override
  String get acceptInstantRequests => 'तुरंत अनुरोध स्वीकार करें';

  @override
  String get getNotifiedNewRequest => 'नई पूजा अनुरोध आने पर सूचित हों';

  @override
  String get socketLiveUpdates => 'सॉकेट लाइव अपडेट';

  @override
  String get keepBookingFeedSynced => 'बुकिंग फ़ीड को सिंक रखें';

  @override
  String get currentBookingStatus => 'वर्तमान बुकिंग स्थिति';

  @override
  String get noActiveBooking => 'कोई सक्रिय बुकिंग नहीं';

  @override
  String get loggingOut => 'लॉग आउट हो रहा है...';

  @override
  String get pastBookings => 'पिछली बुकिंग';

  @override
  String get noCompletedBookingsYet => 'अभी तक कोई पूर्ण बुकिंग नहीं है।';

  @override
  String get previousPage => 'पिछला पृष्ठ';

  @override
  String get nextPage => 'अगला पृष्ठ';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'पूजा सेवा';

  @override
  String get dietyNotSpecified => 'देवता निर्दिष्ट नहीं है';

  @override
  String get crowdPrayerTag => 'सामूहिक प्रार्थना';

  @override
  String get bookedFor => 'किसके लिए बुक किया गया';

  @override
  String get nameNotProvided => 'नाम प्रदान नहीं किया गया';

  @override
  String get birthStar => 'जन्म नक्षत्र';

  @override
  String get bookedOn => 'बुक किया गया';

  @override
  String get panditLabel => 'पंडित';

  @override
  String get completedLabel => 'पूर्ण हुआ';

  @override
  String get notesLabel => 'टिप्पणियाँ';

  @override
  String get statusCompleted => 'पूर्ण हुआ';

  @override
  String get statusAccepted => 'स्वीकृत';

  @override
  String get statusOngoing => 'जारी';

  @override
  String get statusRejected => 'अस्वीकृत';

  @override
  String get statusExpired => 'समाप्त';

  @override
  String get statusNoPanditAvailable => 'कोई पंडित उपलब्ध नहीं';

  @override
  String get statusPending => 'लंबित';

  @override
  String get availableBookingOpportunities => 'उपलब्ध बुकिंग अवसर';

  @override
  String get currentActiveBooking => 'वर्तमान सक्रिय बुकिंग';

  @override
  String dietyPrefix(String diety) {
    return 'देवता: $diety';
  }

  @override
  String get completeBooking => 'बुकिंग पूर्ण करें';

  @override
  String get startBooking => 'अरपनम शुरू करें';

  @override
  String get uploadArpanamVideo => 'अरपनम का वीडियो जोड़ें';

  @override
  String get videoUploaded => 'अरपनम का वीडियो अपलोड हो गया';

  @override
  String get invalidArpanamVideo => 'कृपया मान्य वीडियो फ़ाइल चुनें।';

  @override
  String get videoCompressionFailed => 'वीडियो को संपीड़ित नहीं किया जा सका।';

  @override
  String videoUploadFailed(String error) {
    return 'वीडियो अपलोड विफल हुआ: $error';
  }

  @override
  String get freeToAcceptNext =>
      'आप अगली उपलब्ध बुकिंग स्वीकार करने के लिए स्वतंत्र हैं।';

  @override
  String get noBookingsAvailable => 'अभी कोई बुकिंग उपलब्ध नहीं है।';

  @override
  String get dobShort => 'जन्म तिथि';

  @override
  String get birthStarShort => 'जन्म नक्षत्र';

  @override
  String get dietyShort => 'देवता';

  @override
  String get crowdPrayerLabel => 'सामूहिक प्रार्थना';

  @override
  String get processing => 'प्रोसेस हो रहा है...';

  @override
  String get finishCurrentTaskFirst => 'पहले वर्तमान कार्य पूरा करें';

  @override
  String get acceptRequest => 'अनुरोध स्वीकार करें';

  @override
  String get rejectRequestTooltip => 'अनुरोध अस्वीकार करें';

  @override
  String rejectBookingWarning(String name) {
    return '$name को अस्वीकार करने पर बुकिंग आपकी सूची से हट जाएगी। इसे वापस नहीं किया जा सकता।';
  }

  @override
  String get statusOnline => 'ऑनलाइन';

  @override
  String get statusBusy => 'व्यस्त';

  @override
  String get statusOffline => 'ऑफ़लाइन';

  @override
  String get tabHome => 'होम';

  @override
  String get tabActivity => 'गतिविधि';

  @override
  String get tabAccount => 'खाता';

  @override
  String get waitingForBookings => 'बुकिंग की प्रतीक्षा है';

  @override
  String get socketConnected => 'सॉकेट कनेक्ट हो गया';

  @override
  String get socketDisconnected => 'सॉकेट डिसकनेक्ट हो गया';

  @override
  String get onlineAndReadyForBookings => 'ऑनलाइन और बुकिंग के लिए तैयार';

  @override
  String get busyWithActiveBooking => 'सक्रिय बुकिंग में व्यस्त';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String unableToGoOnline(String error) {
    return 'ऑनलाइन जाने में असमर्थ: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'सॉकेट अनुपलब्ध: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ऑनलाइन बने रहने में असमर्थ: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'पिछली बुकिंग लोड नहीं हो सकी: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name को स्वीकार किया गया';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'बुकिंग स्वीकार नहीं हो सकी: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'बुकिंग #$id को किसी अन्य पंडित ने स्वीकार कर लिया है।';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'बुकिंग #$id की पेशकश समाप्त हो गई।';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'बुकिंग #$id अब उपलब्ध नहीं है।';
  }

  @override
  String rejectedBooking(String name) {
    return '$name को अस्वीकार किया गया';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'बुकिंग अस्वीकार नहीं हो सकी: $error';
  }

  @override
  String get unableToAcceptBooking => 'बुकिंग स्वीकार करने में असमर्थ';

  @override
  String get unableToRejectBooking => 'बुकिंग अस्वीकार करने में असमर्थ';

  @override
  String get unableToCompleteBooking => 'बुकिंग पूर्ण करने में असमर्थ';

  @override
  String completedBooking(String name) {
    return '$name पूर्ण हुई';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'बुकिंग पूर्ण नहीं हो सकी: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'बुकिंग शुरू नहीं हो सकी: $error';
  }
}
