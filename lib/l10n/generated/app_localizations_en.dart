// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pooja Pundit';

  @override
  String get cancel => 'Cancel';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get pleaseEnterValidPhone => 'Please enter a valid phone number.';

  @override
  String autoVerificationFailed(String error) {
    return 'Auto-verification failed: $error';
  }

  @override
  String get verificationFailed => 'Verification failed.';

  @override
  String get otpSentSuccessfully => 'OTP sent successfully.';

  @override
  String unableToSendOtp(String error) {
    return 'Unable to send OTP: $error';
  }

  @override
  String get pleaseEnterValidOtp =>
      'Please enter a valid OTP or request a new one.';

  @override
  String get invalidOtp => 'Invalid OTP.';

  @override
  String otpVerificationFailed(String error) {
    return 'OTP verification failed: $error';
  }

  @override
  String get noAuthenticatedUserFound => 'No authenticated user found.';

  @override
  String get firebaseUserTokenEmpty => 'Firebase user token is empty.';

  @override
  String get backendInvalidTokens => 'Backend API did not return valid tokens.';

  @override
  String loginFailed(String error) {
    return 'Login failed: $error';
  }

  @override
  String get welcomeBackSignIn =>
      'Welcome back! Sign in with your mobile number';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get mobileNumber => 'Mobile number';

  @override
  String get enterOtpSentToMobile =>
      'Enter the 6-digit OTP sent to your mobile.';

  @override
  String get willSendOneTimePassword =>
      'We will send a one-time password to your number.';

  @override
  String get codeLabel => 'Code';

  @override
  String get phoneNumberLabel => 'Phone number';

  @override
  String get changeNumber => 'Change number';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String registrationFailed(String error) {
    return 'Registration failed: $error';
  }

  @override
  String get completeYourProfile => 'Complete your profile';

  @override
  String get addRemainingDetails =>
      'Add the remaining details so you can start using the app.';

  @override
  String get fullNameLabel => 'Full name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get phoneNumberFieldLabel => 'Phone Number';

  @override
  String get phoneNumberRequired => 'Phone Number is required';

  @override
  String get dateOfBirthLabel => 'Date of birth';

  @override
  String get dobRequired => 'DOB is required';

  @override
  String get genderLabel => 'Gender';

  @override
  String get genderRequired => 'Gender is required';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get specializationLabel => 'Specialization';

  @override
  String get specializationRequired => 'Specialization is required';

  @override
  String get languageLabel => 'Language';

  @override
  String get languageRequired => 'Language is required';

  @override
  String get languageOptionEnglish => 'English';

  @override
  String get languageOptionMalayalam => 'Malayalam';

  @override
  String get languageOptionTamil => 'Tamil';

  @override
  String get languageOptionHindi => 'Hindi';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioRequired => 'Bio is required';

  @override
  String get continueLabel => 'Continue';

  @override
  String get profileNotFound => 'Profile not found.';

  @override
  String get unableToLoadProfile => 'Unable to load profile.';

  @override
  String get logOutQuestion => 'Log out?';

  @override
  String get signInAgainMessage =>
      'You will need to sign in again to access the app.';

  @override
  String get logOut => 'Log out';

  @override
  String get loggedOutLocallyServerSyncFailed =>
      'Logged out locally. Server sync failed.';

  @override
  String get accountAndSettings => 'Account and settings';

  @override
  String get loadingProfile => 'Loading profile...';

  @override
  String get panditProfile => 'Pandit profile';

  @override
  String get yourProfileDetailsWillAppearHere =>
      'Your profile details will appear here';

  @override
  String get acceptInstantRequests => 'Accept instant requests';

  @override
  String get getNotifiedNewRequest =>
      'Get notified when a new pooja request arrives';

  @override
  String get socketLiveUpdates => 'Socket live updates';

  @override
  String get keepBookingFeedSynced => 'Keep the booking feed synced';

  @override
  String get currentBookingStatus => 'Current booking status';

  @override
  String get noActiveBooking => 'No active booking';

  @override
  String get loggingOut => 'Logging out...';

  @override
  String get pastBookings => 'Past bookings';

  @override
  String get noCompletedBookingsYet => 'No completed bookings yet.';

  @override
  String get previousPage => 'Previous page';

  @override
  String get nextPage => 'Next page';

  @override
  String pageOfPages(String page, String totalPages) {
    return '$page / $totalPages';
  }

  @override
  String get pujaService => 'Puja Service';

  @override
  String get dietyNotSpecified => 'Diety not specified';

  @override
  String get crowdPrayerTag => 'CROWD PRAYER';

  @override
  String get bookedFor => 'Booked for';

  @override
  String get nameNotProvided => 'Name not provided';

  @override
  String get birthStar => 'Birth star';

  @override
  String get bookedOn => 'Booked on';

  @override
  String get panditLabel => 'Pandit';

  @override
  String get completedLabel => 'Completed';

  @override
  String get notesLabel => 'Notes';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusAccepted => 'Accepted';

  @override
  String get statusOngoing => 'Ongoing';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get statusExpired => 'Expired';

  @override
  String get statusNoPanditAvailable => 'No Pandit Available';

  @override
  String get statusPending => 'Pending';

  @override
  String get availableBookingOpportunities => 'Available booking opportunities';

  @override
  String get currentActiveBooking => 'Current active booking';

  @override
  String dietyPrefix(String diety) {
    return 'Diety: $diety';
  }

  @override
  String get completeBooking => 'Complete booking';

  @override
  String get startBooking => 'Start Arpanam';

  @override
  String get uploadArpanamVideo => 'Add Arpanam video';

  @override
  String get videoUploaded => 'Arpanam video uploaded';

  @override
  String get videoFromCamera => 'Record video';

  @override
  String get videoFromGallery => 'Choose from gallery';

  @override
  String get videoFromFiles => 'Choose from files';

  @override
  String get invalidArpanamVideo => 'Please select a valid video file.';

  @override
  String get videoPickerUnavailable =>
      'Video recording or selection is unavailable. Please restart the app and try again.';

  @override
  String get videoCompressionFailed => 'The video could not be compressed.';

  @override
  String get videoUploadFailed =>
      'We couldn\'t upload the video. Please try again.';

  @override
  String get freeToAcceptNext =>
      'You are free to accept the next available booking.';

  @override
  String get noBookingsAvailable => 'No bookings available right now.';

  @override
  String get dobShort => 'DOB';

  @override
  String get birthStarShort => 'Birth Star';

  @override
  String get dietyShort => 'Diety';

  @override
  String get crowdPrayerLabel => 'Crowd Prayer';

  @override
  String get processing => 'Processing...';

  @override
  String get finishCurrentTaskFirst => 'Finish current task first';

  @override
  String get acceptRequest => 'Accept request';

  @override
  String get rejectRequestTooltip => 'Reject request';

  @override
  String rejectBookingWarning(String name) {
    return 'Rejecting $name will remove this booking from your list. This cannot be undone.';
  }

  @override
  String get statusOnline => 'Online';

  @override
  String get statusBusy => 'Busy';

  @override
  String get statusOffline => 'Offline';

  @override
  String get tabHome => 'Home';

  @override
  String get tabActivity => 'Activity';

  @override
  String get tabAccount => 'Account';

  @override
  String get waitingForBookings => 'Waiting for bookings';

  @override
  String get socketConnected => 'Socket connected';

  @override
  String get socketDisconnected => 'Socket disconnected';

  @override
  String get onlineAndReadyForBookings => 'Online and ready for bookings';

  @override
  String get busyWithActiveBooking => 'Busy with an active booking';

  @override
  String get unknownError => 'unknown error';

  @override
  String unableToGoOnline(String error) {
    return 'Unable to go online: $error';
  }

  @override
  String socketUnavailable(String error) {
    return 'Socket unavailable: $error';
  }

  @override
  String unableToStayOnline(String error) {
    return 'Unable to stay online: $error';
  }

  @override
  String couldNotLoadPastBookings(String error) {
    return 'Could not load past bookings: $error';
  }

  @override
  String acceptedBooking(String name) {
    return 'Accepted $name';
  }

  @override
  String couldNotAcceptBooking(String error) {
    return 'Could not accept booking: $error';
  }

  @override
  String bookingTakenByAnother(String id) {
    return 'Booking #$id was accepted by another pandit.';
  }

  @override
  String bookingOfferExpired(String id) {
    return 'Booking #$id offer expired.';
  }

  @override
  String bookingNoLongerAvailable(String id) {
    return 'Booking #$id is no longer available.';
  }

  @override
  String rejectedBooking(String name) {
    return 'Rejected $name';
  }

  @override
  String couldNotRejectBooking(String error) {
    return 'Could not reject booking: $error';
  }

  @override
  String get unableToAcceptBooking => 'Unable to accept booking';

  @override
  String get unableToRejectBooking => 'Unable to reject booking';

  @override
  String get unableToCompleteBooking => 'Unable to complete booking';

  @override
  String completedBooking(String name) {
    return 'Completed $name';
  }

  @override
  String couldNotCompleteBooking(String error) {
    return 'Could not complete booking: $error';
  }

  @override
  String couldNotStartBooking(String error) {
    return 'Could not start booking: $error';
  }
}
