# Docker-Compose Advance

Developers want to use `docker-compose` to test the application in local machine and they request your help to create `Dockerfile` and `docker-compose.yml`. You can write them with following topics.

## Application Architecture

Dev team has 2 applications which called `frontend` and `backend`. The frontend was developed using `VueJS` framework and the backend was developed by using `Golang`.
The frontend must be accessible by other clients outside of your host (public access).
The backend used local `SQLite` database for its persistent data.

## Summary Requirement

- [x] Dockerfile or Containerfile in `./backend` folder.
- [x] Dockerfile or Containerfile in `./frontend` folder.
- [x] `Docker-compose.yml` in same path of README.md
- [x] The frontend and the backend should access from http method and domain.
- [x] Docker-compose.yml in same path of README.md
- [x] The frontend and the backend should access from http method and domain.
- [x] Please explain your solution to solve this exam in `solution/SOLUTION.md`
- [x] (Optional) Database should only access in docker network (you also should not access it).
- [x] (Optional) You can use `host volume` to persistent data. The data in MySQL should not delete when your container is down.
