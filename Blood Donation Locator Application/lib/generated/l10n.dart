// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Department`
  String get Department {
    return Intl.message(
      'Department',
      name: 'Department',
      desc: '',
      args: [],
    );
  }

  /// `My Notifications`
  String get My_Notification {
    return Intl.message(
      'My Notifications',
      name: 'My_Notification',
      desc: '',
      args: [],
    );
  }

  /// `Blood type is Expired`
  String get Blood_type_is_Expired {
    return Intl.message(
      'Blood type is Expired',
      name: 'Blood_type_is_Expired',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get Sign_out {
    return Intl.message(
      'Sign out',
      name: 'Sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to sign out ?`
  String get Do_you_want_to_sign_out {
    return Intl.message(
      'Do you want to sign out ?',
      name: 'Do_you_want_to_sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get theme {
    return Intl.message(
      'Dark Mode',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Arabic language`
  String get change_languge {
    return Intl.message(
      'Arabic language',
      name: 'change_languge',
      desc: '',
      args: [],
    );
  }

  /// `Register as Hospital`
  String get register_as_hospital {
    return Intl.message(
      'Register as Hospital',
      name: 'register_as_hospital',
      desc: '',
      args: [],
    );
  }

  /// `Register as User`
  String get Register_as_User {
    return Intl.message(
      'Register as User',
      name: 'Register_as_User',
      desc: '',
      args: [],
    );
  }

  /// `Or Contact us`
  String get Or_Contact_us {
    return Intl.message(
      'Or Contact us',
      name: 'Or_Contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Enter secret key`
  String get enter_secret_key {
    return Intl.message(
      'Enter secret key',
      name: 'enter_secret_key',
      desc: '',
      args: [],
    );
  }

  /// `Hospital Register`
  String get Hospital_register {
    return Intl.message(
      'Hospital Register',
      name: 'Hospital_register',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Sign_in {
    return Intl.message(
      'Sign in',
      name: 'Sign_in',
      desc: '',
      args: [],
    );
  }

  /// `password is too weak`
  String get password_is_too_weak {
    return Intl.message(
      'password is too weak',
      name: 'password_is_too_weak',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get Loading {
    return Intl.message(
      'Loading',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Or Login With`
  String get Or_Login_With {
    return Intl.message(
      'Or Login With',
      name: 'Or_Login_With',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get Forget_Password {
    return Intl.message(
      'Forget Password',
      name: 'Forget_Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_you_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_you_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get Email_address {
    return Intl.message(
      'Email Address',
      name: 'Email_address',
      desc: '',
      args: [],
    );
  }

  /// `Location Service Disabled`
  String get Location_Service_Disabled {
    return Intl.message(
      'Location Service Disabled',
      name: 'Location_Service_Disabled',
      desc: '',
      args: [],
    );
  }

  /// `Please enable the location service to perform the search.`
  String get Please_enable_the_location_service_to_perform_the_search {
    return Intl.message(
      'Please enable the location service to perform the search.',
      name: 'Please_enable_the_location_service_to_perform_the_search',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get Enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'Enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Blood Type`
  String get Invalid_Blood_Type {
    return Intl.message(
      'Invalid Blood Type',
      name: 'Invalid_Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `The_blood_type_you_entered_is_not_valid`
  String get The_blood_type_you_entered_is_not_valid {
    return Intl.message(
      'The_blood_type_you_entered_is_not_valid',
      name: 'The_blood_type_you_entered_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to BLD`
  String get Welcome_to_BLD {
    return Intl.message(
      'Welcome to BLD',
      name: 'Welcome_to_BLD',
      desc: '',
      args: [],
    );
  }

  /// `Login to discover more services`
  String get Login_to_discover_more_services {
    return Intl.message(
      'Login to discover more services',
      name: 'Login_to_discover_more_services',
      desc: '',
      args: [],
    );
  }

  /// `You dont have an account?`
  String get You_dont_have_an_account {
    return Intl.message(
      'You dont have an account?',
      name: 'You_dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Create Qr`
  String get create_Qr {
    return Intl.message(
      'Create Qr',
      name: 'create_Qr',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get Remove {
    return Intl.message(
      'Remove',
      name: 'Remove',
      desc: '',
      args: [],
    );
  }

  /// `Check Donor`
  String get Check_Donor {
    return Intl.message(
      'Check Donor',
      name: 'Check_Donor',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Info {
    return Intl.message(
      'Notifications',
      name: 'Info',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get Data {
    return Intl.message(
      'Data',
      name: 'Data',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Dashboard {
    return Intl.message(
      'Services',
      name: 'Dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `Add Blood Type`
  String get Add_Blood_Type {
    return Intl.message(
      'Add Blood Type',
      name: 'Add_Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `Blood Type`
  String get Blood_Type {
    return Intl.message(
      'Blood Type',
      name: 'Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `Serial Num`
  String get Serial_Num {
    return Intl.message(
      'Serial Num',
      name: 'Serial_Num',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `Donar information`
  String get Donar_information {
    return Intl.message(
      'Donar information',
      name: 'Donar_information',
      desc: '',
      args: [],
    );
  }

  /// `The notifications will be completely deleted`
  String get The_notifications_will_be_completely_deleted {
    return Intl.message(
      'The notifications will be completely deleted',
      name: 'The_notifications_will_be_completely_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete all Notification ?`
  String get Are_you_sure_to_delete_all_Notification {
    return Intl.message(
      'Are you sure to delete all Notification ?',
      name: 'Are_you_sure_to_delete_all_Notification',
      desc: '',
      args: [],
    );
  }

  /// `Search by Serial Num`
  String get Search_by_Serial_Num {
    return Intl.message(
      'Search by Serial Num',
      name: 'Search_by_Serial_Num',
      desc: '',
      args: [],
    );
  }

  /// `Remove Blood Type`
  String get Remove_Blood_Type {
    return Intl.message(
      'Remove Blood Type',
      name: 'Remove_Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Sign_up {
    return Intl.message(
      'Sign up',
      name: 'Sign_up',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get First_Name {
    return Intl.message(
      'First Name',
      name: 'First_Name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get Last_Name {
    return Intl.message(
      'Last Name',
      name: 'Last_Name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `ChatBot`
  String get ChatBot {
    return Intl.message(
      'ChatBot',
      name: 'ChatBot',
      desc: '',
      args: [],
    );
  }

  /// `available`
  String get available {
    return Intl.message(
      'available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Km`
  String get Km {
    return Intl.message(
      'Km',
      name: 'Km',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Location is required to use app!`
  String get Location_is_required_to_use_app {
    return Intl.message(
      'Location is required to use app!',
      name: 'Location_is_required_to_use_app',
      desc: '',
      args: [],
    );
  }

  /// `Enter your meaasge`
  String get Enter_your_Meaasge {
    return Intl.message(
      'Enter your meaasge',
      name: 'Enter_your_Meaasge',
      desc: '',
      args: [],
    );
  }

  /// `Enter a password`
  String get Enter_a_password {
    return Intl.message(
      'Enter a password',
      name: 'Enter_a_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get Confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get Already_have_an_account {
    return Intl.message(
      'Already have an account',
      name: 'Already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Login to dicover more services`
  String get Login_to_dicover_more_services {
    return Intl.message(
      'Login to dicover more services',
      name: 'Login_to_dicover_more_services',
      desc: '',
      args: [],
    );
  }

  /// `Rest password`
  String get Rest_password {
    return Intl.message(
      'Rest password',
      name: 'Rest_password',
      desc: '',
      args: [],
    );
  }

  /// `Please, Enter your email to rest password`
  String get Please_Enter_your_email_to_rest_password {
    return Intl.message(
      'Please, Enter your email to rest password',
      name: 'Please_Enter_your_email_to_rest_password',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `This email has already exist`
  String get this_email_has_already_exist {
    return Intl.message(
      'This email has already exist',
      name: 'this_email_has_already_exist',
      desc: '',
      args: [],
    );
  }

  /// `Successfull`
  String get successfull {
    return Intl.message(
      'Successfull',
      name: 'successfull',
      desc: '',
      args: [],
    );
  }

  /// `Blood type is added`
  String get Blood_type_is_added {
    return Intl.message(
      'Blood type is added',
      name: 'Blood_type_is_added',
      desc: '',
      args: [],
    );
  }

  /// `Blood type already exists`
  String get Blood_type_already_exists {
    return Intl.message(
      'Blood type already exists',
      name: 'Blood_type_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sorry , this email not found try again`
  String get Sorry_this_email_not_found_try_again {
    return Intl.message(
      'Sorry , this email not found try again',
      name: 'Sorry_this_email_not_found_try_again',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `Please select your blood type`
  String get Please_select_your_blood_type {
    return Intl.message(
      'Please select your blood type',
      name: 'Please_select_your_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email or password`
  String get Please_check_your_email_or_password {
    return Intl.message(
      'Please check your email or password',
      name: 'Please_check_your_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Please select your Age`
  String get Please_select_your_Age {
    return Intl.message(
      'Please select your Age',
      name: 'Please_select_your_Age',
      desc: '',
      args: [],
    );
  }

  /// `Please select your BMI`
  String get Please_select_your_BMI {
    return Intl.message(
      'Please select your BMI',
      name: 'Please_select_your_BMI',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get Login_Successful {
    return Intl.message(
      'Login Successful',
      name: 'Login_Successful',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed: Email not verified`
  String get Login_Failed_Email_not_verified {
    return Intl.message(
      'Login Failed: Email not verified',
      name: 'Login_Failed_Email_not_verified',
      desc: '',
      args: [],
    );
  }

  /// `Please, Enter correct email`
  String get Please_Enter_correct_email {
    return Intl.message(
      'Please, Enter correct email',
      name: 'Please_Enter_correct_email',
      desc: '',
      args: [],
    );
  }

  /// `Please, Enter correct password`
  String get Please_Enter_correct_password {
    return Intl.message(
      'Please, Enter correct password',
      name: 'Please_Enter_correct_password',
      desc: '',
      args: [],
    );
  }

  /// `This email is not vaild`
  String get This_email_is_not_vaild {
    return Intl.message(
      'This email is not vaild',
      name: 'This_email_is_not_vaild',
      desc: '',
      args: [],
    );
  }

  /// `Blood Type Expiry Date`
  String get Blood_Type_Expiry_Date {
    return Intl.message(
      'Blood Type Expiry Date',
      name: 'Blood_Type_Expiry_Date',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get National_ID {
    return Intl.message(
      'National ID',
      name: 'National_ID',
      desc: '',
      args: [],
    );
  }

  /// `Donor Name`
  String get Donor_Name {
    return Intl.message(
      'Donor Name',
      name: 'Donor_Name',
      desc: '',
      args: [],
    );
  }

  /// `Notional Id`
  String get Notional_Id {
    return Intl.message(
      'Notional Id',
      name: 'Notional_Id',
      desc: '',
      args: [],
    );
  }

  /// `More Details`
  String get More_Details {
    return Intl.message(
      'More Details',
      name: 'More_Details',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get Expired {
    return Intl.message(
      'Expired',
      name: 'Expired',
      desc: '',
      args: [],
    );
  }

  /// `Print Barcode`
  String get Print_Barcode {
    return Intl.message(
      'Print Barcode',
      name: 'Print_Barcode',
      desc: '',
      args: [],
    );
  }

  /// `Add more data`
  String get add_more_data {
    return Intl.message(
      'Add more data',
      name: 'add_more_data',
      desc: '',
      args: [],
    );
  }

  /// `Blood type`
  String get Blood_type {
    return Intl.message(
      'Blood type',
      name: 'Blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Create QR Blood Type`
  String get create_qr_blood_type {
    return Intl.message(
      'Create QR Blood Type',
      name: 'create_qr_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Blood Locator Donation`
  String get Blood_Locator_Donation {
    return Intl.message(
      'Blood Locator Donation',
      name: 'Blood_Locator_Donation',
      desc: '',
      args: [],
    );
  }

  /// `Donate blood`
  String get Donate_blood {
    return Intl.message(
      'Donate blood',
      name: 'Donate_blood',
      desc: '',
      args: [],
    );
  }

  /// `Find blood type`
  String get Find_blood_type {
    return Intl.message(
      'Find blood type',
      name: 'Find_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Choose the service you want`
  String get Choose_the_service_you_want {
    return Intl.message(
      'Choose the service you want',
      name: 'Choose_the_service_you_want',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get Hello {
    return Intl.message(
      'Hello',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Blood donate`
  String get blood_donate {
    return Intl.message(
      'Blood donate',
      name: 'blood_donate',
      desc: '',
      args: [],
    );
  }

  /// `Find blood type`
  String get find_blood_type {
    return Intl.message(
      'Find blood type',
      name: 'find_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Permission`
  String get permission {
    return Intl.message(
      'Permission',
      name: 'permission',
      desc: '',
      args: [],
    );
  }

  /// `Find closest blood type`
  String get Find_closest_blood_type {
    return Intl.message(
      'Find closest blood type',
      name: 'Find_closest_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Find the closest blood type for you`
  String get find_the_closest_blood_type_for_you {
    return Intl.message(
      'Find the closest blood type for you',
      name: 'find_the_closest_blood_type_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Pregnancy`
  String get pregnancy {
    return Intl.message(
      'Pregnancy',
      name: 'pregnancy',
      desc: '',
      args: [],
    );
  }

  /// `Smoking`
  String get smoking {
    return Intl.message(
      'Smoking',
      name: 'smoking',
      desc: '',
      args: [],
    );
  }

  /// `Step 1`
  String get step_1 {
    return Intl.message(
      'Step 1',
      name: 'step_1',
      desc: '',
      args: [],
    );
  }

  /// `Step 2`
  String get step_2 {
    return Intl.message(
      'Step 2',
      name: 'step_2',
      desc: '',
      args: [],
    );
  }

  /// `Step 3`
  String get step_3 {
    return Intl.message(
      'Step 3',
      name: 'step_3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Blood Pressure`
  String get Blood_Pressure {
    return Intl.message(
      'Blood Pressure',
      name: 'Blood_Pressure',
      desc: '',
      args: [],
    );
  }

  /// `Level of Hemoglobin`
  String get Level_of_hemoglobin {
    return Intl.message(
      'Level of Hemoglobin',
      name: 'Level_of_hemoglobin',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message(
      'Age',
      name: 'Age',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get BMI {
    return Intl.message(
      'BMI',
      name: 'BMI',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Level of Hemglobin`
  String get Enter_your_level_of_hemglobin {
    return Intl.message(
      'Enter your Level of Hemglobin',
      name: 'Enter_your_level_of_hemglobin',
      desc: '',
      args: [],
    );
  }

  /// `Enter your age`
  String get Enter_Your_Age {
    return Intl.message(
      'Enter your age',
      name: 'Enter_Your_Age',
      desc: '',
      args: [],
    );
  }

  /// `Enter your weight`
  String get Enter_your_Weight {
    return Intl.message(
      'Enter your weight',
      name: 'Enter_your_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Chronic Kidney Diseases`
  String get Chronic_Kidney_Diseases {
    return Intl.message(
      'Chronic Kidney Diseases',
      name: 'Chronic_Kidney_Diseases',
      desc: '',
      args: [],
    );
  }

  /// `Adrenal And Thyroid Disorders`
  String get Adrenal_And_Thyroid_Disorders {
    return Intl.message(
      'Adrenal And Thyroid Disorders',
      name: 'Adrenal_And_Thyroid_Disorders',
      desc: '',
      args: [],
    );
  }

  /// `Have you donated previously`
  String get Have_you_donated_previously {
    return Intl.message(
      'Have you donated previously',
      name: 'Have_you_donated_previously',
      desc: '',
      args: [],
    );
  }

  /// `Select your blood type`
  String get Select_Your_blood_type {
    return Intl.message(
      'Select your blood type',
      name: 'Select_Your_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get Finish {
    return Intl.message(
      'Finish',
      name: 'Finish',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get Chat {
    return Intl.message(
      'Chats',
      name: 'Chat',
      desc: '',
      args: [],
    );
  }

  /// `CBC Test Donation`
  String get CBC_Test_Donation {
    return Intl.message(
      'CBC Test Donation',
      name: 'CBC_Test_Donation',
      desc: '',
      args: [],
    );
  }

  /// `No image selected.`
  String get No_image_selected {
    return Intl.message(
      'No image selected.',
      name: 'No_image_selected',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get Gallery {
    return Intl.message(
      'Gallery',
      name: 'Gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message(
      'Camera',
      name: 'Camera',
      desc: '',
      args: [],
    );
  }

  /// `Invalid secret number`
  String get Invalid_secret_number {
    return Intl.message(
      'Invalid secret number',
      name: 'Invalid_secret_number',
      desc: '',
      args: [],
    );
  }

  /// `Sorry`
  String get Sorry {
    return Intl.message(
      'Sorry',
      name: 'Sorry',
      desc: '',
      args: [],
    );
  }

  /// `Donate and \nsave People`
  String get Donate_and_save_People {
    return Intl.message(
      'Donate and \nsave People',
      name: 'Donate_and_save_People',
      desc: '',
      args: [],
    );
  }

  /// `Discover more \n      service`
  String get Discover_more_service {
    return Intl.message(
      'Discover more \n      service',
      name: 'Discover_more_service',
      desc: '',
      args: [],
    );
  }

  /// `Find Cloest \nBlood Tybe`
  String get Find_Cloest_Blood_Tybe {
    return Intl.message(
      'Find Cloest \nBlood Tybe',
      name: 'Find_Cloest_Blood_Tybe',
      desc: '',
      args: [],
    );
  }

  /// `please select a valid CBC analysis`
  String get please_select_a_valid_CBC_analysis {
    return Intl.message(
      'please select a valid CBC analysis',
      name: 'please_select_a_valid_CBC_analysis',
      desc: '',
      args: [],
    );
  }

  /// `you can not donate press continue to check the reasons`
  String get you_cant_donate_press_continue_to_check_the_reasons {
    return Intl.message(
      'you can not donate press continue to check the reasons',
      name: 'you_cant_donate_press_continue_to_check_the_reasons',
      desc: '',
      args: [],
    );
  }

  /// `press Ok to complete your donation check`
  String get press_Ok_to_complete_your_donation_check {
    return Intl.message(
      'press Ok to complete your donation check',
      name: 'press_Ok_to_complete_your_donation_check',
      desc: '',
      args: [],
    );
  }

  /// `Error occured while scanning`
  String get Error_occured_while_scanning {
    return Intl.message(
      'Error occured while scanning',
      name: 'Error_occured_while_scanning',
      desc: '',
      args: [],
    );
  }

  /// `Good analysis`
  String get Good_analysis {
    return Intl.message(
      'Good analysis',
      name: 'Good_analysis',
      desc: '',
      args: [],
    );
  }

  /// `Blood Type Date`
  String get Blood_Type_Date {
    return Intl.message(
      'Blood Type Date',
      name: 'Blood_Type_Date',
      desc: '',
      args: [],
    );
  }

  /// `Blood type is deleted`
  String get Blood_type_is_deleted {
    return Intl.message(
      'Blood type is deleted',
      name: 'Blood_type_is_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get Warning {
    return Intl.message(
      'Warning',
      name: 'Warning',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Blood type is not exist`
  String get Blood_type_isnt_exist {
    return Intl.message(
      'Blood type is not exist',
      name: 'Blood_type_isnt_exist',
      desc: '',
      args: [],
    );
  }

  /// `please_scan_a_correct_Qr`
  String get please_scan_a_correct_Qr {
    return Intl.message(
      'please_scan_a_correct_Qr',
      name: 'please_scan_a_correct_Qr',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get User_Name {
    return Intl.message(
      'User Name',
      name: 'User_Name',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get Place {
    return Intl.message(
      'Place',
      name: 'Place',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phone_Number {
    return Intl.message(
      'Phone Number',
      name: 'Phone_Number',
      desc: '',
      args: [],
    );
  }

  /// `Send Notification`
  String get Send_Notification {
    return Intl.message(
      'Send Notification',
      name: 'Send_Notification',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get Verify_your_email {
    return Intl.message(
      'Verify your email',
      name: 'Verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email to continue registration`
  String get Please_verify_your_email_to_continue_registration {
    return Intl.message(
      'Please verify your email to continue registration',
      name: 'Please_verify_your_email_to_continue_registration',
      desc: '',
      args: [],
    );
  }

  /// `Location Required`
  String get Location_Required {
    return Intl.message(
      'Location Required',
      name: 'Location_Required',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location services and app permissions to continue`
  String get Please_enable_location_services_and_app_permissions_to_continue {
    return Intl.message(
      'Please enable location services and app permissions to continue',
      name: 'Please_enable_location_services_and_app_permissions_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Open Location Settings`
  String get open_location_settings {
    return Intl.message(
      'Open Location Settings',
      name: 'open_location_settings',
      desc: '',
      args: [],
    );
  }

  /// `Open App Settings`
  String get Open_App_Settings {
    return Intl.message(
      'Open App Settings',
      name: 'Open_App_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Now, You can donate`
  String get Now_You_can_donate {
    return Intl.message(
      'Now, You can donate',
      name: 'Now_You_can_donate',
      desc: '',
      args: [],
    );
  }

  /// `you can go to the closest needed hospital to donate`
  String get you_can_go_to_the_closest_needed_hospital_to_donate {
    return Intl.message(
      'you can go to the closest needed hospital to donate',
      name: 'you_can_go_to_the_closest_needed_hospital_to_donate',
      desc: '',
      args: [],
    );
  }

  /// `please wait for check your information`
  String get please_wait_for_check_your_information {
    return Intl.message(
      'please wait for check your information',
      name: 'please_wait_for_check_your_information',
      desc: '',
      args: [],
    );
  }

  /// `sorry, you cant donate`
  String get sorry_you_cant_donate {
    return Intl.message(
      'sorry, you cant donate',
      name: 'sorry_you_cant_donate',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get Something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'Something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete data ?`
  String get Are_you_sure_to_delete_data_ {
    return Intl.message(
      'Are you sure to delete data ?',
      name: 'Are_you_sure_to_delete_data_',
      desc: '',
      args: [],
    );
  }

  /// `The data will be completely erased from the application`
  String get The_data_will_be_completely_erased_from_the_application {
    return Intl.message(
      'The data will be completely erased from the application',
      name: 'The_data_will_be_completely_erased_from_the_application',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get Failure {
    return Intl.message(
      'Failure',
      name: 'Failure',
      desc: '',
      args: [],
    );
  }

  /// `According to the personal examination analysis, you cant donate blood`
  String
      get According_to_the_personal_examination_analysis_you_cant_donate_blood {
    return Intl.message(
      'According to the personal examination analysis, you cant donate blood',
      name:
          'According_to_the_personal_examination_analysis_you_cant_donate_blood',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
