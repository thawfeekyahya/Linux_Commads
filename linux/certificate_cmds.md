## Generate certificate

```
openssl pkcs12 -in certificate.pfx -info -nokeys -legacy

```

## Disable sslVerify on git for proxy issues

```
// .gitconfig
[http]
	sslVerify = false

```
