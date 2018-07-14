# homesuite-ansible
An ansible playbook to deploy a ready-to-use nextcloud /w collabora based on the [amazing work](https://brendan.abolivier.bzh/your-own-google-drive-docs/) of [Brendan Abolivier](https://twitter.com/BrenAbolivier)

## Requirements
- ansible >= 2.5.1
- a linux server with ssh and python installed, listening on the internet ( ports 80, 443 and 22)
- a domain (DNS), or at least 2 subdomains pointing at your server

DISCLAIMER : this playbook iss made for Debian-based disstributions and has only been tested only on Ubuntu 17.10 Server, if you need it for any other dissstribution, please open an issue and/or submit a pull-request.

## How to uses it :
- Clone this repository and cd insside
- Modify the ```group_vars/all.yml.sample``` file with your variables :
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
echo -n "nextcloud ansible_ssh_host=the_ip_of_your_server ansible_ssh_user=the_coonection_user ansible_become_password=the_password_you_use_to_sudo" >> /etc/ansible/hosts
```

- Lauch the playbook and go grab a coffee / beer, depending the hour of the day 
```
ansible-playbook playbook.yml
```
