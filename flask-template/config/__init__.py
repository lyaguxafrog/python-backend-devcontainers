# -*- coding: utf-8 -*-

import os

from .development import DevelopmentConfig
from .production import ProductionConfig
from .testing import TestingConfig

config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'testing': TestingConfig,
}

def get_config():
    env = os.environ.get('FLASK_ENV', 'development')
    return config[env]
