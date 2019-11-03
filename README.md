# Using Jenkins

1 Boot the jenkins container. To enter the container type docker-compose exec jenkins bash.
2 Go to `http://localhost:8090/` (if you didn’t change your default port mapping)
3 Authenticate from the web app.

    Default username is admin.
    Default password is docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword.

(To enter container as root type docker-compose exec --user root jenkins bash).

4 Install some plugins.

5 Create your first Admin user, or continue as Admin.

Note: to add user go to `http://localhost:8090/securityRealm/addUser` and to restart it from the web app visit `http://localhost:8090/restart`.

You may wanna change the default security configuration, so go to `http://localhost:8090/configureSecurity/` under Authorization and choosing “Anyone can do anything” or “Project-based Matrix Authorization Strategy” or anything else.
