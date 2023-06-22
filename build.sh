#!/usr/bin/env bash
# exit on error
set -o errexit

# poetry install
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
./manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('medrano', 'admin@example.com', 'admin')"