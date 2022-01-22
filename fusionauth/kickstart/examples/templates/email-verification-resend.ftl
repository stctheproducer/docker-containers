[#ftl/]
[#-- @ftlvariable name="email" type="java.lang.String" --]
[#-- @ftlvariable name="emailSent" type="boolean" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    [#-- Custom <head> code goes here --]
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title=theme.message('email-verification-sent-title')]
      [#if emailSent?? && emailSent]
        <p>
          ${theme.message('email-verification-sent', email)}
        </p>
      [/#if]
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]