FROM openjdk
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Dzzz=1", "-jar", "/app.jar"]
