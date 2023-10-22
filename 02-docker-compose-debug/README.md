# Basic Docker

Developers are trying to create the API service and they make a `docker-compose` file to test it in develop environment. When they try command `docker-compose up`, it does not work and return error message with `Internal server error`. They ask you to find the root cause and fix it.

## Summary Requirement

1. What is the cause of the `Internal server error`.
    TypeError: int() argument must be a string, a bytes-like object or a real number, not 'NoneType'
   -> app.py
     config = {
        'user': os.getenv('CONFIG_DB_USER'),
        'password': os.getenv('CONFIG_DB_PASS'),
        'host': os.getenv('CONFIG_DB_HOST'),
        'port': os.getenv('CONFIG_DB_PORT'),
        'database': os.getenv('CONFIG_DB_NAME')
    }

    -> docker-compose.yml
        environment: 
      MYSQL_USER: root
      MYSQL_PASSWORD: opsta
      MYSQL_HOST: 'db'
      MYSQL_PORT: '3306'
      MYSQL_DATABASE: knights

      You will see that `'user': os.getenv('CONFIG_DB_USER')` ,`'password': os.getenv('CONFIG_DB_PASS')` ... are not the same environment that when `docker compose up -d` 

2. After the problem was solved, Developers may facing `Internal server error` in a short period of time but the rest will be working fine. What is the cause and how to fix?
    -> Maybe when `docker compose up -d` service of database are not start or down, to fix that I will add some tag in docker-compose.yml
    depends_on:
      - db
    However, short period of time are depends on many factor.
