FROM django:python2-onbuild

RUN apt-get -qy update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/* /var/lib/apt/*

COPY nginx.conf /etc/nginx/sites-available/default

CMD /bin/sh -c "/etc/init.d/nginx start && python manage.py migrate && gunicorn --reload cryptoclass.wsgi"
