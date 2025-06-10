FROM openjdk:8
ADD target/maven-web-application.war project.war
ENTRYPOINT [ "Java", "-jar", "project.war"]
