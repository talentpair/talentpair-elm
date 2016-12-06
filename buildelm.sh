#!/usr/bin/env bash

echo "'use strict';" > src/index.js
echo >> src/index.js
echo >> src/index.js

for entry in $(cd src && find . | egrep '\.elm$' | sort)
do
  echo "require('$entry');" >> src/index.js
done

elm-make $(find src | egrep '\.elm$') --output /dev/null