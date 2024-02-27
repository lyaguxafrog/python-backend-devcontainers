#!/bin/bash

# https://github.com/lyaguxafrog/python-backend-devcontainer


if [[ $1 = 'startproject' ]]; then
    printf "Which framework do you want to use?\n\n"
    printf "[1] Django\n"
    printf "[2] Flask\n"
    printf "[3] FastAPI\n"
    read -p "Enter the number: " framework_choice

    if [[ $framework_choice = '1' ]]; then
        printf "DRF(1) or Graphene(2)?\n"
    fi
fi



install_pbd() {
    echo "Installing..."

    # create directory
    mkdir /home/$USER/.pbd/

    # copy templates
    cp django-template-drf /home/$USER/.pbd/django-template-drf
    cp django-template-gql /home/$USER/.pbd/django-template-gql
    cp flask-template /home/$USER/.pbd/flask-template

    cat pbd.sh > /home/$USER/.local/bin/pbd

    echo '"pbd" add in your shell'
    echo 'try "pbd --help"'

}


case "$1" in
    startproject)
        printf "Which framework do you want to use?\n\n"
        printf "[1] Django\n"
        printf "[2] Flask\n"
        printf "[3] FastAPI\n"
        read -p "Enter the number: " framework_choice
