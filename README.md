# Smart Poultry Laboratory Backend

## Used Technologies
Smart Poultry Laboratory uses a number of open source projects to work properly:

- [Ruby](https://www.ruby-lang.org/en/) - A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
- [Ruby On Rails](https://rubyonrails.org/) - server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller framework, providing default structures for a database, a web service, and web pages
- [MySQL](https://www.mysql.com/) - fully managed database service to deploy cloud-native applications



## _Backend-Group Tasks_

### Tasks list (Mohamed Shawky)

- [x] Create project and folders structure  (due 09/05/2021)
- [x] Setup Database migrations         (due 12/05/2021)
- [x] Users api CRUD endpoints          (due 12/05/2021)
- [x] Implement JWT Authentication      (due 12/05/2021)
- [x] Owners api CRUD endpoints         (due 13/05/2021) 
- [x] Farms api CRUD endpoints          (due 13/05/2021)
- [ ] Inspections api CRUD endpoints    (due 30/05/2021)
- [ ] Collect Dataset                   (due 30/05/2021)
- [ ] Apply Image processing on Dataset (due 30/05/2021)
- [ ] Code the machine learning module 
-
### Tasks list (Omar Baz)

- [ ] Owners api CRUD endpoints     (due 13/05/2021)
- [ ] Farms api CRUD endpoints      (due 15/05/2021)

## _Database-Group Tasks_

### Tasks list (Ahmed Saify)

- [ ] Draw the base ERD (due 07/05/2021)
- [x] Create first database model (due 07/05/2021)


## Prerequisites

Before getting started you should have the following installed and running:

- [x] Ruby - [instructions](https://rubyinstaller.org/downloads/)
- [X] Rails - [instructions](https://guides.rubyonrails.org/getting_started.html)
- [X] MySQL - [instructions](https://www.mysql.com/)
- [X] Bundler - [instructions](https://bundler.io/)
  
## Setup Project
Clone Repo
```
$ git clone https://github.com/SmartPoultryLab/Backend.git
$ cd Backend
```

Setup
```
$ bundle install
$ rails db:create
$ rails db:migrate
```

Starting Dev Server
```
$ rails s
```
