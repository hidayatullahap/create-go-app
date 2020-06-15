## Create-go-app
I really like to try stuff with Go, so i create a lot of "Hello World". It feels so repetitive, inspired from create-react-app so I made this bash command to create simple hello world project generator.

##How to use it

Clone it and give bash permission
```
$ git clone git@github.com:hidayatullahap/create-go-app.git
$ chmod +x ./create-go-app/main.sh
```

Add main.sh command into your ~/.zshrc or ~/.bash_profile. Prepare path for create-go-app project
```
$ (cd ./create-go-app && pwd)
```

Create new alias to your terminal
```
$ nano ~/.zshrc

Add new line
$ alias create-go-app='/Users/mac/dev/me/go/create-go-app/main.sh'

Edit "/Users/mac/dev/me/go" to your local path

Exit then
$ source ~/.zshrc
```

Yay setup are done!

Try to create a new project!
```
$ create-go-app HelloWorld
$ cd ./HelloWorld
```