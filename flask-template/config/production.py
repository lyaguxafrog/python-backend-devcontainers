# -*- coding: utf-8 -*-

import os

DB_USERNAME = os.getenv('POSTGRES_USER')
DB_PASSWORDS = os.getenv('POSTGRES_PASSWORD')
DB_NAME = os.getenv('POSTGRES_DB')

class ProductionConfig:
    SECRET_KEY = os.getenv('SECRET_KEY')
    SQLALCHEMY_DATABASE_URI = f'postgresql://{DB_USERNAME}:{DB_PASSWORDS}@localhost/{DB_NAME}'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    DEBUG = False
