FROM amazoncorretto:21-alpine

WORKDIR /app

COPY target/todo-app-1.0.jar app.jar

EXPOSE 8081

CMD ["java", "-jar", "app.jar"]
