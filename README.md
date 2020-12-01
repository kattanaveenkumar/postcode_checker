Postcode Checker
=========

## Development Environment

__Services Required for Development Environment:__
- Git 2.7.4
- ruby 2.6.5p114
- Bundler 2.1.4
- Rails 6.0.3.4


__Instructions for Installing Development Environment Services on Ubuntu / Mac OSX:__

- Install [RVM From here](https://rvm.io/rvm/install)
- We can also use rbenv based on your choice, for both installation refferences visit [go rails site](https://gorails.com/setup/)


- Install ruby 2.6.5p114

		rvm install ruby-2.6.5

__Setup the Development Environment:__

- Clone the git repository

		git clone https://github.com/kattanaveenkumar/postcode_checker.git

		cd postcode_checker

__Install gems:__        

- run the following command to install the requirements

		bundle install

__DB setup:__ 

- run the following commands to setup the db for application

		rake db:create db:migrate

__Running the application locally:__

- To run the Web Server, use following command which handle testing documentation and server startup

		# within the postcode_checker folder
		rails s

	Visit [http://localhost:3000](http://localhost:3000) to access the local development environment.
	Visit [http://localhost:3000/coverage/index.html#_AllFiles]
	(http://localhost:3000/coverage/index.html) 
	
	for Simple cov test coverage details.
    

__LOCAL Environment Testing__  

Run unit tests:  
`bin/bundle exec rspec`

The test coverage of code is as shown below

![http://localhost:3000/coverage.png](http://localhost:3000/coverage.png)
 	
Visit [http://localhost:3000/coverage/index.html#_AllFiles](http://localhost:3000/coverage/index.html)
	  
for Simple cov test coverage details.
