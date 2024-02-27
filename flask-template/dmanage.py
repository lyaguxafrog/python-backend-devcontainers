import argparse
from app import create_app

app = create_app()

def main():
    parser = argparse.ArgumentParser(description='Manage your Flask application.')
    parser.add_argument('command', help='Command to run')

    args = parser.parse_args()

    if args.command == 'run':
        app.run(debug=True)
    else:
        print(f"Unknown command: {args.command}")

if __name__ == '__main__':
    main()
