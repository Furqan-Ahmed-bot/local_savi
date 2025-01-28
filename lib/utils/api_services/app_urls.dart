class UserUrls {
  static const baseUrl = "https://api.localsaviors.com/api/v1/";
  static const loginUrl = "${baseUrl}user/login";
  static const signupUrl = "${baseUrl}user/register";
  static const verifyOTPUrl = "${baseUrl}user/verify_otp";
  static const resendOTPUrl = "${baseUrl}user/resend_otp";
  static const forgetPasswordUrl = "${baseUrl}user/forget_password";
  static const resetPasswordUrl = "${baseUrl}user/reset_password";
  static const createProfileUrl = "${baseUrl}user/create_user_profile";
  static const createPerformerProfileUrl = "${baseUrl}user/create_user_profile";

  static const createProviderProfileUrl =
      "${baseUrl}user/create_performer_profile";
  static const getProfileUrl = "${baseUrl}user/about";
  static const logoutUrl = "${baseUrl}user/logout";
  static const createJob = "${baseUrl}job/register";
  static const getAllJobs = "${baseUrl}job/user?filter="; //filter = OPEN

  static const getPerformerAllJobs = "${baseUrl}job/all?limit=20&page=1";
  static const applyPerformerJob = "${baseUrl}job/apply/"; // job id
  static const getPerformerJobs =
      "${baseUrl}job/all/provider?filter="; // filter
}

// class ProfessionalUrls {
//   static const baseUrl = "https://api.localsaviors.com/api/v1/";
//   static const loginUrl = "${baseUrl}user/auth/login";
//   static const signupUrl = "${baseUrl}user/auth/register";
//   static const verifyOTPUrl = "${baseUrl}user/auth/verify_otp";
//   static const resendOTPUrl = "${baseUrl}user/auth/resend_otp";
//   static const forgetPasswordUrl = "${baseUrl}user/auth/forget_password";
//   static const resetPasswordUrl = "${baseUrl}user/auth/reset_password";
//   static const getProfileUrl = "${baseUrl}user/auth/me";
//   static const createProfileUrl = "${baseUrl}user/auth/create_user_profile";
// }
