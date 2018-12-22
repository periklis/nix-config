{}:''
# default-key CREATE_ONE

#-----------------------------
# behavior
#-----------------------------

use-agent
no-greeting
no-emit-version
no-comments
keyid-format 0xlong
with-fingerprint
list-options show-uid-validity
verify-options show-uid-validity

#-----------------------------
# keyserver
#-----------------------------

keyserver hkp://pool.sks-keyservers.net
keyserver-options no-honor-keyserver-url
keyserver-options include-revoked

#-----------------------------
# algorithm and ciphers
#-----------------------------

personal-cipher-preferences AES256 AES192 AES CAST5
personal-digest-preferences SHA512 SHA384 SHA256 SHA224

cert-digest-algo SHA512

default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
''
