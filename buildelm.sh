#!/usr/bin/env bash

echo "'use strict';" > elm-src/index.js
echo >> elm-src/index.js
echo >> elm-src/index.js

for entry in $(cd elm-src && find . | egrep '\.elm$' | sort)
do
  echo "require('$entry');" >> elm-src/index.js
done

elm-make $(find elm-src | egrep '\.elm$') --output /dev/null