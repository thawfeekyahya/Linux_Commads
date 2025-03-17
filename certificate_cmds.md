## Generate certificate

```
openssl pkcs12 -in certificate.pfx -info -nokeys -legacy

```

## disable sslVerify on git for proxy issues

```
// .gitconfig
[http]
	sslVerify = false

```
