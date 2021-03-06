<div align="center">

# [PreKinder](https://pre-kinder.herokuapp.com/)
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
![Build Badge][build-badge]

<img src="https://user-images.githubusercontent.com/73204318/141081548-a93d278d-72ef-4532-9db7-46da0d953c3d.png"><br>
<br>

  An app that makes Pre-K organizing -- child's play.

---

## Contributors

|Jacq Whitmer|Dane Brophy|Isika Powers|Ezzedine Alwafai|Kevin Nguyen
|--- |--- |--- |--- |--- |
|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/jrwhitmer)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/danembb)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/Isikapowers)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/ealwafai)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/denverdevelopments)
|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/jacqwhitmer/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/dane-brophy/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/isika/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/ezzedine-alwafai/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/kevin-nguyen-59510520a/)


## Table of Contents
|Links
|--- |
[Tools Used](#tools-used)
[Setup](#setup)
[Learning Goals](#learning-goals)
[Database Schema](#database-schema)
[Wireframes](#wireframes)


## Tools Used

|Development|Development|Testing|Deployment
|--- |--- |--- |--- |
|[<img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/en/downloads/)|[<img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)|[ <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/rspec/rspec-rails)|[<img src="https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white" />](http://virtual-watch-party.herokuapp.com)|
|[ <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />](https://rubygems.org/gems/rails/versions/5.2.6)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://desktop.github.com/)|[<img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/teamcapybara/capybara)|[<img src= "https://img.shields.io/badge/ci-circleCI-blue"/>](https://circleci.com/)|
|[<img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/pry/versions/0.10.3)|[<img src="https://img.shields.io/badge/b-bootstrap-yellow"/>](https://rubygems.org/gems/bootstrap/versions/4.0.0)|[<img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/bblimke/webmock)
|[<img src="https://img.shields.io/badge/sql-postgreSQL-green"/>](https://www.postgresql.org/)|[<img src="https://img.shields.io/badge/-HTML5-brightgreen"/>](https://developer.mozilla.org/en-US/docs/Web/HTML)|[<img src="https://img.shields.io/badge/-VCR-lightgrey"/>](https://github.com/vcr/vcr)
|[<img src="https://img.shields.io/badge/-Postico-yellowgreen"/>](https://eggerapps.at/postico/)|[<img src="https://img.shields.io/badge/-CSS3-brightgreen"/>](https://developer.mozilla.org/en-US/docs/Web/CSS)|[<img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/launchy/versions/2.4.3)
|[<img src="https://img.shields.io/badge/OmniAuth-Google%20Oauth2-brightgreen"/>](https://github.com/zquestz/omniauth-google-oauth2)|[<img src="https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/rubocop/versions/0.39.0)|[<img src="https://img.shields.io/badge/-FactoryBot-green"/>](https://github.com/thoughtbot/factory_bot)
|[<img src="https://img.shields.io/badge/-Figaro-yellow"/>](https://github.com/laserlemon/figaro)|[<img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />](https://atom.io/)|[<img src="https://img.shields.io/badge/-Faker-blue"/>](https://github.com/faker-ruby/faker)
|[<img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/lostisland/faraday)||[<img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/simplecov/versions/0.12.0)|
|[<img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />](https://www.postman.com/product/rest-client/)|

</div>

<div align="center">

## Setup

</div>


  This project requires Ruby 2.7.2.

  * Fork this repository
  * From the command line, install gems and set up your DB:
      * `bundle install && bundle update`
      * `rails db:{create,migrate,seed}`
  * Run the test suite with `bundle exec rspec -fd`
  * Run your development server with `rails s` to see the app in action.

#### Project Configurations

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/prekinder/frontend/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 5.2.6
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate,seed}
      Created database 'back-end_development'
      Created database 'back-end_test'
      ```

      ```bash
      $ bundle install
      ```

  * [API key configuration](https://github.com/laserlemon/figaro)
      ```bash
      $ bundle exec figaro install
      ```
      Add your credentials & API keys to `config/application.yml`:

      ```yml
      #Backend Repo:
      1st API: go to [Weather API](https://www.weatherapi.com/signup.aspx) to request an API key<br>
      2nd API: at [Nager.Date API](https://date.nager.at/), no key needed<br>

      key: '<your api key>'
      ```

  * How to run the test suite
      ```bash
      $ bundle exec rspec -fd
      ```

  * [Local Deployment](http://localhost:3000), for testing
      ```bash
      $ rails s
      => Booting Puma
      => Rails 5.2.6 application starting in development
      => Run `rails server -h` for more startup options
      Puma starting in single mode...
      * Version 3.12.6 (ruby 2.7.2-p137)
      * Min threads: 5, max threads: 5
      * Environment: development
      * Listening on tcp://localhost:3000
      Use Ctrl-C to stop
      ```

  * [Heroku Deployment](https://pre-kinder.herokuapp.com/), for production


<div align="center">

## Learning Goals

</div>


&nbsp; &nbsp; ??? &nbsp; &nbsp; Consume two or more external APIs which require authentication<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Build APIs that return JSON responses<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Use an external OAuth provider to authenticate users<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Create a project with a separate frontend and backend<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Organize and refactor code to be more maintainable<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Implement a self-referential relationship in ActiveRecord<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Use Rails to create web pages that allow users to CRUD resources<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Create instance and class methods on a Rails model that use ActiveRecord methods and helpers<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Write model and feature tests that fully cover data logic and potential user behavior<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Utilize Continuous Integration via Travis CI or CircleCI<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Deploy to Heroku<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Implement a production-quality user interface using Bootstrap or other common CSS styling framework<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Implement project management by using project boards, participating in daily stand-ups and retros<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Utilize quality workflow practices: small commits, descriptive pull requests, and code reviews<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Write thorough, understandable documentation<br>
&nbsp; &nbsp; ??? &nbsp; &nbsp; Apply RuboCop???s style guide for code quality<br>

<div align="center">

## Database Schema

<img src="https://user-images.githubusercontent.com/73204318/140886535-bf4918b4-b9d9-4ba1-9878-176684321523.png">


# API Endpoints
## Find the endpoints for PreKinder [here](https://github.com/pre-kinder/back-end/wiki/Endpoints)

</div>

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/pre-kinder/front-end.svg?style=flat-square
[contributors-url]: https://github.com/pre-kinder/front-end/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/pre-kinder/front-end.svg?style=flat-square
[forks-url]: https://github.com/pre-kinder/front-end/network/members
[stars-shield]: https://img.shields.io/github/stars/pre-kinder/front-end.svg?style=flat-square
[stars-url]: https://github.com/pre-kinder/front-end/stargazers
[issues-shield]: https://img.shields.io/github/issues/pre-kinder/front-end.svg?style=flat-square
[issues-url]: https://github.com/pre-kinder/front-end/issues
[build-badge]: https://img.shields.io/circleci/build/github/pre-kinder/front-end?style=flat-square
