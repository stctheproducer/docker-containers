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

    [@helpers.main title=theme.message('forgot-password-title')]
      <form action="forgot" method="POST" class="full">
        [@helpers.oauthHiddenFields/]

        <p>
          ${theme.message('forgot-password')}
        </p>
        <fieldset class="mt-4">
          [@helpers.input type="text" name="email" id="email" autocapitalize="none" autofocus=true autocomplete="on" autocorrect="off" placeholder=theme.message('email') leftAddon="user" required=true/]
        </fieldset>
        <div class="buttons mt-4">
          [@helpers.button color="is-dark" text=theme.message('submit')/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]