### README.md
This repository contains multiple script files, for deployment to an Ubuntu Linux distribution,
which will:

- from running the ./setup.sh executable script file:
  - ssh in as 'ubuntu' into the remote server
  - create a user (recommend naming user as 'deploy') with sudo & no password-all privelidges
  - install Nginx

- from running the ./deploy.sh executable script file:
  - copy the local ./index.html file to 'deploy' users' home
  - move the ~/index.html file to /var/www/html
  - change the ownership of the /var/www/html/index.html file to 'ubuntu'
  - restart the nginx service

### To run the scripts:
1. clone the repository
2. cd into the repository
3. run the help option on ./setup.sh, i.e. `./setup.sh -h`
  - run without arguments to run all units and steps; `USER=deploy ./setup.sh`
  - you must set USER to the username that you want to run the server
    set up with, and you must pass this USER varible in the command line
    argument, otherwise USER will be set to your local machine's user name.
4. then run the `USER=deploy ./deploy.sh` script file in terminal
  - you must pass USER in with the execute deploy.sh command (set as
    the same user that you setup in setup.sh).
  - you must have an index.html file in the same directory as the deploy.sh
    script file - this is the html file that you are deploying to the server.

### MANUAL SETUP REQUIRED:
- To serve via https, you must manually configure the server to do so.
	1. Get SSL cert & key from provider:
	2. create /etx/nginx/ssl directory
  3. scp cert & key into server:
      i.e. `scp -i ~/path/to/your/ssh-keypair.pem ~/path/to/your/ssl_certificate.crt ubuntu@13.36.100.115:/home/ubuntu`
      i.e. `scp -i ~/path/to/your/ssh-keypair.pem ~/path/to/your/ssl_certificate_key.key ubuntu@13.36.100.115:/home/ubuntu`
  4. sudo move the cert & key into /etc/nginx/ssl directory:
      i.e. `sudo mv ~/ssl_certificate.crt /etc/nginx/ssl/ssl_certificate.crt`
      i.e. `sudo mv ~/ssl_certificate_key.key /etc/nginx/ssl/ssl_certificate_key.key`
  5. change the key file permission and owner to nginx user:
    - `sudo chmod 600 /etc/nginx/ssl/ssl_certificate_key.key`
    - `sudo chown www-data:www-data /etc/nginx/ssl/ssl_certificate_key.key`
  6. Update server context in /etc/nginx/sites-available/... with::
    - ssl_certificate /path/to/cert
    - ssl_certificate_key /path/to/cert_key
    - root /path/to/your/html
    - define location contexts