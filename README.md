[![Build Status](https://travis-ci.org/muslih/QuizMaster.png)](https://travis-ci.org/muslih/QuizMaster)

# QuizMaster

Quiz Master is Quipper's technical exam for web developers.

### Configuration

- Clone the repository to your local machine.  
- Run `bundle install` on your command line (make sure you're in the project directory).  
- Run `rails db:migrate RAILS_ENV=development`.  
- Run `rails db:data:load` to load sample data.
- Then run `rails server`.  
- Open your browser and go to `localhost:3000`.  
- Try it out! :)  


### How to Use

- Default teacher email and password are `teacher@quipper.com/teacher$123` make sure sample data already loaded.
- App comes with two modes: Teacher Mode and Student Mode
- With Teache Mode, you may view, create, edit, and delete all reources ( Question, Answer, Student, Teacher).
- With Student Create, all you have to do is answer questions and view result.
- Each Student has random question.
- Question diveded to two modes, multiple choice mode and text mode.


### Showcase
[![ScreenShot](http://oi67.tinypic.com/34zha8p.jpg)](https://youtu.be/Cx8xDwPusRk)

### Database Relations

To view database relation run `bundle exec erd`, make sure you already installed [Graphviz 2.22+](https://voormedia.github.io/rails-erd/) before running the command.

### Technology

- Capybara
- Rspec with Shoulda-matchers
- Reactjs
- Rails 5 as framework

### Versions Used

* Rails 5.0.2
* Ruby 2.3.1