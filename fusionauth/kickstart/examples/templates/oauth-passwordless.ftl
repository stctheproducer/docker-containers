[#ftl/]
[#-- @ftlvariable name="pushEnabled" type="boolean" --]
[#-- @ftlvariable name="pushPreferred" type="boolean" --]
[#-- @ftlvariable name="systemConfiguration" type="io.fusionauth.domain.SystemConfiguration" --]
[#-- @ftlvariable name="trustComputer" type="boolean" --]
[#-- @ftlvariable name="userCanReceivePush" type="boolean" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head/]
  [@helpers.body]

    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title=theme.message('passwordless-login')]
      [#setting url_escaping_charset='UTF-8']
      <form action="passwordless" method="POST">
        [@helpers.oauthHiddenFields/]

        <fieldset>
          [@helpers.input type="text" name="loginId" id="loginId" autocomplete="username" autocapitalize="none" autocomplete="on" autocorrect="off" spellcheck="false" autofocus=true placeholder=theme.message('loginId') leftAddon="user" required=true/]
        </fieldset>

        <div class="buttons mt-4">
          [@helpers.button color="is-dark" icon="send" text=theme.message('send')/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]