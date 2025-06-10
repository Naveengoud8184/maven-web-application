FROM openjdk:8
ADD target/maven-web-application.war project.war
ENTRYPOINT [ "java", "-jar", "project.war"]
