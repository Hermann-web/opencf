#!/bin/bash

poetry export -f requirements.txt --output ./docs/requirements.txt --without-hashes --with buildthedocs

poetry run sphinx-apidoc ./opencf/ -o ./docs/source/opencf/ -f -E

PYTHON_PATH="$(poetry env info --path)"
source "$PYTHON_PATH/bin/activate"

cd docs
make html
cd ..

deactivate
open docs/build/html/index.html
