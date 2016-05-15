Toy Robot Simulator Solution
============================

Description
-----------

This toy application is a solution to rea-robot and is created by Chi(Andy) Wang (climber2002@gmail.com). Check the PROBLEM.md for the exercise description. After extracting the archive, under the *rea-robot* base directory there are following sub-directories,

- bin : Contains the *rea-robot* executable file
- lib : Contains the ruby source code
- spec : Contains the specs
- test-data : Contains some sample command files

Installation
------------

Firstly we need to install the dependent rubygems. RSpec is the only dependent gem we need to run the specs. Assuming Ruby and bundler are already installed, we run the following command under the *rea-robot* base directory. (In this document I always assume your current directory is the *rea-robot* base directory)

    bundle install


Run the Specs
-------------

After the dependent gems are installed, we can run all specs by executing the following command,

    bundle exec rspec

Run the application
-------------------

The application can read input either from a file or from standard input.

### Read commands from file

To read commands from a file, run following command,

    bin/rea-robot <filepath>

The argument <filepath> is the path to your commnd file. For example, to read from the *normal.txt* under the *test-data* folder, run following command,

    bin/rea-robot test-data/normal.txt


### Read commands from standard input

To read commands from standard input, run *rea-robot* without any arguments, like following,

    bin/rea-robot

It will give you a prompt and you can enter the commands directly, if you type an invalid command, it will give you some error messages and you can enter new command again. To quit the application, just type **QUIT**.


Commands file
-------------
The format of the commands file is that each command takes one line. Lines start with *#* are deemed as comments and will be ignored. Empty lines will be ignored also. In *test-data* folder, there are some data files testing different scenarios. You can check the comments in each file to find the details.



