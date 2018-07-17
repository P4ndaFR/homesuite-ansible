# homesuite-ansible
An ansible playbook to deploy a ready-to-use nextcloud w/ collabora based on the [amazing work](https://brendan.abolivier.bzh/your-own-google-drive-docs/) of [Brendan Abolivier](https://twitter.com/BrenAbolivier)

## Requirements
- ansible >= 2.5.1
- a linux server with ssh and python installed, listening on the internet ( ports 80, 443 and 22)
- a domain (DNS), or at least 2 subdomains pointing at your server

DISCLAIMER : this playbook is made for Debian-based distributions and has only been tested on Ubuntu 17.10 Server and Ubuntu 18.04 LTS Server only, if you need it for any other distribution, please open an issue and/or submit a pull-request.

## How to use it :
- Clone this repository and cd inside
- Modify the ```group_vars/all.yml.sample``` file with your variables ( for php_version pick the current version for your OS : "7.1" for Ubuntu 17.10, "7.2" for Ubuntu 18.04 LTS ) :
```yaml
php_version: "7.1"
db_password: "nextcloud_db_password"
nextcloud_domain: "cloud.your.domain"
escaped_domain: "cloud\\.your\\.domain"
collabora_domain: "collabora.your.domain"
letsencrypt_email: "your@email.mail"
```
- Set the all.yml.sample as main variable file :
```
mv group_vars/all.yaml.sample group_vars/all.yaml
```

- Add your server to your ansible inventory
```
echo -n "nextcloud ansible_ssh_host=the_ip_of_your_server ansible_ssh_user=the_coonection_user ansible_become_password=the_password_you_use_to_sudo ansible_python_interpreter=/the/path/to/the/python/executable/on/remote/server" >> /etc/ansible/hosts
```

- Lauch the playbook and go grab a coffee / beer, depending the hour of the day 
```
ansible-playbook playbook.yml
```
- Connect to https://cloud.your.domain and follow the post-install procedure
