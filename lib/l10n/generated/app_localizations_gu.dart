// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'પૂજા પંડિત';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get yes => 'હા';

  @override
  String get no => 'ના';

  @override
  String get pleaseEnterValidPhone => 'કૃપા કરી માન્ય ફોન નંબર દાખલ કરો.';

  @override
  String autoVerificationFailed(String error) {
    return 'સ્વયં ચકાસણી નિષ્ફળ થઈ: $error';
  }

  @override
  String get verificationFailed => 'ચકાસણી નિષ્ફળ થઈ.';

  @override
  String get otpSentSuccessfully => 'OTP સફળતાપૂર્વક મોકલવામાં આવ્યો.';

  @override
  String unableToSendOtp(String error) {
    return 'OTP મોકલવામાં અસમર્થ: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'કૃપા કરી માન્ય OTP દાખલ કરો અથવા નવો વિનંતી કરો.';

  @override
  String get invalidOtp => 'અમાન્ય OTP.';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP ચકાસણી નિષ્ફળ થઈ: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'કોઈ પ્રમાણિત વપરાશકર્તા મળ્યો નથી.';

  @override
  String get firebaseUserTokenEmpty => 'Firebase વપરાશકર્તા ટોકન ખાલી છે.';

  @override
  String get backendInvalidTokens => 'બેકએન્ડ API એ માન્ય ટોકન પરત આપ્યા નથી.';

  @override
  String loginFailed(String error) {
    return 'લોગિન નિષ્ફળ થયું: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'પાછા સ્વાગત છે! તમારા મોબાઇલ નંબર સાથે સાઇન ઇન કરો';

  @override
  String get verifyOtp => 'OTP ચકાસો';

  @override
  String get mobileNumber => 'મોબાઇલ નંબર';

  @override
  String get enterOtpSentToMobile =>
      'તમારા મોબાઇલ પર મોકલેલ 6-અંકનો OTP દાખલ કરો.';

  @override
  String get willSendOneTimePassword =>
      'અમે તમારા નંબર પર એક વખતનો પાસવર્ડ મોકલીશું.';

  @override
  String get codeLabel => 'કોડ';

  @override
  String get phoneNumberLabel => 'ફોન નંબર';

  @override
  String get changeNumber => 'નંબર બદલો';

  @override
  String get sendOtp => 'OTP મોકલો';

  @override
  String registrationFailed(String error) {
    return 'નોંધણી નિષ્ફળ થઈ: $error';
  }

  @override
  String get completeYourProfile => 'તમારી પ્રોફાઇલ પૂર્ણ કરો';

  @override
  String get addRemainingDetails =>
      'એપ્લિકેશનનો ઉપયોગ શરૂ કરવા માટે બાકીની વિગતો ઉમેરો.';

  @override
  String get fullNameLabel => 'પૂરું નામ';

  @override
  String get nameRequired => 'નામ જરૂરી છે';

  @override
  String get emailLabel => 'ઈમેલ';

  @override
  String get emailRequired => 'ઈમેલ જરૂરી છે';

  @override
  String get phoneNumberFieldLabel => 'ફોન નંબર';

  @override
  String get phoneNumberRequired => 'ફોન નંબર જરૂરી છે';

  @override
  String get dateOfBirthLabel => 'જન્મ તારીખ';

  @override
  String get dobRequired => 'જન્મ તારીખ જરૂરી છે';

  @override
  String get genderLabel => 'લિંગ';

  @override
  String get genderRequired => 'લિંગ જરૂરી છે';

  @override
  String get genderMale => 'પુરુષ';

  @override
  String get genderFemale => 'સ્ત્રી';

  @override
  String get specializationLabel => 'વિશેષતા';

  @override
  String get specializationRequired => 'વિશેષતા જરૂરી છે';

  @override
  String get languageLabel => 'ભાષા';

  @override
  String get languageRequired => 'ભાષા જરૂરી છે';

  @override
  String get languageOptionEnglish => 'અંગ્રેજી';

  @override
  String get languageOptionMalayalam => 'મલયાલમ';

  @override
  String get languageOptionTamil => 'તમિલ';

  @override
  String get languageOptionHindi => 'હિન્દી';

  @override
  String get bioLabel => 'બાયો';

  @override
  String get bioRequired => 'બાયો જરૂરી છે';

  @override
  String get continueLabel => 'ચાલુ રાખો';

  @override
  String get profileNotFound => 'પ્રોફાઇલ મળી નથી.';

  @override
  String get unableToLoadProfile => 'પ્રોફાઇલ લોડ કરવામાં અસમર્થ.';

  @override
  String get logOutQuestion => 'લોગ આઉટ કરવું છે?';

  @override
  String get signInAgainMessage =>
      'એપ્લિકેશનનો ઉપયોગ કરવા માટે તમારે ફરીથી સાઇન ઇન કરવું પડશે.';

  @override
  String get logOut => 'લોગ આઉટ';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'સ્થાનિક રીતે લોગ આઉટ થયું. સર્વર સિંક નિષ્ફળ થયું.';

  @override
  String get accountAndSettings => 'ખાતું અને સેટિંગ્સ';

  @override
  String get loadingProfile => 'પ્રોફાઇલ લોડ થઈ રહી છે...';

  @override
  String get panditProfile => 'પંડિત પ્રોફાઇલ';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'તમારી પ્રોફાઇલની વિગતો અહીં દેખાશે';

  @override
  String get acceptInstantRequests => 'તાત્કાલિક વિનંતીઓ સ્વીકારો';

  @override
  String get getNotifiedNewRequest => 'નવી પૂજા વિનંતી આવે ત્યારે સૂચિત થાઓ';

  @override
  String get socketLiveUpdates => 'સોકેટ લાઇવ અપડેટ્સ';

  @override
  String get keepBookingFeedSynced => 'બુકિંગ ફીડને સિંક રાખો';

  @override
  String get currentBookingStatus => 'વર્તમાન બુકિંગ સ્થિતિ';

  @override
  String get noActiveBooking => 'કોઈ સક્રિય બુકિંગ નથી';

  @override
  String get loggingOut => 'લોગ આઉટ થઈ રહ્યું છે...';

  @override
  String get pastBookings => 'ભૂતકાળની બુકિંગ્સ';

  @override
  String get noCompletedBookingsYet => 'હજુ સુધી કોઈ પૂર્ણ થયેલ બુકિંગ નથી.';

  @override
  String get previousPage => 'પાછલું પાનું';

  @override
  String get nextPage => 'આગલું પાનું';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'પૂજા સેવા';

  @override
  String get dietyNotSpecified => 'દેવતા સ્પષ્ટ કરેલ નથી';

  @override
  String get crowdPrayerTag => 'સામૂહિક પ્રાર્થના';

  @override
  String get bookedFor => 'કોના માટે બુક કરેલ';

  @override
  String get nameNotProvided => 'નામ આપેલ નથી';

  @override
  String get birthStar => 'જન્મ નક્ષત્ર';

  @override
  String get bookedOn => 'બુક કરેલ તારીખ';

  @override
  String get panditLabel => 'પંડિત';

  @override
  String get completedLabel => 'પૂર્ણ થયું';

  @override
  String get notesLabel => 'નોંધો';

  @override
  String get statusCompleted => 'પૂર્ણ થયું';

  @override
  String get statusAccepted => 'સ્વીકારાયું';

  @override
  String get statusOngoing => 'ચાલુ';

  @override
  String get statusRejected => 'નકારાયું';

  @override
  String get statusExpired => 'મ્યાદ પૂર્ણ થઈ';

  @override
  String get statusNoPanditAvailable => 'કોઈ પંડિતી ઉપલબ્ધ નથી';

  @override
  String get statusPending => 'બાકી';

  @override
  String get availableBookingOpportunities => 'ઉપલબ્ધ બુકિંગ તકો';

  @override
  String get currentActiveBooking => 'વર્તમાન સક્રિય બુકિંગ';

  @override
  String dietyPrefix(String diety) {
    return 'દેવતા: $diety';
  }

  @override
  String get completeBooking => 'બુકિંગ પૂર્ણ કરો';

  @override
  String get startBooking => 'અર્પણમ શરૂ કરો';

  @override
  String get uploadArpanamVideo => 'અર્પણમનો વિડિયો ઉમેરો';

  @override
  String get videoUploaded => 'અર્પણમનો વિડિયો અપલોડ થયો';

  @override
  String get invalidArpanamVideo => 'કૃપા કરીને માન્ય વિડિયો ફાઇલ પસંદ કરો.';

  @override
  String get videoCompressionFailed => 'વિડિયો સંકુચિત થઈ શક્યો નથી.';

  @override
  String videoUploadFailed(String error) {
    return 'વિડિયો અપલોડ નિષ્ફળ થયું: $error';
  }

  @override
  String get freeToAcceptNext =>
      'તમે આગલી ઉપલબ્ધ બુકિંગ સ્વીકારવા માટે મુક્ત છો.';

  @override
  String get noBookingsAvailable => 'હાલમાં કોઈ બુકિંગ ઉપલબ્ધ નથી.';

  @override
  String get dobShort => 'જન્મ તારીખ';

  @override
  String get birthStarShort => 'જન્મ નક્ષત્ર';

  @override
  String get dietyShort => 'દેવતા';

  @override
  String get crowdPrayerLabel => 'સામૂહિક પ્રાર્થના';

  @override
  String get processing => 'પ્રક્રિયા થઈ રહી છે...';

  @override
  String get finishCurrentTaskFirst => 'પહેલા વર્તમાન કાર્ય પૂર્ણ કરો';

  @override
  String get acceptRequest => 'વિનંતી સ્વીકારો';

  @override
  String get rejectRequestTooltip => 'વિનંતી નકારો';

  @override
  String rejectBookingWarning(String name) {
    return '$nameને નકારવાથી બુકિંગ તમારી યાદીમાંથી દૂર થઈ જશે. આ પૂર્વવત્ કરી શકાશે નહીં.';
  }

  @override
  String get statusOnline => 'ઓનલાઈન';

  @override
  String get statusBusy => 'વ્યસ્ત';

  @override
  String get statusOffline => 'ઓફલાઈન';

  @override
  String get tabHome => 'હોમ';

  @override
  String get tabActivity => 'પ્રવૃત્તિ';

  @override
  String get tabAccount => 'ખાતું';

  @override
  String get waitingForBookings => 'બુકિંગ્સની રાહ જોવાઈ રહી છે';

  @override
  String get socketConnected => 'સોકેટ કનેક્ટ થયું';

  @override
  String get socketDisconnected => 'સોકેટ ડિસકનેક્ટ થયું';

  @override
  String get onlineAndReadyForBookings =>
      'ઓનલાઈન છે અને બુકિંગ્સ માટે તૈયાર છે';

  @override
  String get busyWithActiveBooking => 'સક્રિય બુકિંગ સાથે વ્યસ્ત';

  @override
  String get unknownError => 'અજ્ઞાત ભૂલ';

  @override
  String unableToGoOnline(String error) {
    return 'ઓનલાઈન જવામાં અસમર્થ: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'સોકેટ ઉપલબ્ધ નથી: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'ઓનલાઈન રહેવામાં અસમર્થ: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'ભૂતકાળની બુકિંગ્સ લોડ કરી શકાઈ નથી: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name સ્વીકારાયું';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'બુકિંગ સ્વીકારી શકાયું નથી: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'બુકિંગ #$id બીજા પંડિત દ્વારા સ્વીકારાયું.';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'બુકિંગ #$id ઓફરની મુદત પૂરી થઈ.';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'બુકિંગ #$id હવે ઉપલબ્ધ નથી.';
  }

  @override
  String rejectedBooking(String name) {
    return '$name નકારાયું';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'બુકિંગ નકારી શકાયું નથી: $error';
  }

  @override
  String get unableToAcceptBooking => 'બુકિંગ સ્વીકારવામાં અસમર્થ';

  @override
  String get unableToRejectBooking => 'બુકિંગ નકારવામાં અસમર્થ';

  @override
  String get unableToCompleteBooking => 'બુકિંગ પૂર્ણ કરવામાં અસમર્થ';

  @override
  String completedBooking(String name) {
    return '$name પૂર્ણ થયું';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'બુકિંગ પૂર્ણ કરી શકાયું નથી: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'બુકિંગ શરૂ કરી શકાયું નથી: $error';
  }
}
