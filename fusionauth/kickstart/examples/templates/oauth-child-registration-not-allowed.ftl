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

    [@helpers.main title=theme.message('provide-parent-email')]
      <form action="child-registration-not-allowed" method="POST">
        <p>
          ${theme.message('child-registration-not-allowed')}
        </p>
        <fieldset class="mt-4">
          [@helpers.input type="text" name="parentEmail" id="parentEmail" placeholder=theme.message('parentEmail') leftAddon="user" required=true/]
        </fieldset>

        <div class="buttons mt-4">
          [@helpers.button icon="arrow-right" color="is-dark" text=theme.message('submit')/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]