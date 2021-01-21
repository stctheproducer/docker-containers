[#ftl/]
[#setting url_escaping_charset="UTF-8"]
[#-- @ftlvariable name="client_id" type="java.lang.String" --]
[#-- @ftlvariable name="code_challenge" type="java.lang.String" --]
[#-- @ftlvariable name="code_challenge_method" type="java.lang.String" --]
[#-- @ftlvariable name="hasDomainBasedIdentityProviders" type="boolean" --]
[#-- @ftlvariable name="identityProviders" type="java.util.Map<java.lang.String, java.util.List<io.fusionauth.domain.provider.BaseIdentityProvider<?>>>" --]
[#-- @ftlvariable name="loginId" type="java.lang.String" --]
[#-- @ftlvariable name="metaData" type="io.fusionauth.domain.jwt.RefreshToken.MetaData" --]
[#-- @ftlvariable name="nonce" type="java.lang.String" --]
[#-- @ftlvariable name="passwordlessEnabled" type="boolean" --]
[#-- @ftlvariable name="redirect_uri" type="java.lang.String" --]
[#-- @ftlvariable name="response_type" type="java.lang.String" --]
[#-- @ftlvariable name="scope" type="java.lang.String" --]
[#-- @ftlvariable name="showPasswordField" type="boolean" --]
[#-- @ftlvariable name="state" type="java.lang.String" --]
[#-- @ftlvariable name="timezone" type="java.lang.String" --]
[#-- @ftlvariable name="user_code" type="java.lang.String" --]
[#-- @ftlvariable name="version" type="java.lang.String" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    <script src="/js/jstz-min-1.0.6.js"></script>
    <script src="/js/oauth2/Authorize.js?version=${version}"></script>
    [@helpers.alternativeLoginsScript clientId=client_id identityProviders=identityProviders/]
    <script>
      Prime.Document.onReady(function() {
        [#-- This object handles guessing the timezone and filling in the device id of the user --]
        new FusionAuth.OAuth2.Authorize();
        [#--
         To use an in-progress indicator when waiting for an external identity provider such as Google.
           - The card class will make the default FusionAuth login card show "in progress". Modify
             this selector if your HTML has been modified, or use your own in progress indicator.
        --]
        var card = Prime.Document.queryFirst('.card');
        if (card !== null) {
          FusionAuth = FusionAuth || {};
          FusionAuth.IdentityProvider = FusionAuth.IdentityProvider || {};
          FusionAuth.IdentityProvider.InProgress = new Prime.Widgets.InProgress(card);
        }
      });
    </script>
  [/@helpers.head]
  [@helpers.body]

    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]


    [@helpers.main title=theme.message('login')]
      <form action="authorize" method="POST" class="full">
        [@helpers.oauthHiddenFields/]
        [@helpers.hidden name="showPasswordField"/]
        [#if showPasswordField && hasDomainBasedIdentityProviders]
          [@helpers.hidden name="loginId"/]
        [/#if]

        <fieldset>
          [@helpers.input type="text" name="loginId" id="loginId" autocomplete="username" autocapitalize="none" autocomplete="on" autocorrect="off" spellcheck="false" autofocus=(!loginId?has_content) placeholder=theme.message('loginId') leftAddon="user" disabled=(showPasswordField && hasDomainBasedIdentityProviders)/]
          [#if showPasswordField]
            [@helpers.input type="password" name="password" id="password" autocomplete="current-password" autofocus=loginId?has_content placeholder=theme.message('password') leftAddon="lock"/]
          [/#if]
        </fieldset>

        <div class="mt-4 buttons">
          [#if showPasswordField]
            [@helpers.button icon="key" color="is-dark" text=theme.message('submit')/]
            [@helpers.link url="/password/forgot"]${theme.message('forgot-your-password')}[/@helpers.link]
          [#else]
            [@helpers.button icon="arrow-right" text=theme.message('next')/]
          [/#if]
        </div>
      </form>
      <div>
        [#if showPasswordField && hasDomainBasedIdentityProviders]
          [@helpers.link url="" extraParameters="&showPasswordField=false"]${theme.message('sign-in-as-different-user')}[/@helpers.link]
        [/#if]
      </div>
      [#if application.registrationConfiguration.enabled]
        <div class="mt-4 buttons">
          <span class="mr-1">${theme.message('dont-have-an-account')}</span>
          [@helpers.link url="register"]${theme.message('create-an-account')}[/@helpers.link]
        </div>
      [/#if]
      [@helpers.alternativeLogins clientId=client_id identityProviders=identityProviders passwordlessEnabled=passwordlessEnabled/]
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]

  [/@helpers.body]
[/@helpers.html]