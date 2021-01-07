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
The home page consist basically of three elements excluding the labels, it contain a list of the user cards, and a list of all the transactions made by the user every transaction card contain the beneficiary name,RIB,the amount of the transition and the date of the transition as shown in here:
The HomePage consist basically of three elements excluding the labels, it contain a list of the user cards, and a list of all the transactions made by the user every transaction card contain the benificer name,RIB,the amount of the transition and the date of the transition as shown in here:

<img width="278" alt="Screenshot 2021-01-06 at 11 31 05 PM" src="https://user-images.githubusercontent.com/58625156/103834402-37a9b380-507b-11eb-8da2-de572f30469b.png">

and the last element ofthe page is the slide button, once you slide it you can go directly to The transation page:

### Transaction page
The transaction page is a form that needs the beneficiary name,RIB, the amount that you want to transform,the reason and a note if you want too, and also shows you your current Balance next to a button that going to submit the form , once you submit the form, it goes through some validation so we don’t get any null values or subtract an amount superior to our balance (Figure 3).

#### Validiton

First of all there is the empty input validation that validate if an input is empty, and if it is empty it stop the submission and give you a warning that the input is empty (Figure 4).
And there is a couple of other validation like the most important validation that validate if the amount the user have chosen is less than his balance, once the user try to validate it send a request to the database through the DAO to get the balance and check if the amount is smaller than the current balance, and if not we get another warning that the amount is more than what is in your balance (Figure 5).
And there is the rib validation that check if the rib input respect the format of the rib (Figure 5).

![Screenshot 2021-01-07 at 1 24 45 AM](https://user-images.githubusercontent.com/58625156/103835558-75f4a200-507e-11eb-9ea5-c8c95d007f34.png)

#### Return Home
If all the input passes the validation the amount will be subtracted from the balance and the app will direct you to the homepage again, and once you are in the homepage you can see the transition already added to the cards of transition.
In bellow you can see in Figure 6, where we have used valid details, so once we click on the button the app will direct us directly to the homepage with the last transiction added in there Figure 7:

![Screenshot 2021-01-07 at 1 33 54 AM](https://user-images.githubusercontent.com/58625156/103836026-bd2f6280-507f-11eb-9e43-24bc845d23d3.png)

## PS
You can Find this design in dribbble(link),and shout out to Abdul Aziz Ahwan for suggesting it 


