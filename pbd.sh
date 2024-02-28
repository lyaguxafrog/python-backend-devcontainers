#!/bin/bash

# https://github.com/lyaguxafrog/python-backend-devcontainer


install_pbd() {
    echo "Installing..."

    # create directory
    mkdir /home/$USER/.pbd/

    # copy templates
    cp django-template-drf /home/$USER/.pbd/django-template-drf
    cp django-template-gql /home/$USER/.pbd/django-template-gql
    cp flask-template /home/$USER/.pbd/flask-template

    cat pbd_shell > /home/$USER/.local/bin/pbd

    echo '"pbd" add in your shell'
    echo 'try "pbd --help"'

}

# project_settings() {

# }

as_template() {
    echo "Select template:"
    echo "[1] Django + DRF"
    echo "[2] Django + Graphene"
    echo "[3] Flask"
    read -p "> " template_choice

    case "$template_choice" in
        1)
            echo "Выбран шаблон Django + DRF"
            # Здесь можно добавить код для работы с шаблоном Django + DRF
            ;;
        2)
            echo "Выбран шаблон Django + Graphene"
            # Здесь можно добавить код для работы с шаблоном Django + Graphene
            ;;
        3)
            echo "Выбран шаблон Flask"
            # Здесь можно добавить код для работы с шаблоном Flask
            ;;
        *)
            echo "Aborted..."
            ;;
    esac
}

case "$1" in
    install)
        install_pbd
        ;;
    --as-template)
        as_template
        ;;
esac
