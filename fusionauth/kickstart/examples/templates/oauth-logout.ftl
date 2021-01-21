[#ftl/]
[#-- @ftlvariable name="allLogoutURLs" type="java.util.Set<java.lang.String>" --]
[#-- @ftlvariable name="registeredLogoutURLs" type="java.util.Set<java.lang.String>" --]
[#-- @ftlvariable name="redirectURL" type="java.lang.String" --]
[#import "../_helpers.ftl" as helpers/]

[#-- You may adjust the duration before we redirect the user --]
[#assign logoutDurationInSeconds = 3.5 /]

[@helpers.html]
  [@helpers.head title=theme.message('logout-title')]
  [#if redirectURL?has_content]
    <meta http-equiv="Refresh" content="${logoutDurationInSeconds}; url=${redirectURL}">
  [/#if]
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title=theme.message('logging-out')]
      <div id="progress">
        <b-progress :value="progress" size="is-large" :max="100"></b-progress>
      </div>
    [/@helpers.main]

    [#-- use allLogoutURLs to call the logout URL of all applications in the tenant, or use registeredLogoutURLs to log out of just the applications the user is registered for --]
    [#list allLogoutURLs![] as logoutURL]
      <iframe src="${logoutURL}" style="width:0; height:0; border:0; border:none;"></iframe>
    [/#list]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]