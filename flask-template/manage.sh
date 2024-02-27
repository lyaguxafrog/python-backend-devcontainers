#!/bin/bash


# Function to display help information
display_help() {
    echo "Usage: manage.sh [command] [options]"
    echo "Commands:"
    echo "  run             Run the Flask development server"
    echo "  makemigrations  Initialize migrations"
    echo "  migrate         Apply database migrations"
    echo "Options:"
    echo "  -h, --help      Show this help message and exit"
    

    exit 0
}


# Function to run the server
run_server() {
    if ! ./dmanage.py run; then
        echo "Error running server"
        exit  1
    fi
}

# Function to initialize migrations
init_migrations() {
    if ! alembic init migrations; then
        echo "Migrations error"
        exit  1
    fi
}

# Function to perform migrations
do_migrations() {
    if ! alembic revision --autogenerate -m "$2" && alembic upgrade head; then
        echo "error"
        exit  1
    fi
}

# Main script logic
case "$1" in
    run)
        run_server
        ;;
    makemigrations)
        init_migrations
        ;;
    migrate)
        do_migrations "$2"
        ;;
    --help|-H)
        display_help
        ;;
    *)
        echo "Unknown command: $1"
        echo "Use --help or -H for more information"
        ;;
esac
