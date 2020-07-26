#!/bin/bash
project_name=$1
project_root=$(pwd)/$project_name

validate () {
  if [ -z "$project_name" ]
  then
    echo "Please insert project name"
    exit
  fi

  if [ -d "$project_root" ]; then
    echo "Project $project_name already exist, please use other name"
    exit
  fi

  if [[ "$project_root" =~ [^a-zA-Z0-9-_] ]]; then
    echo "Project name can only use alphanumeric, _, and -"
    exit
  fi
}

createGoFiles(){
printf 'package main

import "fmt"

func main()  {
    fmt.Println("Hello World!")
}' > "$project_root/main.go"

(cd "$project_root" && git init)
(cd "$project_root" && go mod init "$project_name")
}

createGitFiles(){
printf '.env
/vscode
.idea' > "$project_root/.gitignore"

}


# main
validate
echo "Creating go project $project_name"

mkdir $project_root
createGoFiles
createGitFiles