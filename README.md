# README
# Happy Land Dogs and Friends
This README would normally document whatever steps are necessary to get the
application up and running.

## Dependencies:

* Ruby version
  '2.5.3'
* Rails version
  'rails', '~> 5.2.6'


## Deployment (Heroku):
To get started first you need an account on heroku and AWS with S3.

Add the S3 keys in Heroku ENV

- ***ID_ENT***: AWS ID
- ***KEY_ENT***: Secret Key

Then create a project using the following commands

```
heroku create
git push heroku 
heroku run rails db:migrate
```

run `heroku open` to preview the production page


## Admin Account
Create the admin account using `heroku console`

```
Admin.create(email: 'admin@project.com', password: '123456')
```

## Demo APP
 [https://salty-reaches-96405.herokuapp.com/](https://salty-reaches-96405.herokuapp.com/)




## Trello
  https://trello.com/b/cNknzqbk/happyland-dogs-and-friends

