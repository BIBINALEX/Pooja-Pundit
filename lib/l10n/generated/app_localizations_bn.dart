// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'পূজা পণ্ডিত';

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get yes => 'হ্যাঁ';

  @override
  String get no => 'না';

  @override
  String get pleaseEnterValidPhone => 'অনুগ্রহ করে একটি বৈধ ফোন নম্বর লিখুন।';

  @override
  String autoVerificationFailed(String error) {
    return 'স্বয়ংক্রিয় যাচাইকরণ ব্যর্থ হয়েছে: $error';
  }

  @override
  String get verificationFailed => 'যাচাইকরণ ব্যর্থ হয়েছে।';

  @override
  String get otpSentSuccessfully => 'OTP সফলভাবে পাঠানো হয়েছে।';

  @override
  String unableToSendOtp(String error) {
    return 'OTP পাঠাতে ব্যর্থ: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'অনুগ্রহ করে একটি বৈধ OTP লিখুন অথবা নতুন একটি অনুরোধ করুন।';

  @override
  String get invalidOtp => 'অবৈধ OTP।';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP যাচাইকরণ ব্যর্থ হয়েছে: $error';
  }

  @override
  String get noAuthenticatedUserFound =>
      'কোনো প্রমাণিত ব্যবহারকারী পাওয়া যায়নি।';

  @override
  String get firebaseUserTokenEmpty => 'Firebase ব্যবহারকারীর টোকেন খালি।';

  @override
  String get backendInvalidTokens => 'ব্যাকএন্ড API বৈধ টোকেন প্রদান করেনি।';

  @override
  String loginFailed(String error) {
    return 'লগইন ব্যর্থ হয়েছে: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'ফিরে আসার জন্য স্বাগতম! আপনার মোবাইল নম্বর দিয়ে সাইন ইন করুন';

  @override
  String get verifyOtp => 'OTP যাচাই করুন';

  @override
  String get mobileNumber => 'মোবাইল নম্বর';

  @override
  String get enterOtpSentToMobile =>
      'আপনার মোবাইলে পাঠানো 6-সংখ্যার OTP লিখুন।';

  @override
  String get willSendOneTimePassword =>
      'আমরা আপনার নম্বরে একবার ব্যবহারযোগ্য পাসওয়ার্ড পাঠাব।';

  @override
  String get codeLabel => 'কোড';

  @override
  String get phoneNumberLabel => 'ফোন নম্বর';

  @override
  String get changeNumber => 'নম্বর পরিবর্তন করুন';

  @override
  String get sendOtp => 'OTP পাঠান';

  @override
  String registrationFailed(String error) {
    return 'নিবন্ধন ব্যর্থ হয়েছে: $error';
  }

  @override
  String get completeYourProfile => 'আপনার প্রোফাইল সম্পূর্ণ করুন';

  @override
  String get addRemainingDetails =>
      'অ্যাপ ব্যবহার শুরু করতে বাকি বিবরণ যোগ করুন।';

  @override
  String get fullNameLabel => 'পুরো নাম';

  @override
  String get nameRequired => 'নাম আবশ্যক';

  @override
  String get emailLabel => 'ইমেল';

  @override
  String get emailRequired => 'ইমেল আবশ্যক';

  @override
  String get phoneNumberFieldLabel => 'ফোন নম্বর';

  @override
  String get phoneNumberRequired => 'ফোন নম্বর আবশ্যক';

  @override
  String get dateOfBirthLabel => 'জন্ম তারিখ';

  @override
  String get dobRequired => 'জন্ম তারিখ আবশ্যক';

  @override
  String get genderLabel => 'লিঙ্গ';

  @override
  String get genderRequired => 'লিঙ্গ আবশ্যক';

  @override
  String get genderMale => 'পুরুষ';

  @override
  String get genderFemale => 'মহিলা';

  @override
  String get specializationLabel => 'বিশেষত্ব';

  @override
  String get specializationRequired => 'বিশেষত্ব আবশ্যক';

  @override
  String get languageLabel => 'ভাষা';

  @override
  String get languageRequired => 'ভাষা আবশ্যক';

  @override
  String get languageOptionEnglish => 'ইংরেজি';

  @override
  String get languageOptionMalayalam => 'মালয়ালম';

  @override
  String get languageOptionTamil => 'তামিল';

  @override
  String get languageOptionHindi => 'হিন্দি';

  @override
  String get bioLabel => 'বায়ো';

  @override
  String get bioRequired => 'বায়ো আবশ্যক';

  @override
  String get continueLabel => 'চালিয়ে যান';

  @override
  String get profileNotFound => 'প্রোফাইল পাওয়া যায়নি।';

  @override
  String get unableToLoadProfile => 'প্রোফাইল লোড করা যায়নি।';

  @override
  String get logOutQuestion => 'লগ আউট করবেন?';

  @override
  String get signInAgainMessage =>
      'অ্যাপ ব্যবহার করতে আপনাকে আবার সাইন ইন করতে হবে।';

  @override
  String get logOut => 'লগ আউট';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'স্থানীয়ভাবে লগ আউট হয়েছে। সার্ভার সিঙ্ক ব্যর্থ হয়েছে।';

  @override
  String get accountAndSettings => 'অ্যাকাউন্ট ও সেটিংস';

  @override
  String get loadingProfile => 'প্রোফাইল লোড হচ্ছে...';

  @override
  String get panditProfile => 'পণ্ডিত প্রোফাইল';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'আপনার প্রোফাইলের বিবরণ এখানে দেখা যাবে';

  @override
  String get acceptInstantRequests => 'তাৎক্ষণিক অনুরোধ গ্রহণ করুন';

  @override
  String get getNotifiedNewRequest => 'নতুন পূজা অনুরোধ এলে জানানো হবে';

  @override
  String get socketLiveUpdates => 'সকেট লাইভ আপডেট';

  @override
  String get keepBookingFeedSynced => 'বুকিং ফিড সিঙ্ক রাখুন';

  @override
  String get currentBookingStatus => 'বর্তমান বুকিং অবস্থা';

  @override
  String get noActiveBooking => 'কোনো সক্রিয় বুকিং নেই';

  @override
  String get loggingOut => 'লগ আউট হচ্ছে...';

  @override
  String get pastBookings => 'অতীত বুকিং';

  @override
  String get noCompletedBookingsYet => 'এখনো কোনো সম্পন্ন বুকিং নেই।';

  @override
  String get previousPage => 'পূর্ববর্তী পৃষ্ঠা';

  @override
  String get nextPage => 'পরবর্তী পৃষ্ঠা';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'পূজা সেবা';

  @override
  String get dietyNotSpecified => 'দেবতা উল্লেখ করা হয়নি';

  @override
  String get crowdPrayerTag => 'সমবেত প্রার্থনা';

  @override
  String get bookedFor => 'কার জন্য বুক করা হয়েছে';

  @override
  String get nameNotProvided => 'নাম প্রদান করা হয়নি';

  @override
  String get birthStar => 'জন্ম নক্ষত্র';

  @override
  String get bookedOn => 'বুক করা হয়েছে';

  @override
  String get panditLabel => 'পণ্ডিত';

  @override
  String get completedLabel => 'সম্পন্ন হয়েছে';

  @override
  String get notesLabel => 'নোট';

  @override
  String get statusCompleted => 'সম্পন্ন হয়েছে';

  @override
  String get statusAccepted => 'গৃহীত';

  @override
  String get statusOngoing => 'চলমান';

  @override
  String get statusRejected => 'প্রত্যাখ্যাত';

  @override
  String get statusExpired => 'মেয়াদ উত্তীর্ণ';

  @override
  String get statusNoPanditAvailable => 'কোনো পণ্ডিত উপলস্থ নেই';

  @override
  String get statusPending => 'বিচারাধীন';

  @override
  String get availableBookingOpportunities => 'উপলব্ধ বুকিং সুযোগ';

  @override
  String get currentActiveBooking => 'বর্তমান সক্রিয় বুকিং';

  @override
  String dietyPrefix(String diety) {
    return 'দেবতা: $diety';
  }

  @override
  String get completeBooking => 'বুকিং সম্পন্ন করুন';

  @override
  String get startBooking => 'আর্পণম শুরু করুন';

  @override
  String get uploadArpanamVideo => 'আর্পণমের ভিডিও যোগ করুন';

  @override
  String get videoUploaded => 'আর্পণমের ভিডিও আপলোড হয়েছে';

  @override
  String get videoFromCamera => 'ভিডিও রেকর্ড করুন';

  @override
  String get videoFromGallery => 'গ্যালারি থেকে বেছে নিন';

  @override
  String get videoFromFiles => 'ফাইল থেকে বেছে নিন';

  @override
  String get invalidArpanamVideo => 'একটি বৈধ ভিডিও ফাইল নির্বাচন করুন।';

  @override
  String get videoPickerUnavailable =>
      'ভিডিও রেকর্ড বা নির্বাচন করা যাচ্ছে না। অ্যাপটি পুনরায় চালু করে আবার চেষ্টা করুন।';

  @override
  String get videoCompressionFailed => 'ভিডিওটি সংকুচিত করা যায়নি।';

  @override
  String get videoUploadFailed => 'ভিডিও আপলোড করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get freeToAcceptNext =>
      'আপনি পরবর্তী উপলব্ধ বুকিং গ্রহণ করতে স্বাধীন।';

  @override
  String get noBookingsAvailable => 'এখন কোনো বুকিং উপলব্ধ নেই।';

  @override
  String get dobShort => 'জন্ম তারিখ';

  @override
  String get birthStarShort => 'জন্ম নক্ষত্র';

  @override
  String get dietyShort => 'দেবতা';

  @override
  String get crowdPrayerLabel => 'সমবেত প্রার্থনা';

  @override
  String get processing => 'প্রক্রিয়াকরণ হচ্ছে...';

  @override
  String get finishCurrentTaskFirst => 'প্রথমে বর্তমান কাজ শেষ করুন';

  @override
  String get acceptRequest => 'অনুরোধ গ্রহণ করুন';

  @override
  String get rejectRequestTooltip => 'অনুরোধ প্রত্যাখ্যান করুন';

  @override
  String rejectBookingWarning(String name) {
    return '$name-কে প্রত্যাখ্যান করলে বুকিংটি আপনার তালিকা থেকে সরানো হবে। এটি পূর্বাবস্থায় ফেরানো যাবে না।';
  }

  @override
  String get statusOnline => 'অনলাইন';

  @override
  String get statusBusy => 'ব্যস্ত';

  @override
  String get statusOffline => 'অফলাইন';

  @override
  String get tabHome => 'হোম';

  @override
  String get tabActivity => 'কার্যকলাপ';

  @override
  String get tabAccount => 'অ্যাকাউন্ট';

  @override
  String get waitingForBookings => 'বুকিংয়ের জন্য অপেক্ষা করছে';

  @override
  String get socketConnected => 'সকেট সংযুক্ত হয়েছে';

  @override
  String get socketDisconnected => 'সকেট সংযোগবিচ্ছিন্ন হয়েছে';

  @override
  String get onlineAndReadyForBookings =>
      'অনলাইনে আছে এবং বুকিংয়ের জন্য প্রস্তুত';

  @override
  String get busyWithActiveBooking => 'সক্রিয় বুকিং নিয়ে ব্যস্ত';

  @override
  String get unknownError => 'অজানা ত্রুটি';

  @override
  String unableToGoOnline(String error) {
    return 'অনলাইনে যেতে ব্যর্থ: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'সকেট উপলব্ধ নেই: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'অনলাইনে থাকা যায়নি: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'অতীত বুকিং লোড করা যায়নি: $error';
  }

  @override
  String acceptedBooking(String name) {
    return '$name গৃহীত হয়েছে';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'বুকিং গ্রহণ করা যায়নি: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'বুকিং #$id অন্য একজন পণ্ডিত গ্রহণ করেছেন।';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'বুকিং #$id অফারের মেয়াদ শেষ হয়েছে।';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'বুকিং #$id আর উপলব্ধ নেই।';
  }

  @override
  String rejectedBooking(String name) {
    return '$name প্রত্যাখ্যাত হয়েছে';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'বুকিং প্রত্যাখ্যান করা যায়নি: $error';
  }

  @override
  String get unableToAcceptBooking => 'বুকিং গ্রহণ করা যায়নি';

  @override
  String get unableToRejectBooking => 'বুকিং প্রত্যাখ্যান করা যায়নি';

  @override
  String get unableToCompleteBooking => 'বুকিং সম্পন্ন করা যায়নি';

  @override
  String completedBooking(String name) {
    return '$name সম্পন্ন হয়েছে';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'বুকিং সম্পন্ন করা যায়নি: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'বুকিং শুরু করা যায়নি: $error';
  }
}
