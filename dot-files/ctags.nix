{}: ''
# Basic options
--recurse=yes
--sort=yes
--tag-relative=yes
--exclude=.git
--exclude=.hg
--exclude=min
--exclude=vendor
--exclude=\*.min.\*
--exclude=\*.map
--exclude=\*.swp
--exclude=\*.bak
--exclude=tags
--exclude=TAGS
--exclude=node_modules
--exclude=bower_components
--exclude=test
--exclude=tests
--exclude=.nyc_cache
--exclude=.nyc_output
--exclude=server-dist
--exclude=test-output

# --langdef=elm
# --langmap=elm:.elm
# --regex-elm=/^module[ \t]*([A-Z][a-zA-Z0-9'_.]*)/\1/m,module/
# --regex-elm=/^type[ \t]*([A-Z][a-zA-Z0-9'_]*)./\1/t,type/
# --regex-elm=/^([a-z_][a-zA-Z0-9'_]*).*=/\1/v,function/

--langdef=haskell
--langmap=haskell:.hs
--regex-haskell=/^module[ \t]*([A-Z][a-zA-Z0-9'_.]*)/\1/m,module/
--regex-haskell=/^(new)?type[ \t]*([A-Z][a-zA-Z0-9'_]*)./\2/t,type/
--regex-haskell=/^class[ \t]*([A-Z][a-zA-Z0-9'_]*)/\1/c,class/
--regex-haskell=/^data[ \t]*([A-Z][a-zA-Z0-9'_]*)/\1/d,data/
--regex-haskell=/^([a-z_][a-zA-Z0-9'_]*).*=/\1/v,function/

--langdef=golang
--langmap=golang:.go
--regex-golang=/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/
--regex-golang=/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/v,var/
--regex-golang=/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/t,type/

--langdef=scss
--langmap=scss:.scss.sass
--regex-scss=/^[ \t]*@mixin ([A-Za-z0-9_-]+)/\1/m,mixin,mixins/
--regex-scss=/^[ \t]*\$([A-Za-z0-9_-]+)/\1/v,variable,variables/
--regex-scss=/^[ \t]*\.([A-Za-z0-9_-]+)/.\1/c,class,classes/
--regex-scss=/^[ \t]*&\.([A-Za-z0-9_-]+)/.\1/c,class,classes/
--regex-scss=/^[ \t]*#([A-Za-z0-9_-]+)/#\1/i,id,ids/
--regex-scss=/^[ \t]*(([A-Za-z0-9_-]+[ \t\n,]+)+)\{/\1/t,tag,tags/
--regex-scss=/^[ \t]*@media\s+([A-Za-z0-9_-]+)/\1/m,media,medias/

--langdef=typescript
--langmap=typescript:.ts
--langmap=typescript:+.tsx
--regex-typescript=/^[ \t]*(export)?[ \t]*class[ \t]+([a-zA-Z0-9_]+)/\2/c,classes/
--regex-typescript=/^[ \t]*(export)?[ \t]*module[ \t]+([a-zA-Z0-9_]+)/\2/n,modules/
--regex-typescript=/^[ \t]*(export)?[ \t]*function[ \t]+([a-zA-Z0-9_]+)/\2/f,functions/
--regex-typescript=/^[ \t]*export[ \t]+var[ \t]+([a-zA-Z0-9_]+)/\1/v,variables/
--regex-typescript=/^[ \t]*var[ \t]+([a-zA-Z0-9_]+)[ \t]*=[ \t]*function[ \t]*\(\)/\1/l,varlambdas/
--regex-typescript=/^[ \t]*(export)?[ \t]*(public|private)[ \t]+(static)?[ \t]*([a-zA-Z0-9_]+)/\4/m,members/
--regex-typescript=/^[ \t]*(export)?[ \t]*interface[ \t]+([a-zA-Z0-9_]+)/\2/i,interfaces/
--regex-typescript=/^[ \t]*(export)?[ \t]*enum[ \t]+([a-zA-Z0-9_]+)/\2/e,enums/
--regex-typescript=/^[ \t]*import[ \t]+([a-zA-Z0-9_]+)/\1/I,imports/
''
