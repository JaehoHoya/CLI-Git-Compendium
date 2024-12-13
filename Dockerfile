FROM openjdk:21-jdk-slim
WORKDIR /app

RUN mkdir -p /app/upload && chmod 777 /app/upload    #R(4), W(2), X(1)

COPY Fitizen.war Fitizen.war
COPY test.jpg /app/upload/test.jpg
#COPY images /app/images/

ENTRYPOINT ["java", "-jar", "/app/Fitizen.war"]