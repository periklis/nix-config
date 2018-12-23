{lib, isDarwin}: lib.optionalString isDarwin ''
pinentry-program /run/current-system/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
'' + ''
default-cache-ttl 600
default-cache-ttl-ssh 600
max-cache-ttl 7200
max-cache-ttl-ssh 7200
enable-ssh-support
''
