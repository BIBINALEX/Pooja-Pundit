// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sanskrit (`sa`).
class AppLocalizationsSa extends AppLocalizations {
  AppLocalizationsSa([String locale = 'sa']) : super(locale);

  @override
  String get appTitle => 'पूजा पण्डितः';

  @override
  String get cancel => 'रद्द करोतु';

  @override
  String get yes => 'आम्';

  @override
  String get no => 'न';

  @override
  String get pleaseEnterValidPhone =>
      'कृपया मान्यं दूरभाषसङ्ख्याङ्कं प्रविशतु।';

  @override
  String autoVerificationFailed(String error) {
    return 'स्वयंचालित सत्यापनं विफलम् अभवत्: $error';
  }

  @override
  String get verificationFailed => 'सत्यापनं विफलम् अभवत्।';

  @override
  String get otpSentSuccessfully => 'OTP सफलतया प्रेषितम्।';

  @override
  String unableToSendOtp(String error) {
    return 'OTP प्रेषणं असमर्थम्: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'कृपया मान्यं OTP प्रविशतु अथवा नूतनं प्रार्थयतु।';

  @override
  String get invalidOtp => 'अमान्यः OTP।';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP सत्यापनं विफलम् अभवत्: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'प्रमाणितः उपयोक्ता न प्राप्तः।';

  @override
  String get firebaseUserTokenEmpty =>
      'Firebase उपयोक्तृ चिह्नं रिक्तम् अस्ति।';

  @override
  String get backendInvalidTokens =>
      'पश्चभाग API मान्यानि चिह्नानि न प्रत्यागतवत्।';

  @override
  String loginFailed(String error) {
    return 'प्रवेशः विफलः: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'पुनः स्वागतम्! स्वस्य चलदूरभाष-सङ्ख्यया प्रविशतु';

  @override
  String get verifyOtp => 'OTP सत्यापयतु';

  @override
  String get mobileNumber => 'चलदूरभाष-सङ्ख्या';

  @override
  String get enterOtpSentToMobile =>
      'स्वस्य चलदूरभाषे प्रेषितं ६-अङ्क OTP प्रविशतु।';

  @override
  String get willSendOneTimePassword =>
      'वयं भवतः सङ्ख्यायां एकवारं गुप्तशब्दं प्रेषयिष्यामः।';

  @override
  String get codeLabel => 'सङ्केतः';

  @override
  String get phoneNumberLabel => 'दूरभाषसङ्ख्या';

  @override
  String get changeNumber => 'सङ्ख्यां परिवर्तयतु';

  @override
  String get sendOtp => 'OTP प्रेषयतु';

  @override
  String registrationFailed(String error) {
    return 'पञ्जीकरणं विफलम्: $error';
  }

  @override
  String get completeYourProfile => 'स्वस्य परिचयं पूर्णं कुर्वन्तु';

  @override
  String get addRemainingDetails =>
      'अनुप्रयोगस्य उपयोगं आरभितुं शेषविवरणानि योजयतु।';

  @override
  String get fullNameLabel => 'पूर्णनाम';

  @override
  String get nameRequired => 'नाम आवश्यकम्';

  @override
  String get emailLabel => 'विपत्रम्';

  @override
  String get emailRequired => 'विपत्रम् आवश्यकम्';

  @override
  String get phoneNumberFieldLabel => 'दूरभाषसङ्ख्या';

  @override
  String get phoneNumberRequired => 'दूरभाषसङ्ख्या आवश्यका';

  @override
  String get dateOfBirthLabel => 'जन्मदिनाङ्कः';

  @override
  String get dobRequired => 'जन्मदिनाङ्कः आवश्यकः';

  @override
  String get genderLabel => 'लिङ्गम्';

  @override
  String get genderRequired => 'लिङ्गम् आवश्यकम्';

  @override
  String get genderMale => 'पुरुषः';

  @override
  String get genderFemale => 'स्त्री';

  @override
  String get specializationLabel => 'विशेषज्ञता';

  @override
  String get specializationRequired => 'विशेषज्ञता आवश्यका';

  @override
  String get languageLabel => 'भाषा';

  @override
  String get languageRequired => 'भाषा आवश्यका';

  @override
  String get languageOptionEnglish => 'आङ्ग्लभाषा';

  @override
  String get languageOptionMalayalam => 'मलयाळभाषा';

  @override
  String get languageOptionTamil => 'तमिऴ्भाषा';

  @override
  String get languageOptionHindi => 'हिन्दीभाषा';

  @override
  String get bioLabel => 'परिचयः';

  @override
  String get bioRequired => 'परिचयः आवश्यकः';

  @override
  String get continueLabel => 'अग्रे गच्छतु';

  @override
  String get profileNotFound => 'परिचयः न प्राप्तः।';

  @override
  String get unableToLoadProfile => 'परिचयं लोड् कर्तुं असमर्थम्।';

  @override
  String get logOutQuestion => 'निर्गमनं करिष्यति वा?';

  @override
  String get signInAgainMessage =>
      'अनुप्रयोगं प्राप्तुं भवद्भिः पुनः प्रवेशः करणीयः।';

  @override
  String get logOut => 'निर्गमनम्';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'स्थानीयरूपेण निर्गतः। सर्वर-सिङ्क् विफलः अभवत्।';

  @override
  String get accountAndSettings => 'लेखा तथा सेटिङ्ग्स्';

  @override
  String get loadingProfile => 'परिचयः लोड् भवति...';

  @override
  String get panditProfile => 'पण्डित-परिचयः';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'भवतः परिचयविवरणानि अत्र दृश्यन्ते';

  @override
  String get acceptInstantRequests => 'तात्कालिक-अनुरोधान् स्वीकुर्वन्तु';

  @override
  String get getNotifiedNewRequest => 'नूतन-पूजा-अनुरोधे सूचनां प्राप्नुवन्तु';

  @override
  String get socketLiveUpdates => 'साकेट् जीवन्त-अद्यतनानि';

  @override
  String get keepBookingFeedSynced => 'आरक्षण-प्रवाहं समकालिकं राखतु';

  @override
  String get currentBookingStatus => 'वर्तमान-आरक्षण-स्थितिः';

  @override
  String get noActiveBooking => 'कोऽपि सक्रिय-आरक्षणः नास्ति';

  @override
  String get loggingOut => 'निर्गमनं भवति...';

  @override
  String get pastBookings => 'गत-आरक्षणानि';

  @override
  String get noCompletedBookingsYet => 'अद्यापि कोऽपि पूर्णः आरक्षणः नास्ति।';

  @override
  String get previousPage => 'पूर्वपृष्ठम्';

  @override
  String get nextPage => 'अग्रिमपृष्ठम्';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'पूजा-सेवा';

  @override
  String get dietyNotSpecified => 'देवता न निर्दिष्टा';

  @override
  String get crowdPrayerTag => 'सामूहिक-प्रार्थना';

  @override
  String get bookedFor => 'कस्यकृते आरक्षितम्';

  @override
  String get nameNotProvided => 'नाम न प्रदत्तम्';

  @override
  String get birthStar => 'जन्मनक्षत्रम्';

  @override
  String get bookedOn => 'आरक्षितदिनाङ्कः';

  @override
  String get panditLabel => 'पण्डितः';

  @override
  String get completedLabel => 'पूर्णम्';

  @override
  String get notesLabel => 'टिप्पण्यः';

  @override
  String get statusCompleted => 'पूर्णम्';

  @override
  String get statusAccepted => 'स्वीकृतम्';

  @override
  String get statusRejected => 'निराकृतम्';

  @override
  String get statusExpired => 'समाप्तम्';

  @override
  String get statusNoPanditAvailable => 'कोणोऽपि पण्डितः न उपलब्धः';

  @override
  String get statusPending => 'प्रलम्बितम्';

  @override
  String get availableBookingOpportunities => 'उपलब्ध-आरक्षण-अवसराः';

  @override
  String get currentActiveBooking => 'वर्तमान-सक्रिय-आरक्षणम्';

  @override
  String dietyPrefix(String diety) {
    return 'देवता: $diety';
  }

  @override
  String get completeBooking => 'आरक्षणं पूर्णं कुर्वन्तु';

  @override
  String get freeToAcceptNext =>
      'भवान् अग्रिम-उपलब्ध-आरक्षणं स्वीकर्तुं स्वतन्त्रः अस्ति।';

  @override
  String get noBookingsAvailable => 'सम्प्रति कोऽपि आरक्षणः उपलब्धः नास्ति।';

  @override
  String get dobShort => 'जन्मदिनाङ्कः';

  @override
  String get birthStarShort => 'जन्मनक्षत्रम्';

  @override
  String get dietyShort => 'देवता';

  @override
  String get crowdPrayerLabel => 'सामूहिक-प्रार्थना';

  @override
  String get processing => 'प्रक्रिया भवति...';

  @override
  String get finishCurrentTaskFirst => 'प्रथमं वर्तमान-कार्यं समापयतु';

  @override
  String get acceptRequest => 'अनुरोधं स्वीकुर्वन्तु';

  @override
  String get rejectRequestTooltip => 'अनुरोधं निराकुर्वन्तु';

  @override
  String get statusOnline => 'सक्रियः';

  @override
  String get statusBusy => 'व्यस्तः';

  @override
  String get statusOffline => 'निष्क्रियः';

  @override
  String get tabHome => 'गृहम्';

  @override
  String get tabActivity => 'क्रियाकलापः';

  @override
  String get tabAccount => 'लेखा';

  @override
  String get waitingForBookings => 'आरक्षणानां प्रतीक्षा भवति';

  @override
  String get socketConnected => 'साकेट् संयोजितम्';

  @override
  String get socketDisconnected => 'साकेट् वियोजितम्';

  @override
  String get onlineAndReadyForBookings => 'सक्रियः अस्ति तथा आरक्षणेभ्यः सज्जः';

  @override
  String get busyWithActiveBooking => 'सक्रिय-आरक्षणेन व्यस्तः';

  @override
  String get unknownError => 'अज्ञात-दोषः';

  @override
  String unableToGoOnline(String error) {
    return 'सक्रियं गन्तुं असमर्थम्: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'साकेट् उपलब्धः नास्ति: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'सक्रियरूपेण स्थातुं असमर्थम्: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'गत-आरक्षणानि लोड् कर्तुं न शक्तम्: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name स्वीकृतः';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'आरक्षणं स्वीकर्तुं न शक्तम्: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'आरक्षणम् #$id अन्येन पण्डितेन स्वीकृतम्।';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'आरक्षणम् #$id प्रस्तावः समाप्तः अभवत्।';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'आरक्षणम् #$id पुनः उपलब्धः नास्ति।';
  }

  @override
  String rejectedBooking(String name) {
    return '$name निराकृतः';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'आरक्षणं निराकर्तुं न शक्तम्: $error';
  }

  @override
  String get unableToAcceptBooking => 'आरक्षणं स्वीकर्तुं असमर्थम्';

  @override
  String get unableToRejectBooking => 'आरक्षणं निराकर्तुं असमर्थम्';

  @override
  String get unableToCompleteBooking => 'आरक्षणं पूर्णं कर्तुं असमर्थम्';

  @override
  String completedBooking(String name) {
    return '$name पूर्णः अभवत्';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'आरक्षणं पूर्णं कर्तुं न शक्तम्: $error';
  }
}
