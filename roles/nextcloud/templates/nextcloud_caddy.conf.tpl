{{nextcloud_domain}} {
	tls {{letsencrypt_email}}

	root   /srv/http/nextcloud

  log /var/log/caddy/nextcloud_access.log

	fastcgi / /var/run/php/php{{php_version}}-fpm.sock php {
		env PATH /bin
	}

	# checks for images
	rewrite {
		ext .svg .gif .png .html .ttf .woff .ico .jpg .jpeg
		r ^/index.php/(.+)$
		to /{1} /index.php?{1}
	}

	rewrite {
		r ^/index.php/.*$
		to /index.php?{query}
	}

	# client support (e.g. os x calendar / contacts)
	redir /.well-known/carddav /remote.php/carddav 301
	redir /.well-known/caldav /remote.php/caldav 301

	# remove trailing / as it causes errors with php-fpm
	rewrite {
		r ^/remote.php/(webdav|caldav|carddav|dav)(\/?)$
		to /remote.php/{1}
	}

	rewrite {
		r ^/remote.php/(webdav|caldav|carddav|dav)/(.+?)(\/?)$
		to /remote.php/{1}/{2}
	}

	rewrite {
		r ^/public.php/(dav|webdav|caldav|carddav)(\/?)$
		to /public.php/{1}
	}

	rewrite {
		r ^/public.php/(dav|webdav|caldav|carddav)/(.+)(\/?)$
		to /public.php/{1}/{2}
	}

	status 403 {
		/.htacces
		/data
		/config
		/db_structure
		/.xml
		/README
	}

  header / Strict-Transport-Security "max-age=31536000;"
}
