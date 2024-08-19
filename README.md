# FinWave App Deploy
This is the deploy scripts of a web application for financial accounting. The application is designed to help users track and manage their financial data.

## Installation

Docker Compose is required to work.

```
git clone https://github.com/FinWave-App/FinWave-Deploy
cd FinWave-Deploy
echo https://domain.name/api/ > api_url
sudo ./start.sh
```

After downloading the containers, FinWave should start. 

### Default credentials

Username: `root`

Password: `change_me`

**Please ensure to update your root password after the first login for security reasons.**

## About the file structure
### api_url file

This file contains a URL link for the frontend: clients will use it to access the backend server. 
By default, the backend is available at :80/api/ path

### backend directory

This directory is mounted in a backend container: in it you can view the server logs or change the config (enable user registration, usage limits, database, etc)

### database directory

This directory is mounted in a postgres container: it contains all user data. Before updates or global configuration changes, it is highly recommended to backup at least this directory

### nginx directory

This directory is mounted in a nginx container: here you can edit the behavior of nginx

## About HTTPS

If you intend to open access to the server from outside the local network, it is highly recommended to configure HTTPS encryption

Usually certbot is used for this. In theory, you don't need a separate nginx for it to work, you can create a separate configuration for it in nginx/custom-http.d/ with SSL certificates setup and proxying to internal 80 port
