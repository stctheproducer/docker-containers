[#ftl/]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head title=theme.message('device-title')/]
  [@helpers.body]

    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title=theme.message('device-form-title')]
      <p>
        ${theme.message('device-login-complete')}
      </p>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]