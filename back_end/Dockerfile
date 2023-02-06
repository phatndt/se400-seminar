# Sử dụng base image hệ điều hành alpine để tiết kiệm dung lượng
FROM openjdk:11

#EXPOSE 8080
# Đặt biến JAR_FILE là file có đuôi jar trong thư mục target
ARG JAR_FILE=build/libs/back_end-0.0.1-SNAPSHOT.jar

# Copy JAR_FILE vào docker image với tên file mới là app.jar
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]