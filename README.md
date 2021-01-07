# bank_app
bank application created with flutter

## I- Introduction

This is a flutter application that uses MySQL Database to handle a bank account, In this project, I used only one user, but I made the database and the backend in a way that you can easly use it for multi users.
You can differentiate between users if you create a user login, and all you have to do is change the DAO and remove the statiq SQL requests and add the user id to it 
The application bassically manage users transactions(only the current user can send money to a RIB, the app don’t contain a verification on if the user exist in the database, but once again the rib is unique in the user table(client) so you can easily put a validation there).

## II- Class Diagram 

Excluding that every request to the database passes through a DAO class the class diagram is basicly two classes communicating.



## III- Screens
### Home Page:
The home page consist basically of three elements excluding the labels, it contain a list of the user cards, and a list of all the transactions made by the user every transaction card contain the benificer name,RIB,the amount of the transition and the date of the transition as shown in here:
The HomePage consist basically of three elements excluding the labels, it contain a list of the user cards, and a list of all the transactions made by the user every transaction card contain the benificer name,RIB,the amount of the transition and the date of the transition as shown in here:

<img width="278" alt="Screenshot 2021-01-06 at 11 31 05 PM" src="https://user-images.githubusercontent.com/58625156/103834402-37a9b380-507b-11eb-8da2-de572f30469b.png">
