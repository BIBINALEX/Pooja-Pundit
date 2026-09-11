// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'పూజా పండిట్';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get yes => 'అవును';

  @override
  String get no => 'కాదు';

  @override
  String get pleaseEnterValidPhone => 'దయచేసి సరైన ఫోన్ నంబర్ నమోదు చేయండి.';

  @override
  String autoVerificationFailed(String error) {
    return 'స్వయంచాలక ధృవీకరణ విఫలమైంది: $error';
  }

  @override
  String get verificationFailed => 'ధృవీకరణ విఫలమైంది.';

  @override
  String get otpSentSuccessfully => 'OTP విజయవంతంగా పంపబడింది.';

  @override
  String unableToSendOtp(String error) {
    return 'OTP పంపడం సాధ్యం కాలేదు: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'దయచేసి సరైన OTP నమోదు చేయండి లేదా కొత్తది కోరండి.';

  @override
  String get invalidOtp => 'చెల్లని OTP.';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP ధృవీకరణ విఫలమైంది: $error';
  }

  @override
  String get noAuthenticatedUserFound =>
      'ప్రామాణీకరించిన వినియోగదారు కనుగొనబడలేదు.';

  @override
  String get firebaseUserTokenEmpty =>
      'Firebase వినియోగదారు టోకెన్ ఖాళీగా ఉంది.';

  @override
  String get backendInvalidTokens =>
      'బ్యాకెండ్ API చెల్లుబాటు అయ్యే టోకెన్‌లను తిరిగి ఇవ్వలేదు.';

  @override
  String loginFailed(String error) {
    return 'లాగిన్ విఫలమైంది: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'తిరిగి స్వాగతం! మీ మొబైల్ నంబర్‌తో సైన్ ఇన్ చేయండి';

  @override
  String get verifyOtp => 'OTP ధృవీకరించండి';

  @override
  String get mobileNumber => 'మొబైల్ నంబర్';

  @override
  String get enterOtpSentToMobile =>
      'మీ మొబైల్‌కు పంపిన 6-అంకెల OTPని నమోదు చేయండి.';

  @override
  String get willSendOneTimePassword =>
      'మేము మీ నంబర్‌కు వన్-టైమ్ పాస్‌వర్డ్ పంపుతాము.';

  @override
  String get codeLabel => 'కోడ్';

  @override
  String get phoneNumberLabel => 'ఫోన్ నంబర్';

  @override
  String get changeNumber => 'నంబర్ మార్చండి';

  @override
  String get sendOtp => 'OTP పంపండి';

  @override
  String registrationFailed(String error) {
    return 'నమోదు విఫలమైంది: $error';
  }

  @override
  String get completeYourProfile => 'మీ ప్రొఫైల్‌ను పూర్తి చేయండి';

  @override
  String get addRemainingDetails =>
      'యాప్‌ను ఉపయోగించడం ప్రారంభించడానికి మిగిలిన వివరాలను జోడించండి.';

  @override
  String get fullNameLabel => 'పూర్తి పేరు';

  @override
  String get nameRequired => 'పేరు అవసరం';

  @override
  String get emailLabel => 'ఇమెయిల్';

  @override
  String get emailRequired => 'ఇమెయిల్ అవసరం';

  @override
  String get phoneNumberFieldLabel => 'ఫోన్ నంబర్';

  @override
  String get phoneNumberRequired => 'ఫోన్ నంబర్ అవసరం';

  @override
  String get dateOfBirthLabel => 'పుట్టిన తేదీ';

  @override
  String get dobRequired => 'పుట్టిన తేదీ అవసరం';

  @override
  String get genderLabel => 'లింగం';

  @override
  String get genderRequired => 'లింగం అవసరం';

  @override
  String get genderMale => 'పురుషుడు';

  @override
  String get genderFemale => 'స్త్రీ';

  @override
  String get specializationLabel => 'ప్రత్యేకత';

  @override
  String get specializationRequired => 'ప్రత్యేకత అవసరం';

  @override
  String get languageLabel => 'భాష';

  @override
  String get languageRequired => 'భాష అవసరం';

  @override
  String get languageOptionEnglish => 'ఆంగ్లం';

  @override
  String get languageOptionMalayalam => 'మలయాళం';

  @override
  String get languageOptionTamil => 'తమిళం';

  @override
  String get languageOptionHindi => 'హిందీ';

  @override
  String get bioLabel => 'బయో';

  @override
  String get bioRequired => 'బయో అవసరం';

  @override
  String get continueLabel => 'కొనసాగించు';

  @override
  String get profileNotFound => 'ప్రొఫైల్ కనుగొనబడలేదు.';

  @override
  String get unableToLoadProfile => 'ప్రొఫైల్‌ను లోడ్ చేయడం సాధ్యం కాలేదు.';

  @override
  String get logOutQuestion => 'లాగ్ అవుట్ చేయాలా?';

  @override
  String get signInAgainMessage =>
      'యాప్‌ను ఉపయోగించడానికి మీరు మళ్ళీ సైన్ ఇన్ చేయాల్సి ఉంటుంది.';

  @override
  String get logOut => 'లాగ్ అవుట్';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'స్థానికంగా లాగ్ అవుట్ అయ్యారు. సర్వర్ సమకాలీకరణ విఫలమైంది.';

  @override
  String get accountAndSettings => 'ఖాతా మరియు సెట్టింగ్‌లు';

  @override
  String get loadingProfile => 'ప్రొఫైల్ లోడ్ అవుతోంది...';

  @override
  String get panditProfile => 'పండిట్ ప్రొఫైల్';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'మీ ప్రొఫైల్ వివరాలు ఇక్కడ కనిపిస్తాయి';

  @override
  String get acceptInstantRequests => 'తక్షణ అభ్యర్థనలను ఆమోదించండి';

  @override
  String get getNotifiedNewRequest =>
      'కొత్త పూజ అభ్యర్థన వచ్చినప్పుడు తెలియజేయండి';

  @override
  String get socketLiveUpdates => 'సాకెట్ లైవ్ అప్‌డేట్‌లు';

  @override
  String get keepBookingFeedSynced => 'బుకింగ్ ఫీడ్‌ను సమకాలీకరించి ఉంచండి';

  @override
  String get currentBookingStatus => 'ప్రస్తుత బుకింగ్ స్థితి';

  @override
  String get noActiveBooking => 'క్రియాశీల బుకింగ్ లేదు';

  @override
  String get loggingOut => 'లాగ్ అవుట్ అవుతోంది...';

  @override
  String get pastBookings => 'గత బుకింగ్‌లు';

  @override
  String get noCompletedBookingsYet => 'ఇంకా పూర్తయిన బుకింగ్‌లు లేవు.';

  @override
  String get previousPage => 'మునుపటి పేజీ';

  @override
  String get nextPage => 'తదుపరి పేజీ';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'పూజా సేవ';

  @override
  String get dietyNotSpecified => 'దేవత పేర్కొనబడలేదు';

  @override
  String get crowdPrayerTag => 'సామూహిక ప్రార్థన';

  @override
  String get bookedFor => 'ఎవరి కోసం బుక్ చేయబడింది';

  @override
  String get nameNotProvided => 'పేరు అందించబడలేదు';

  @override
  String get birthStar => 'జన్మ నక్షత్రం';

  @override
  String get bookedOn => 'బుక్ చేసిన తేదీ';

  @override
  String get panditLabel => 'పండిట్';

  @override
  String get completedLabel => 'పూర్తయింది';

  @override
  String get notesLabel => 'గమనికలు';

  @override
  String get statusCompleted => 'పూర్తయింది';

  @override
  String get statusAccepted => 'ఆమోదించింది';

  @override
  String get statusRejected => 'తిరస్కరించబడింది';

  @override
  String get statusExpired => 'గడువు ముగిసింది';

  @override
  String get statusNoPanditAvailable => 'పండితుడు అందుబాటులో లేరు';

  @override
  String get statusPending => 'బాకి ఉంది';

  @override
  String get availableBookingOpportunities =>
      'అందుబాటులో ఉన్న బుకింగ్ అవకాశాలు';

  @override
  String get currentActiveBooking => 'ప్రస్తుత క్రియాశీల బుకింగ్';

  @override
  String dietyPrefix(String diety) {
    return 'దేవత: $diety';
  }

  @override
  String get completeBooking => 'బుకింగ్ పూర్తి చేయండి';

  @override
  String get freeToAcceptNext =>
      'తదుపరి అందుబాటులో ఉన్న బుకింగ్‌ను ఆమోదించడానికి మీరు స్వేచ్ఛగా ఉన్నారు.';

  @override
  String get noBookingsAvailable => 'ప్రస్తుతం బుకింగ్‌లు అందుబాటులో లేవు.';

  @override
  String get dobShort => 'పుట్టిన తేదీ';

  @override
  String get birthStarShort => 'జన్మ నక్షత్రం';

  @override
  String get dietyShort => 'దేవత';

  @override
  String get crowdPrayerLabel => 'సామూహిక ప్రార్థన';

  @override
  String get processing => 'ప్రాసెస్ అవుతోంది...';

  @override
  String get finishCurrentTaskFirst => 'ముందుగా ప్రస్తుత పనిని పూర్తి చేయండి';

  @override
  String get acceptRequest => 'అభ్యర్థనను ఆమోదించండి';

  @override
  String get rejectRequestTooltip => 'అభ్యర్థనను తిరస్కరించండి';

  @override
  String get statusOnline => 'ఆన్‌లైన్';

  @override
  String get statusBusy => 'బిజీగా ఉంది';

  @override
  String get statusOffline => 'ఆఫ్‌లైన్';

  @override
  String get tabHome => 'హోమ్';

  @override
  String get tabActivity => 'కార్యాచరణ';

  @override
  String get tabAccount => 'ఖాతా';

  @override
  String get waitingForBookings => 'బుకింగ్‌ల కోసం వేచి ఉంది';

  @override
  String get socketConnected => 'సాకెట్ కనెక్ట్ అయింది';

  @override
  String get socketDisconnected => 'సాకెట్ డిస్కనెక్ట్ అయింది';

  @override
  String get onlineAndReadyForBookings =>
      'ఆన్‌లైన్‌లో ఉంది, బుకింగ్‌లకు సిద్ధంగా ఉంది';

  @override
  String get busyWithActiveBooking => 'క్రియాశీల బుకింగ్‌తో బిజీగా ఉంది';

  @override
  String get unknownError => 'తెలియని లోపం';

  @override
  String unableToGoOnline(String error) {
    return 'ఆన్‌లైన్‌లోకి వెళ్లడం సాధ్యం కాలేదు: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'సాకెట్ అందుబాటులో లేదు: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ఆన్‌లైన్‌లో ఉండటం సాధ్యం కాలేదు: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'గత బుకింగ్‌లను లోడ్ చేయడం సాధ్యం కాలేదు: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name ఆమోదించబడింది';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'బుకింగ్‌ను ఆమోదించడం సాధ్యం కాలేదు: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'బుకింగ్ #$id మరొక పండిట్ ద్వారా ఆమోదించబడింది.';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'బుకింగ్ #$id ఆఫర్ గడువు ముగిసింది.';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'బుకింగ్ #$id ఇక అందుబాటులో లేదు.';
  }

  @override
  String rejectedBooking(String name) {
    return '$name తిరస్కరించబడింది';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'బుకింగ్‌ను తిరస్కరించడం సాధ్యం కాలేదు: $error';
  }

  @override
  String get unableToAcceptBooking => 'బుకింగ్‌ను ఆమోదించడం సాధ్యం కాలేదు';

  @override
  String get unableToRejectBooking => 'బుకింగ్‌ను తిరస్కరించడం సాధ్యం కాలేదు';

  @override
  String get unableToCompleteBooking => 'బుకింగ్‌ను పూర్తి చేయడం సాధ్యం కాలేదు';

  @override
  String completedBooking(String name) {
    return '$name పూర్తయింది';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'బుకింగ్‌ను పూర్తి చేయడం సాధ్యం కాలేదు: $error';
  }
}
