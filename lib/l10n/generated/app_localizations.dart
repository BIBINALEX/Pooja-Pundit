import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_sa.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('ml'),
    Locale('pa'),
    Locale('sa'),
    Locale('ta'),
    Locale('te'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Pooja Pundit'**
  String get appTitle;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @pleaseEnterValidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get pleaseEnterValidPhone;

  /// No description provided for @autoVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Auto-verification failed: {error}'**
  String autoVerificationFailed(String error);

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed.'**
  String get verificationFailed;

  /// No description provided for @otpSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'OTP sent successfully.'**
  String get otpSentSuccessfully;

  /// No description provided for @unableToSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Unable to send OTP: {error}'**
  String unableToSendOtp(String error);

  /// No description provided for @pleaseEnterValidOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid OTP or request a new one.'**
  String get pleaseEnterValidOtp;

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP.'**
  String get invalidOtp;

  /// No description provided for @otpVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'OTP verification failed: {error}'**
  String otpVerificationFailed(String error);

  /// No description provided for @noAuthenticatedUserFound.
  ///
  /// In en, this message translates to:
  /// **'No authenticated user found.'**
  String get noAuthenticatedUserFound;

  /// No description provided for @firebaseUserTokenEmpty.
  ///
  /// In en, this message translates to:
  /// **'Firebase user token is empty.'**
  String get firebaseUserTokenEmpty;

  /// No description provided for @backendInvalidTokens.
  ///
  /// In en, this message translates to:
  /// **'Backend API did not return valid tokens.'**
  String get backendInvalidTokens;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed: {error}'**
  String loginFailed(String error);

  /// No description provided for @welcomeBackSignIn.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Sign in with your mobile number'**
  String get welcomeBackSignIn;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobileNumber;

  /// No description provided for @enterOtpSentToMobile.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit OTP sent to your mobile.'**
  String get enterOtpSentToMobile;

  /// No description provided for @willSendOneTimePassword.
  ///
  /// In en, this message translates to:
  /// **'We will send a one-time password to your number.'**
  String get willSendOneTimePassword;

  /// No description provided for @codeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get codeLabel;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberLabel;

  /// No description provided for @changeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change number'**
  String get changeNumber;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed: {error}'**
  String registrationFailed(String error);

  /// No description provided for @completeYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile'**
  String get completeYourProfile;

  /// No description provided for @addRemainingDetails.
  ///
  /// In en, this message translates to:
  /// **'Add the remaining details so you can start using the app.'**
  String get addRemainingDetails;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullNameLabel;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @phoneNumberFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberFieldLabel;

  /// No description provided for @phoneNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone Number is required'**
  String get phoneNumberRequired;

  /// No description provided for @dateOfBirthLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirthLabel;

  /// No description provided for @dobRequired.
  ///
  /// In en, this message translates to:
  /// **'DOB is required'**
  String get dobRequired;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderLabel;

  /// No description provided for @genderRequired.
  ///
  /// In en, this message translates to:
  /// **'Gender is required'**
  String get genderRequired;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @specializationLabel.
  ///
  /// In en, this message translates to:
  /// **'Specialization'**
  String get specializationLabel;

  /// No description provided for @specializationRequired.
  ///
  /// In en, this message translates to:
  /// **'Specialization is required'**
  String get specializationRequired;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @languageRequired.
  ///
  /// In en, this message translates to:
  /// **'Language is required'**
  String get languageRequired;

  /// No description provided for @languageOptionEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageOptionEnglish;

  /// No description provided for @languageOptionMalayalam.
  ///
  /// In en, this message translates to:
  /// **'Malayalam'**
  String get languageOptionMalayalam;

  /// No description provided for @languageOptionTamil.
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get languageOptionTamil;

  /// No description provided for @languageOptionHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get languageOptionHindi;

  /// No description provided for @bioLabel.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bioLabel;

  /// No description provided for @bioRequired.
  ///
  /// In en, this message translates to:
  /// **'Bio is required'**
  String get bioRequired;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @profileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Profile not found.'**
  String get profileNotFound;

  /// No description provided for @unableToLoadProfile.
  ///
  /// In en, this message translates to:
  /// **'Unable to load profile.'**
  String get unableToLoadProfile;

  /// No description provided for @logOutQuestion.
  ///
  /// In en, this message translates to:
  /// **'Log out?'**
  String get logOutQuestion;

  /// No description provided for @signInAgainMessage.
  ///
  /// In en, this message translates to:
  /// **'You will need to sign in again to access the app.'**
  String get signInAgainMessage;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @loggedOutLocallyServerSyncFailed.
  ///
  /// In en, this message translates to:
  /// **'Logged out locally. Server sync failed.'**
  String get loggedOutLocallyServerSyncFailed;

  /// No description provided for @accountAndSettings.
  ///
  /// In en, this message translates to:
  /// **'Account and settings'**
  String get accountAndSettings;

  /// No description provided for @loadingProfile.
  ///
  /// In en, this message translates to:
  /// **'Loading profile...'**
  String get loadingProfile;

  /// No description provided for @panditProfile.
  ///
  /// In en, this message translates to:
  /// **'Pandit profile'**
  String get panditProfile;

  /// No description provided for @yourProfileDetailsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Your profile details will appear here'**
  String get yourProfileDetailsWillAppearHere;

  /// No description provided for @acceptInstantRequests.
  ///
  /// In en, this message translates to:
  /// **'Accept instant requests'**
  String get acceptInstantRequests;

  /// No description provided for @getNotifiedNewRequest.
  ///
  /// In en, this message translates to:
  /// **'Get notified when a new pooja request arrives'**
  String get getNotifiedNewRequest;

  /// No description provided for @socketLiveUpdates.
  ///
  /// In en, this message translates to:
  /// **'Socket live updates'**
  String get socketLiveUpdates;

  /// No description provided for @keepBookingFeedSynced.
  ///
  /// In en, this message translates to:
  /// **'Keep the booking feed synced'**
  String get keepBookingFeedSynced;

  /// No description provided for @currentBookingStatus.
  ///
  /// In en, this message translates to:
  /// **'Current booking status'**
  String get currentBookingStatus;

  /// No description provided for @noActiveBooking.
  ///
  /// In en, this message translates to:
  /// **'No active booking'**
  String get noActiveBooking;

  /// No description provided for @loggingOut.
  ///
  /// In en, this message translates to:
  /// **'Logging out...'**
  String get loggingOut;

  /// No description provided for @pastBookings.
  ///
  /// In en, this message translates to:
  /// **'Past bookings'**
  String get pastBookings;

  /// No description provided for @noCompletedBookingsYet.
  ///
  /// In en, this message translates to:
  /// **'No completed bookings yet.'**
  String get noCompletedBookingsYet;

  /// No description provided for @previousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous page'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In en, this message translates to:
  /// **'Next page'**
  String get nextPage;

  /// No description provided for @pageOfPages.
  ///
  /// In en, this message translates to:
  /// **'{page} / {totalPages}'**
  String pageOfPages(String page, String totalPages);

  /// No description provided for @pujaService.
  ///
  /// In en, this message translates to:
  /// **'Puja Service'**
  String get pujaService;

  /// No description provided for @dietyNotSpecified.
  ///
  /// In en, this message translates to:
  /// **'Diety not specified'**
  String get dietyNotSpecified;

  /// No description provided for @crowdPrayerTag.
  ///
  /// In en, this message translates to:
  /// **'CROWD PRAYER'**
  String get crowdPrayerTag;

  /// No description provided for @bookedFor.
  ///
  /// In en, this message translates to:
  /// **'Booked for'**
  String get bookedFor;

  /// No description provided for @nameNotProvided.
  ///
  /// In en, this message translates to:
  /// **'Name not provided'**
  String get nameNotProvided;

  /// No description provided for @birthStar.
  ///
  /// In en, this message translates to:
  /// **'Birth star'**
  String get birthStar;

  /// No description provided for @bookedOn.
  ///
  /// In en, this message translates to:
  /// **'Booked on'**
  String get bookedOn;

  /// No description provided for @panditLabel.
  ///
  /// In en, this message translates to:
  /// **'Pandit'**
  String get panditLabel;

  /// No description provided for @completedLabel.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get statusAccepted;

  /// No description provided for @statusOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get statusOngoing;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @statusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get statusExpired;

  /// No description provided for @statusNoPanditAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Pandit Available'**
  String get statusNoPanditAvailable;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @availableBookingOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Available booking opportunities'**
  String get availableBookingOpportunities;

  /// No description provided for @currentActiveBooking.
  ///
  /// In en, this message translates to:
  /// **'Current active booking'**
  String get currentActiveBooking;

  /// No description provided for @dietyPrefix.
  ///
  /// In en, this message translates to:
  /// **'Diety: {diety}'**
  String dietyPrefix(String diety);

  /// No description provided for @completeBooking.
  ///
  /// In en, this message translates to:
  /// **'Complete booking'**
  String get completeBooking;

  /// No description provided for @startBooking.
  ///
  /// In en, this message translates to:
  /// **'Start Arpanam'**
  String get startBooking;

  /// No description provided for @uploadArpanamVideo.
  ///
  /// In en, this message translates to:
  /// **'Add Arpanam video'**
  String get uploadArpanamVideo;

  /// No description provided for @videoUploaded.
  ///
  /// In en, this message translates to:
  /// **'Arpanam video uploaded'**
  String get videoUploaded;

  /// No description provided for @videoFromCamera.
  ///
  /// In en, this message translates to:
  /// **'Record video'**
  String get videoFromCamera;

  /// No description provided for @videoFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get videoFromGallery;

  /// No description provided for @videoFromFiles.
  ///
  /// In en, this message translates to:
  /// **'Choose from files'**
  String get videoFromFiles;

  /// No description provided for @invalidArpanamVideo.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid video file.'**
  String get invalidArpanamVideo;

  /// No description provided for @videoPickerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Video recording or selection is unavailable. Please restart the app and try again.'**
  String get videoPickerUnavailable;

  /// No description provided for @videoCompressionFailed.
  ///
  /// In en, this message translates to:
  /// **'The video could not be compressed.'**
  String get videoCompressionFailed;

  /// No description provided for @videoUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t upload the video. Please try again.'**
  String get videoUploadFailed;

  /// No description provided for @freeToAcceptNext.
  ///
  /// In en, this message translates to:
  /// **'You are free to accept the next available booking.'**
  String get freeToAcceptNext;

  /// No description provided for @noBookingsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No bookings available right now.'**
  String get noBookingsAvailable;

  /// No description provided for @dobShort.
  ///
  /// In en, this message translates to:
  /// **'DOB'**
  String get dobShort;

  /// No description provided for @birthStarShort.
  ///
  /// In en, this message translates to:
  /// **'Birth Star'**
  String get birthStarShort;

  /// No description provided for @dietyShort.
  ///
  /// In en, this message translates to:
  /// **'Diety'**
  String get dietyShort;

  /// No description provided for @crowdPrayerLabel.
  ///
  /// In en, this message translates to:
  /// **'Crowd Prayer'**
  String get crowdPrayerLabel;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processing;

  /// No description provided for @finishCurrentTaskFirst.
  ///
  /// In en, this message translates to:
  /// **'Finish current task first'**
  String get finishCurrentTaskFirst;

  /// No description provided for @acceptRequest.
  ///
  /// In en, this message translates to:
  /// **'Accept request'**
  String get acceptRequest;

  /// No description provided for @rejectRequestTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reject request'**
  String get rejectRequestTooltip;

  /// No description provided for @rejectBookingWarning.
  ///
  /// In en, this message translates to:
  /// **'Rejecting {name} will remove this booking from your list. This cannot be undone.'**
  String rejectBookingWarning(String name);

  /// No description provided for @statusOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statusOnline;

  /// No description provided for @statusBusy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get statusBusy;

  /// No description provided for @statusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get statusOffline;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get tabActivity;

  /// No description provided for @tabAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get tabAccount;

  /// No description provided for @waitingForBookings.
  ///
  /// In en, this message translates to:
  /// **'Waiting for bookings'**
  String get waitingForBookings;

  /// No description provided for @socketConnected.
  ///
  /// In en, this message translates to:
  /// **'Socket connected'**
  String get socketConnected;

  /// No description provided for @socketDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Socket disconnected'**
  String get socketDisconnected;

  /// No description provided for @onlineAndReadyForBookings.
  ///
  /// In en, this message translates to:
  /// **'Online and ready for bookings'**
  String get onlineAndReadyForBookings;

  /// No description provided for @busyWithActiveBooking.
  ///
  /// In en, this message translates to:
  /// **'Busy with an active booking'**
  String get busyWithActiveBooking;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'unknown error'**
  String get unknownError;

  /// No description provided for @unableToGoOnline.
  ///
  /// In en, this message translates to:
  /// **'Unable to go online: {error}'**
  String unableToGoOnline(String error);

  /// No description provided for @socketUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Socket unavailable: {error}'**
  String socketUnavailable(String error);

  /// No description provided for @unableToStayOnline.
  ///
  /// In en, this message translates to:
  /// **'Unable to stay online: {error}'**
  String unableToStayOnline(String error);

  /// No description provided for @couldNotLoadPastBookings.
  ///
  /// In en, this message translates to:
  /// **'Could not load past bookings: {error}'**
  String couldNotLoadPastBookings(String error);

  /// No description provided for @acceptedBooking.
  ///
  /// In en, this message translates to:
  /// **'Accepted {name}'**
  String acceptedBooking(String name);

  /// No description provided for @couldNotAcceptBooking.
  ///
  /// In en, this message translates to:
  /// **'Could not accept booking: {error}'**
  String couldNotAcceptBooking(String error);

  /// No description provided for @bookingTakenByAnother.
  ///
  /// In en, this message translates to:
  /// **'Booking #{id} was accepted by another pandit.'**
  String bookingTakenByAnother(String id);

  /// No description provided for @bookingOfferExpired.
  ///
  /// In en, this message translates to:
  /// **'Booking #{id} offer expired.'**
  String bookingOfferExpired(String id);

  /// No description provided for @bookingNoLongerAvailable.
  ///
  /// In en, this message translates to:
  /// **'Booking #{id} is no longer available.'**
  String bookingNoLongerAvailable(String id);

  /// No description provided for @rejectedBooking.
  ///
  /// In en, this message translates to:
  /// **'Rejected {name}'**
  String rejectedBooking(String name);

  /// No description provided for @couldNotRejectBooking.
  ///
  /// In en, this message translates to:
  /// **'Could not reject booking: {error}'**
  String couldNotRejectBooking(String error);

  /// No description provided for @unableToAcceptBooking.
  ///
  /// In en, this message translates to:
  /// **'Unable to accept booking'**
  String get unableToAcceptBooking;

  /// No description provided for @unableToRejectBooking.
  ///
  /// In en, this message translates to:
  /// **'Unable to reject booking'**
  String get unableToRejectBooking;

  /// No description provided for @unableToCompleteBooking.
  ///
  /// In en, this message translates to:
  /// **'Unable to complete booking'**
  String get unableToCompleteBooking;

  /// No description provided for @completedBooking.
  ///
  /// In en, this message translates to:
  /// **'Completed {name}'**
  String completedBooking(String name);

  /// No description provided for @couldNotCompleteBooking.
  ///
  /// In en, this message translates to:
  /// **'Could not complete booking: {error}'**
  String couldNotCompleteBooking(String error);

  /// No description provided for @couldNotStartBooking.
  ///
  /// In en, this message translates to:
  /// **'Could not start booking: {error}'**
  String couldNotStartBooking(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bn',
    'en',
    'gu',
    'hi',
    'kn',
    'ml',
    'pa',
    'sa',
    'ta',
    'te',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'kn':
      return AppLocalizationsKn();
    case 'ml':
      return AppLocalizationsMl();
    case 'pa':
      return AppLocalizationsPa();
    case 'sa':
      return AppLocalizationsSa();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
