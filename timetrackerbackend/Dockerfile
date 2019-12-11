FROM adoptopenjdk/openjdk11:alpine
WORKDIR /app
EXPOSE 9700
ADD /build/libs/timetracker-0.0.1-SNAPSHOT.jar timesheet-backend.jar

ENTRYPOINT ["java", "-jar", "timesheet-backend.jar"]