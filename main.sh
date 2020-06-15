#!/bin/bash
project_name=$1
project_root="$(pwd)/$project_name"

validate () {
  if [ -z "$project_name" ]
  then
    echo "Please insert project name"
    exit
  fi
}

createGoFiles(){
printf 'package main

import "fmt"

func main()  {
    fmt.Println("Hello World!")
}' > "$project_root/main.go"

(cd "$project_root" && go mod init "$project_name")
}

createGitFiles(){
printf '.env
/vscode
.idea' > "$project_root/.gitignore"

(cd "$project_root" && git init)
(cd "$project_root" && git add .)
}


# main
validate

echo "Creating go project $project_name"
echo $project_root

mkdir -p $project_root
createGoFiles
createGitFiles