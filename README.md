## Basic 
- for the basic task created a s3 bucket in ap-south-1 region with name "minfy-training-akhilesh-s3-1321" \
and after that added that bucket itself as the remote backend for storing state file 
![Screenshot (23)](https://github.com/user-attachments/assets/d2f9e41e-10ed-4771-954e-dfbfb497380f)

## Exercise 1
created a vpc named "day-02-akhilesh-vpc" and a internet gateway "day-02-akhilesh-ig" and attached it to vpc ,subnet "day-02-akhilesh-sb" \
route table "day-02-akhilesh-rt" attached this route to subnet and internet gateway to make this subnet as public \
and created a security group "day-02-akhilesh-sg" with inbound rules as http,https,ssh \
created a amazon linux instance named "day-02-akhilesh-ec2" with these above resources and while creating uploaded html file as user data
![Screenshot (24)](https://github.com/user-attachments/assets/5849b1d6-ea19-43c5-94aa-da9202625eae)

## take-home/assignment-01-s3-static-website 
- used a existing bucket "day-02-akhilesh-backend" as remote backend for storing state file
- created an s3 bucket and granted policy for putting object and and un blocked default policies \
  granted permission for everyone to access s3 bucket link and uploaded a html file into that bucket
  ![Screenshot (31)](https://github.com/user-attachments/assets/3390c503-3f4b-4296-b231-bbf524caacc6)
![Screenshot (32)](https://github.com/user-attachments/assets/28289cda-892a-4b9f-88ee-76e5d922f079)

## assignment-02-reusable-webserver
-  created a module for creating ec2 intances replaced all hardcoded values with variables in module \
  called this module in root level and provided all the necessary varibles described at the module level and finally created an intance named "webserver-from-module in a public subnet named 
  "day-02-akhilesh-sb" in "day-02-akhilesh-vpc"
![Screenshot (33)](https://github.com/user-attachments/assets/a5ba5c29-3278-4c89-8726-82821fdeb400)
![Screenshot (34)](https://github.com/user-attachments/assets/cbce48e2-f458-43b2-ae44-94ea1a1f3124)
  
