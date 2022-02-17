## Movie Review App (IMDb Clone)

## Developed by EMELU NNAMDI A
## JetThoughts Test Project

This is a movie review project. The home page displays the list of different movies. Users who visit this site will get information about the listed movies. Each movie comes with a video clip that shows the highlight of the movie. Only users who are registered on the site will be allowed to review or rate a movie. Unregistered users who will attempt to see movie details or rate a movie will be directed to the login page.
Registered users can sign in to the app using their email and password. Signed-in users will have the privilege to see each movie's details by clicking on the plus icon at the top left corner of each movie. This icon will open the movie details page. The movie's details page displays the various star rating of that movie by different users as well as the average rating. Information such as movie title, director, description movie-length, category, clip, and thumbnail images are displayed. The user can click on the review button to add his/her review. The movie is listed in a horizontal row. The movie list has a pagination feature that loads six movies in a row. The pagination feature allows users to move front or backward to see more movies. Signed-in users will also see a selection field at the top right corner of the movie list. This will help them to sort the movie according to their categories. If a logged-in user is an admin, the Admin Panel link will also be displayed at the top right corner below the navigation area. The Admin panel is implemented using the rails admin gem. It helps the admin to manage and perform CRUD actions on the app.

## Viewing Page

This project is designed to work on a desktop or large screen at this time. Responsiveness will be implemented in the future time. 

## Preview

## Cover Page
![image](image/Cover-page.png)

## Details Page One
![image](image/movie-page-1.png)

## Details Page two
![image](image/movie-show-2.png)

## Movie Display
![image](image/Movie-display-and-selection.png)

## Admin Home Page
![image](image/Admin-home.png)
## Features 
- Users can sign up in the app.
- Users can log in after signing up. 
- Signed-in users can see movie details.
- Signed-in users can rate the movie from the details page.
- Movie can be sorted based on category.
- Users use the pagination feature below the movie list to see more movies.
- Movie details page displays the average rating for each movie.
- Movie Rating from 1 to 10.
- Admin panel to perform CRUD action and manage movies.

## Project SetUp/Installation (Local Testing)

Get a local copy of the file. Clone with HTTPS using the command below.

```
git clone https://github.com/Zubenna/movie_review_project.git
```
### Access project folders 
```
cd movie_review_project
```
### Install all the dependencies
```
bundle install
```
### Create the database with the following command
```
rails db:create
```
### Migrate the database with the following command
```
rails db:migrate
```
### Populate the database with the following command
```
rails db:seed
```
### Run Application test while on the project root.
Test has been written for this project using Rspec. Various features and model relationship (association) has been tested. You can see the test code in spect directory at the root of the project directory. Test coverage is about 96%

#### Test for various features using.
```
rspec spec/features/authentication_spec.rb
```
```
rspec spec/features/movie_spec.rb
```
```
rspec spec/features/review_spec.rb
```
#### Test model associations using.
```
rspec spec/model/movie_spec.rb
```
```
rspec spec/model/review_spec.rb
```
```
rspec spec/model/user_spec.rb
```
#### Type rspec in the project root to run all tests.
```
rspec
```
## Run the server
- While in the project root, start rails server with the command 'rails server'.
- In your browser, type http://localhost:3000 to access the app.
- You can now sign up or log in, to test all features.

## Test Project With the Following Accounts

- email: userone.email@example.com, password: 123456 (Admin User)
- email: userthree.email@example.com, password: 123456 (Normal User)

## Before testing
- Login with the admin account and create at least three movies for each category listed in the movie selection area. This is to enable you see all the features and avoid breaking the app. This app uses rails active storage to store image and video files locally and Amazon S3 storage for production (hosted version). The hosted version has some movies and users already created. You can add more and start reviewing the movies.

## Uploading Files
- This app stores video and image files using Amazon S3 Storage in combination with rails active storage.
- Do not exceed 11MB for video and 2MB for thumbnail image while creating movies.
- Login with the admin account provided in this document to access the admin panel, create new movies along with uploading movie clip and thumbnail image.

## Live Version
- [Launch App](https://intense-eyrie-27347.herokuapp.com/)

## Built With
- Ruby, Ruby on Rails
- RSpec, Capybara, Rails admin, will paginate gem
- HTML
- CSS
- Rails Active Storage for file uploads.

## Author

👤 **Nnamdi Emelu**
- Github: [@zubenna](https://github.com/zubenna)
- Twitter: [@zubenna](https://twitter.com/zubenna)
- Linkedin: [nnamdi-emelu](https://www.linkedin.com/in/nnamdi-emelu/)

##  Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Zubenna/movie_review_project/issues/new)

## Show your support

Give a star if you like this project!

## Acknowledgments
- JetThoughts Test Project
