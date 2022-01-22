[#ftl/]
[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    [#-- Custom <head> code goes here --]
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title=theme.message('email-verification-form-title')]
      [#-- FusionAuth automatically handles errors that occur during email verification and outputs them in the HTML --]
      <form action="verify" method="POST">
        [@helpers.hidden name="tenantId"/]
        <p>
          ${theme.message('email-verification-form')}
        </p>
        <fieldset class="mt-4">
          [@helpers.input type="text" name="email" id="email" autocapitalize="none" autofocus=true autocomplete="on" autocorrect="off" placeholder="${theme.message('email')}" leftAddon="user"/]
        </fieldset>
        <div class="mt-4 buttons">
          [@helpers.button text=theme.message('submit')/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]