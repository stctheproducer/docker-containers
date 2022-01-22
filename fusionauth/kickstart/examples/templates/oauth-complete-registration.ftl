[#ftl/]
[#-- @ftlvariable name="application" type="io.fusionauth.domain.Application" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    [#-- Custom <head> code goes here --]
    <script>
    Prime.Document.onReady(function() {
      var firstInput = Prime.Document.queryFirst('form[action=complete-registration]').queryFirst('input:not([type=hidden])');
      if (firstInput !== null) {
          firstInput.focus();
      }
    });
    </script>
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title=theme.message('complete-registration')]
      <form action="complete-registration" method="POST">
        [@helpers.oauthHiddenFields/]

        <fieldset>
          [#if application.registrationConfiguration.firstName.enabled]
            [@helpers.input type="text" name="user.firstName" id="firstName" placeholder=theme.message('firstName') leftAddon="user" required=application.registrationConfiguration.firstName.required/]
          [/#if]
          [#if application.registrationConfiguration.fullName.enabled]
            [@helpers.input type="text" name="user.fullName" id="fullName" placeholder=theme.message('fullName') leftAddon="user" required=application.registrationConfiguration.fullName.required/]
          [/#if]
          [#if application.registrationConfiguration.middleName.enabled]
            [@helpers.input type="text" name="user.middleName" id="middleName" placeholder=theme.message('middleName') leftAddon="user" required=application.registrationConfiguration.middleName.required/]
          [/#if]
          [#if application.registrationConfiguration.lastName.enabled]
            [@helpers.input type="text" name="user.lastName" id="lastName" placeholder=theme.message('lastName') leftAddon="user" required=application.registrationConfiguration.lastName.required/]
          [/#if]
          [#if application.registrationConfiguration.birthDate.enabled]
            [@helpers.input type="text" name="user.birthDate" id="birthDate" placeholder=theme.message('birthDate') leftAddon="calendar" class="date-picker" dateTimeFormat="yyyy-MM-dd" required=application.registrationConfiguration.birthDate.required/]
          [/#if]
          [#if application.registrationConfiguration.mobilePhone.enabled]
            [@helpers.input type="text" name="user.mobilePhone" id="mobilePhone" placeholder=theme.message('mobilePhone') leftAddon="phone" required=application.registrationConfiguration.mobilePhone.required/]
          [/#if]
        </fieldset>

        <div class="buttons mt-4">
          [@helpers.button icon="key" color="is-dark" text=theme.message('submit')/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]