#
# Copyright (c) 2019-2020, FusionAuth, All Rights Reserved
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the License.
#

#
# Text used on the page (inside the HTML). You can create new key-value pairs here and use them in the templates.
#
child-registration-not-allowed=We cannot create an account for you. Your parent or guardian can create an account for you. Enter their email address and we will ask them to create your account.
complete-registration=Complete registration
create-an-account=Create an account
complete-external-login=Complete login on your external device
device-form-title=Device login
device-login-complete=Successfully connected device
device-title=Connect Your Device
dont-have-an-account=Don't have an account?
email-verification-complete=Thank you. Your email has been verified.
email-verification-complete-title=Email verification complete
email-verification-form=Complete the form to request a new verification email.
email-verification-form-title=Email verification
email-verification-sent=We have sent an email to %s with your verification code. Follow the instructions in the email to verify your email address.
email-verification-sent-title=Verification sent
forgot-password=Forgot your password? Type in your email address in the form below to reset your password.
forgot-password-email-sent=We've sent you an email containing a link that will allow you to reset your password. Once you receive the email follow the instructions to change your password.
forgot-password-email-sent-title=Email sent
forgot-password-title=Forgot password
forgot-your-password=Forgot your password?
help=Help
login=Login
logging-out=Logging out
logout-title=Logging out
next=Next
or=Or
parent-notified=We've sent an email to your parent. They can setup an account for you once they receive it.
parent-notified-title=Parent notified
password-alpha-constraint=Must contain at least one non-alphanumeric character
password-case-constraint=Must contain both upper and lower case characters
password-change-title=Update your password
password-changed=Your password has been updated successfully.
password-changed-title=Password updated
password-constraints-intro=Password must meet the following constraints:
password-length-constraint=Must be between %s and %s characters in length
password-number-constraint=Must contain at least one number
password-previous-constraint=Must not match the previous %s passwords
passwordless-login=Passwordless login
passwordless-button-text=Login with a magic link
provide-parent-email=Provide parent email
registration-verification-complete=Thank you. Your registration has been verified.
registration-verification-complete-title=Registration verification complete
registration-verification-sent=We have sent an email to %s with your verification code. Follow the instructions in the email to verify your registration address.
registration-verification-sent-title=Verification sent
registration-verification-title=Registration verification
return-to-login=Return to login
send-another-code=Send another code
send-code-to-phone=Send a code to your mobile phone
sign-in-as-different-user=Sign in as a different user
two-factor-challenge=Two factor challenge
trust-computer=Trust this computer for %s days
wait-title=Complete login on your external device
waiting=Waiting


#
# Success messages displayed at the top of the page. These are hard-coded in the FusionAuth code and the keys cannot be changed. You can
# still change the values though.
#
sent-code=Code successfully sent


#
# Labels for form fields. You can change the key names to anything you like but ensure that you don't change the name of the form fields.
#
birthDate=Birth date
code=Enter your verification code
email=Email
firstName=First name
fullName=Full name
lastName=Last name
loginId=Email
middleName=Middle name
mobilePhone=Mobile phone
password=Password
passwordConfirm=Confirm password
parentEmail=Parent's email
register=Register
register-step=Step %d of %d
send=Send
submit=Submit
username=Username
userCode=Enter your user code
verify=Verify

#
# Custom Registration forms. These must match the domain names.
#
user.email=Email
user.password=Password
user.birthDate=Birthdate

#
# Custom Admin User and Registration form sections.
#
# - Names are optional, and if not provided they will be labeled 'Section 1', 'Section 2', etc.
# - The first section label on the User and and Registration form in the admin UI will be omitted unless
#   you specify a named label below. For your convenience, these sections are configured below and commented out as 'Optionally name me!'.
#
# - By default, all section labels will be used for all tenants, and all applications respectively.
#
# - If you want a section title that is specific to a tenant in a user form, you may optionally prefix the key with the Tenant Id.
#
#   For example, if the tenant Id is equal to: cbeaf8fe-f4a7-4a27-9f77-c609f1b01856
#
#   [cbeaf8fe-f4a7-4a27-9f77-c609f1b01856]{user-form-section}2=Tenant specific label for section 2
#
# - If you want a section title that is specific to an Application in a registration form, you may optionally prefix the key with the Application Id.
#
#   For example, if the application Id is equal to: de2f91c7-c27a-4ad6-8be2-cfb36996cc89
#
#   [de2f91c7-c27a-4ad6-8be2-cfb36996cc89]{registration-form-section}2=Application specific label for section 2

# {user-form-section}1=Optionally name me!
{user-form-section}2=Two factor
{user-form-section}3=Options

# {registration-form-section}1=Optionally name me!
{registration-form-section}2=Options

#
# Custom Admin User and Registration tooltips
#
{tooltip}registration.preferredLanguages=Select one or more preferred languages
{tooltip}user.preferredLanguages=Select one or more preferred languages

#
# Custom Registration form validation errors.
#
[confirm]user.password=Confirm password

#
# Default validation errors. Add custom messages by adding field messages.
# For example, to provide a custom message for a string field named user.data.companyName, add the
# following message key: [blank]user.data.companyName=Company name is required
#
[blank]=Required
[confirm]=Confirm
[couldNotConvert]=Invalid
[doNotMatch]=Values do not match
[duplicate]=Already exists
[empty]=Required
[inUse]=In use
[invalid]=Invalid
[missing]=Required
[notEmail]=Invalid email
[tooLong]=Too long
[tooShort]=Too short

#
# Tooltips. You can change the key names and values to anything you like.
#
{tooltip}trustComputer=Do not select this on a public computer. Trusting this computer will allow you to bypass two factor authentication for the configured duration


#
# Validation errors when forms are invalid. The format is [<error-code>]<field-name>. These are hard-coded in the FusionAuth code and the
# keys cannot be changed. You can still change the values though.
#
[invalid]applicationId=The provided application id is invalid.
[blank]code=Required
[invalid]code=Invalid code
[blank]email=Required
[blank]loginId=Required
[blank]parentEmail=Required
[blank]password=Required
[blank]user_code=Required
[invalid]user_code=Invalid user code
[notEqual]password=Passwords don't match
[onlyAlpha]password=Password requires a non-alphanumeric character
[previouslyUsed]password=Password has been recently used
[requireNumber]password=Password requires at least one number
[singleCase]password=Password requires upper and lower case characters
[tooYoung]password=Password was changed too recently, try again later
[tooShort]password=Password does not meet the minimum length requirement
[tooLong]password=Password exceeds the maximum length requirement
[blank]passwordConfirm=Required
[missing]user.birthDate=Required
[couldNotConvert]user.birthDate=Invalid
[blank]user.email=Required
[notEmail]user.email=Invalid email
[duplicate]user.email=An account already exists for that email
[inactive]user.email=An account already exists for that email but is locked. Contact the administrator for assistance
[blank]user.firstName=Required
[blank]user.fullName=Required
[blank]user.lastName=Required
[blank]user.middleName=Required
[blank]user.mobilePhone=Required
[invalid]user.mobilePhone=Invalid
[blank]user.parentEmail=Required
[blank]user.password=Required
[doNotMatch]user.password=Passwords don't match
[singleCase]user.password=Password must use upper and lowercase characters
[onlyAlpha]user.password=Password must contain a punctuation character
[requireNumber]user.password=Password must contain a number character
[tooShort]user.password=Password does not meet the minimum length requirement
[tooLong]user.password=Password exceeds the maximum length requirement
[blank]user.username=Required
[duplicate]user.username=An account already exists for that username
[inactive]user.username=An account already exists for that username but is locked. Contact the administrator for assistance
[moderationRejected]user.username=That username is not allowed. Please select a new one

#
# Breached password messages
#
# - ExactMatch        The password and email or username combination was found in a breached data set.
# - SubAddressMatch   The password and email or username, or email sub-address was found in a breached data set.
# - PasswordOnly      The password was found in a breached data set.
# - CommonPassword    The password is one of the most commonly known breached passwords.
#
[breachedExactMatch]password=This password was found in the list of vulnerable passwords, and is no longer secure. Select a different password.
[breachedExactMatch]user.password=This password was found in the list of vulnerable passwords, and is no longer secure. Select a different password.
[breachedSubAddressMatch]password=This password was found in the list of vulnerable passwords, and is no longer secure. Select a different password.
[breachedSubAddressMatch]user.password=This password was found in the list of vulnerable passwords, and is no longer secure. Select a different password.
[breachedPasswordOnly]password=This password was found in the list of vulnerable passwords, and is no longer secure. Select a different password.
[breachedPasswordOnly]user.password=This password was found in the list of vulnerable passwords, and is no longer secure. Select a different password.
[breachedCommonPassword]password=This password is a commonly known vulnerable password. Select a more secure password.
[breachedCommonPassword]user.password=This password is a commonly known vulnerable password. Select a more secure password.

#
# Error messages displayed at the top of the page. These are always inside square brackets. These are hard-coded in the FusionAuth code and
# the keys cannot be changed. You can still change the values though.
#
[APIError]=An unexpected error occurred.
[AdditionalFieldsRequired]=Additional fields are required to complete your registration.
[EmailVerificationDisabled]=Email verification functionality is currently disabled. Contact your FusionAuth administrator for assistance.
[ErrorException]=An unexpected error occurred.
[ForgotPasswordDisabled]=Forgot password handling is not enabled. Please contact your system administrator for assistance.
[InvalidChangePasswordId]=Your password reset code has expired or is invalid. Please retry your request.
[InvalidEmail]=FusionAuth was unable to find a user with that email address.
[InvalidIdentityProviderId]=Invalid request. Unable to handle the identity provider login. Please contact your system administrator or support for assistance.
[InvalidLogin]=Invalid login credentials.
[InvalidVerificationId]=Sorry. The request contains an invalid or expired verification Id. You may need to request another verification to be sent.
[LoginPreventedException]=Your account has been locked. Please contact your system administrator.
[MissingApplicationId]=An applicationId is required and is missing from the request.
[MissingChangePasswordId]=A changePasswordId is required and is missing from the request.
[MissingEmail]=Your email address is required and is missing from the request.
[MissingEmailAddressException]=You must have an email address to utilize passwordless login.
[MissingPKCECodeVerifier]=The code_verifier could not be determined, this request likely did not originate from FusionAuth. Unable to complete this login request.
[MissingVerificationId]=A verification Id was not sent in the request.
[NotFoundException]=The requested OAuth configuration is invalid.
[OAuthv1TokenMismatch]=Invalid request. The token provided on the OAuth v1 callback did not match the one sent during authorization. Unable to handle the identity provider login. Please contact your system administrator or support for assistance.
[Oauthv2Error]=An invalid request was made to the Authorize endpoint. %s
[PasswordlessRequestSent]=An email is on the way.
[PasswordChangeRequired]=You must change your password in order to continue.
[PasswordChangeReasonExpired]=Your password has expired and must be changed.
[PasswordChangeReasonBreached]=Your password was found in the list of vulnerable passwords and must be changed.
[PasswordChangeReasonValidation]=Your password does not meet password validation rules and must be changed.
[PasswordlessDisabled]=Passwordless login is not currently configured.
[InvalidPasswordlessLoginId]=Your link has expired or is invalid. Please retry your request.
[PushTwoFactorFailed]=Failed to send a verification code using the configured push service.
[SSOSessionDeletedOrExpired]=You have been logged out of FusionAuth.
[TenantIdRequired]=FusionAuth is unable to determine which tenant to use for this request. Please add the tenantId to the URL as a request parameter.
[TwoFactorTimeout]=You did not complete the two factor challenge in time. Please complete login again.
[UserExpiredException]=Your account has expired. Please contact your system administrator.
[UserLockedException]=Your account has been locked. Please contact your system administrator.
[UserUnauthenticated]=Oops. It looks like you've gotten here by accident. Please return to your application and log in to begin the authorization sequence.
[ExternalAuthenticationExpired]=Your external authentication request has expired, please re-attempt authentication.

# External authentication errors
# - Some of these errors are development time issues. But it is possible they could be shown to an end user depending upon your configuration.
[ExternalAuthenticationException]AppleIdToken=The id_token returned from Apple is invalid or cannot be verified. Unable to complete this login request.
[ExternalAuthenticationException]AppleTokenEndpoint=A request to the Apple Token API has failed. Unable to complete this login request.
[ExternalAuthenticationException]AppleUserObject=Failed to read the user details provided by Apple. Unable to complete this login request.
[ExternalAuthenticationException]FacebookMe=A request to the Facebook Me API has failed. Unable to complete this login request.
[ExternalAuthenticationException]FacebookMePicture=A request to the Facebook Picture API has failed. Unable to complete this login request.
[ExternalAuthenticationException]FacebookAccessToken=A request to the Facebook Access Token Info API has failed. Unable to complete this login request.
[ExternalAuthenticationException]GoogleTokenInfo=A request to the Google Token Info API has failed. Unable to complete this login request.
[ExternalAuthenticationException]InvalidApplication=The requested application does not exist or is currently disabled. Unable to complete this login request.
[ExternalAuthenticationException]InvalidIdentityProviderId=The requested identityProviderId is invalid. Unable to complete this login request.
[ExternalAuthenticationException]LinkedInEmail=A request to the LinkedIn Email API has failed. Unable to complete this login request.
[ExternalAuthenticationException]LinkedInMe=A request to the LinkedIn Me API has failed. Unable to complete this login request.
[ExternalAuthenticationException]LinkedInToken=A request to the LinkedIn Token API has failed. Unable to complete this login request.
[ExternalAuthenticationException]MissingEmail=An email address was not provided for the user. This account cannot be used to login, unable to complete this login request.
[ExternalAuthenticationException]MissingUser=An authentication request cannot be completed because the user that started the request no longer exists. This account cannot be used to login, unable to complete this login request.
[ExternalAuthenticationException]OpenIDConnectToken=A request to the OpenID Connect Token API has failed. Unable to complete this login request.
[ExternalAuthenticationException]OpenIDConnectUserinfo=A request to the OpenID Connect Userinfo API has failed. Unable to complete this login request.
[ExternalAuthenticationException]TwitterAccessToken=A request to the Twitter Access Token API has failed. Unable to complete this login request.
[ExternalAuthenticationException]TwitterCallbackUnconfirmed=The Twitter callback URL has not been confirmed. Unable to complete this login request.
[ExternalAuthenticationException]TwitterRequestToken=A request to the Twitter Request Token API has failed. Unable to complete this login request.
[ExternalAuthenticationException]TwitterVerifyCredentials=A request to Twitter Verify Credentials API has failed. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponse=The SAML AuthnResponse object could not be parsed or verified. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseAudienceVerificationFailed=The SAML audience failed validation. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseAudienceNotBeforeVerificationFailed=The SAML audience is not yet available to be confirmed. Unable to complete this request.
[ExternalAuthenticationException]SAMLResponseAudienceNotOnOrAfterVerificationFailed=The SAML audience is no longer eligible to be confirmed. Unable to complete this request.
[ExternalAuthenticationException]SAMLResponseDestinationVerificationFailed=The SAML destination failed validation. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseSubjectNotBeforeVerificationFailed=The SAML subject is not yet available to be confirmed. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseSubjectNoOnOrAfterVerificationFailed=The SAML subject is no longer eligible to be confirmed. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseStatus=The SAML AuthnResponse status indicated the request has failed. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseUnexpectedOrReplayed=The SAML response not requested or has already been processed. Unable to complete this login request.
[ExternalAuthenticationException]SAMLResponseUnsolicited=The SAML response was un-solicited. Unable to complete this login request.

# OAuth token endpoint and callback errors
[TokenExchangeFailed]=An unexpected error occurred while completing your login attempt. Please attempt the request again.
[TokenExchangeException]=We were unable to complete your login attempt. Please attempt the request again.

# Webhook transaction failure
[WebhookTransactionException]=One or more webhooks returned an invalid response or were unreachable. Based on your transaction configuration, your action cannot be completed.
