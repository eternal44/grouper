# Lunch Grouper
A light weight command line tool that generates a file of random groups
of people to eat lunch with.

## Installation
Change directory to where you'd like to run the group generator from and run the
following line:

```
git clone https://github.com/eternal44/grouper.git
```

## Usage

### Adding new users
NOTE:  this does not check for uniqueness of the name being added.

```
ruby lunch_grouper.rb -a Eunice,Gracie,James
```

### List all users
```
ruby lunch_grouper.rb -l
```

### Generate groups
```
ruby lunch_grouper.rb -g
```

### Help
If you want to look up the command options above from the command line you can run:
```
ruby lunch_grouper.rb -h
```
