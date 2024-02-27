# -*- coding: utf-8 -*-

from flask import Flask
from config import get_config
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config.from_object(get_config())
    
    db.init_app(app)

    from .views import bp as main_bp
    app.register_blueprint(main_bp)

    return app
