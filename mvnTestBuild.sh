#!/bin/bash

set +x

GIT_URL="https://github.com/vickeyys/jenkins-java-project.git"
REPO="jenkins-java-project"


if ! which mvn; then
    echo "install mvn"
    apt update && apt install maven -y
fi

echo "git clonning..."
git clone "$GIT_URL"

cd "$REPO"

if mvn test; then
        echo  "test successful"
    if mvn build; then
        echo "build successfull"
    else 
        echo "build failed"
    fi 
fi

