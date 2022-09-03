# Pre-requisites

1. Have an instance of MySQL database running on your local machine.
2. Run the bd9_DB.sql file to populate the required database tables.
3. Run the command `gradle bootJar` to compile the code
4. Run the command `gradle bootRun` to start the server
5. Curl is installed in the system


 
# Curl commands

1. Register a user:

Windows user: `curl --location --request POST http://127.0.0.1:8080/api/user/registration --header "Content-Type: application/json" --data-raw "{ \"name\": \"Steve\", \"username\": \"sroger\", \"password\": \"captain@america\", \"role\": \"STUDENT\", \"description\": \"I am looking to get in shape\", \"first_name\": \"Steve\", \"last_name\": \"Roger\", \"gender\": \"male\", \"address\": \"4313 Rowalt Dr\", \"mobile\": \"2321234321\", \"city\": \"College Park\", \"zipcode\": 20740, \"country\": \"USA\" }"`

Linux/Mac user: `curl --location --request POST http://127.0.0.1:8080/api/user/registration --header "Content-Type: application/json" --data-raw "{ "name": "Steve", "username": "sroger", "password": "captain@america", "role": "STUDENT", "description": "I am looking to get in shape", "first_name": "Steve", "last_name": "Roger", "gender": "male", "address": "4313 Rowalt Dr", "mobile": "2321234321", "city": "College Park", "zipcode": 20740, "country": "USA" }"`

2. Retrieve a student:

Without token: `curl --location --request GET "http://127.0.0.1:8080/api/student/sroger"`

With token: `curl --location --request GET "http://127.0.0.1:8080/api/student/sroger" --header "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzcm9nZXIiLCJyb2xlcyI6IlNUVURFTlQiLCJleHAiOjE2NTk0ODAwNDJ9.hE_5G4m93KmO9Gj6sT2F4H4SjPAc1ejwdAsNp8KuaUDNfM2DmJkcjEr5jhCx30r_nCHAq7hYibH2Nuq44FbCKA"`

3. Login and get token:

`curl --location --request GET "http://127.0.0.1:8080/api/user/login" --header "Authorization: Basic c3JvZ2VyOmNhcHRhaW5AYW1lcmljYQ=="`
