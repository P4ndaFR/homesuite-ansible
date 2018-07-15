{{collabora_domain}} {
	tls {{letsencrypt_email}}

	proxy /loleaflet http://127.0.0.1:9980 {
		transparent
	}

	proxy /hosting/discovery http://127.0.0.1:9980 {
		transparent
	}

	proxy /lool http://127.0.0.1:9980 {
		transparent
		websocket
	}

	header / {
		Strict-Transport-Security "max-age=31536000;"
		Content-Security-Policy "default-src 'none'; frame-src 'self' blob:; connect-src 'self' wss://{{nextcloud_domain}}; script-src 'unsafe-inline' 'self'; style-src 'self' 'unsafe-inline'; font-src 'self' data:; object-src blob:; img-src 'self' data: https://{{nextcloud_domain}}:443; frame-ancestors https://{{nextcloud_domain}}:443"
	}
}
