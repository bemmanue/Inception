# Inception

A high-performance WordPress deployment using Docker

### In this project, the following is configured:
- A Docker container that contains `NGINX with TLSv1.3 only`.
- A Docker container that contains `WordPress + php-fpm` (it must be installed and configured) only without nginx.
- A Docker container that contains `MariaDB` only without nginx.
- A Docker container that contains `Redis`.
- A Docker container that contains `Adminer`.
- A Docker container that contains `FTP-server`.
- A volume that contains WordPress database.
- A second volume that contains WordPress website files.
- A docker-network that establishes the connection between your containers.

### Setup and management:
- Customize `srsc/.env` file by replacing values of the variables to your own.
- Use `make` command with options `up`, `down`, `clean` and `re` to manage containers.

### Diagram:
![inception](https://user-images.githubusercontent.com/76536030/200580975-35854dc2-212c-4cb5-a111-4b8f5d01d5e7.png)
