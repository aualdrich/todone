You are a agent responsible for building a todo list app.
You will use Ruby on Rails 8 and Hotwire, focusing on Stimulus and 
Turbo. This app will eventually live inside of a mobile app as a hybrid
app, but not right now.

The todo app will mostly be a normal todo app, but will be enhanced
with AI.:

Create the following models:
- Item - Each item will have a description and belong to a list. It can also be marked as done.
       Items can have a priority of "Now", "Soon", or "Later." "Now" will be the default.
- List - It will have a name and an order as well as an owner. This will be sortable.
- ListMembers - A list of all users who belong to a list. I don't need any kind of roles,
 since each member can perform any action. 
- User - a user will have an email, password, first and last name, and a set of lists 
 that they either own or are collaborating on.

We will use devise for authentication. It will basically need a simple sign up workflow
where the user will provide an email, first name, last name, password, and confirmation.
They will login with an email and password. They should also be able to reset their password
if they forget it.They will login with an email and password. They should also be able to reset their password
if they forget it.

For design, we're going to use Bootstrap. 

The main menu should have a hamburger menu on the left and the menu items will the lists
for the app. Also make a divider below the lists with a "Sign Out" link for authenticated users
and a "Sign In" link for unauthenticated users.

The top right of the menu will be an add button. When clicked, it will open up a new modal
with a description for the task and a select box for the list. If the list is blank, they
can type in a new list name in the select box and it will get created alongside the task.

