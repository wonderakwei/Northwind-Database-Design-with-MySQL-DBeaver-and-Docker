# Docker Compose Setup for MySQL and DBeaver

This project provides a Docker Compose configuration for setting up a MySQL database and DBeaver, a popular database management tool. The `docker-compose.yml` file orchestrates the deployment of these services, and sensitive information such as passwords and user credentials are stored securely in an `.env` file.

## Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your machine.

## Getting Started

1. Clone this repository to your local machine.

    ```bash
    git clone "Repo Link"
    cd mysql-dbeaver-docker
    ```

2. Create a `.env` file with your MySQL environment variables.

    ```env
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_DATABASE=your_database
    MYSQL_USER=your_user
    MYSQL_PASSWORD=your_password
    ```

    Replace `your_root_password`, `your_database`, `your_user`, and `your_password` with your desired values.

3. Start the containers.

    ```bash
    docker-compose up -d
    ```

4. Access DBeaver at [localhost:49160](http://localhost:49160) using the specified ports in the `docker-compose.yml` file.

## Environment Variables

When starting the MySQL image, you can adjust the configuration by passing environment variables. Below are the relevant environment variables and their descriptions:

- **MYSQL_ROOT_PASSWORD (mandatory):**
  Specifies the password for the MySQL root superuser account.

- **MYSQL_DATABASE (optional):**
  Specifies the name of a database to be created on image startup. If a user/password is supplied, that user will be granted superuser access to this database.

- **MYSQL_USER, MYSQL_PASSWORD (optional):**
  Used together to create a new user and set the user's password. The user is granted superuser permissions for the database specified by the `MYSQL_DATABASE` variable.

Please refer to [MySQL environment variables documentation](https://dev.mysql.com/doc/refman/5.7/en/environment-variables.html) for additional details, especially regarding variables respected by MySQL itself.

**Note:** The root superuser is created by default with the password specified by the `MYSQL_ROOT_PASSWORD` variable.