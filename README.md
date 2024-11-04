# Inception

## Setup Instructions

1. Clone the repository:
   ```sh
   git clone https://github.com/42Repo/Inception.git
   cd Inception
   ```

2. Build and run the application using the Makefile:
   ```sh
   make
   ```

3. To stop the application:
   ```sh
   make down
   ```

4. To clean up the Docker environment:
   ```sh
   make clean
   ```

5. To remove all data and start fresh:
   ```sh
   make fclean
   ```

## Environment Variables

The following environment variables are used in the configuration files:

- `DOMAIN_NAME`: The domain name for the application (e.g., `asuc.42.fr`)
- `MYSQL_ROOT_PASSWORD`: The root password for the MariaDB database
- `MYSQL_DATABASE`: The name of the MariaDB database
- `MYSQL_USER`: The username for the MariaDB database
- `MYSQL_PASSWORD`: The password for the MariaDB database user
- `WP_ADMIN_USER`: The username for the WordPress admin account
- `WP_ADMIN_PASSWORD`: The password for the WordPress admin account
- `WP_USER`: The username for a regular WordPress user
- `WP_USER_PASSWORD`: The password for the regular WordPress user
- `FTP_USER`: The username for the FTP service
- `FTP_PASSWORD`: The password for the FTP service
- `PORTAINER_ADMIN_PASSWORD`: The password for the Portainer admin account
