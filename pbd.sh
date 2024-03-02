#!/bin/bash

# https://github.com/lyaguxafrog/python-backend-devcontainer

help() {
    echo "Welcome to Python Backend Devcontainers!
Usage:
$ pdb [COMMAND] [OPTION]"

    echo "Commands:"
    echo " install         Install Python Backend Devcontainers"
    echo " --as-template   Use the repository as a template"
    echo " --help          Show this help message and exit"

    echo "Options:"
    echo " -h, --help      Show this help message and exit"
}

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


template_drf() {

    # delete pbd files
    rm -rf django-template-gql
    rm -rf flask-template
    rm -rf README.md
    rm -rf LICENSE
    rm -rf docs
    rm -rf .github

    mv django-template-drf kernel

    read -p "Project name: " pr_name

    cat pbd_configs/django_drf_readme.md > README.md
    sed -i "s/projectname/$pr_name/g" README.md

    mkdir kernel/.devcontainer

    cp pbd_configs/containers/dev-container.json kernel/.devcontainer/dev-container.json
    cp pbd_configs/containers/dev-Dockerfile kernel/.devcontainer/Dockerfile
    cp pbd_configs/containers/dev-docker-compose.yml kernel/.devcontainer/docker-compose.yml

    cp pbd_configs/containers/Dockerfile kernel/Dockerfile
    cp pbd_configs/containers/docker-compose.yml docker-compose.yml
    cp pbd_configs/django-entrypoint.sh kernel/entrypoint.sh

    cp pbd_configs/deploy.sh deploy.sh

    rm -rf pbd_configs

    xdg-open https://github.com/lyaguxafrog/python-backend-devcontainers/blob/release/docs/DJANGO_DRF.md
}

template_gql() {

    # delete pbd files
    rm -rf django-template-gql
    rm -rf flask-template
    rm -rf README.md
    rm -rf LICENSE
    rm -rf docs
    rm -rf .github

    mv django-template-gql kernel

    read -p "Project name: " pr_name

    cat pbd_configs/django_gql_readme.md > README.md
    sed -i "s/projectname/$pr_name/g" README.md

    mkdir kernel/.devcontainer

    cp pbd_configs/containers/dev-container.json kernel/.devcontainer/dev-container.json
    cp pbd_configs/containers/dev-Dockerfile kernel/.devcontainer/Dockerfile
    cp pbd_configs/containers/dev-docker-compose.yml kernel/.devcontainer/docker-compose.yml

    cp pbd_configs/containers/Dockerfile kernel/Dockerfile
    cp pbd_configs/containers/docker-compose.yml docker-compose.yml
    cp pbd_configs/django-entrypoint.sh kernel/entrypoint.sh

    cp pbd_configs/deploy.sh deploy.sh

    rm -rf pbd_configs

    xdg-open https://github.com/lyaguxafrog/python-backend-devcontainers/blob/release/docs/DJANGO_GQL.md

}

as_template() {
    echo "Select template:"
    echo "[1] Django + DRF"
    echo "[2] Django + Graphene"
    echo "[3] Flask"
    read -p "> " template_choice

    case "$template_choice" in
        1)
            echo "Django + DRF"
            template_drf
            rm -rf pbd.sh
            git add .
            git commit -m "init template"
            git push
            ;;
        2)
            echo "Django + Graphene"
            template_drf
            rm -rf pbd.sh
            git add .
            git commit -m "init template"
            git push
            ;;
        3)
            echo "Flask template in develop.."
            exit 0
            ;;
        *)
            echo "Aborted..."
            exit 1
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
    *)
        help
        ;;
esac
