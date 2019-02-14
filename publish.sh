#!/bin/sh
npm run build-bundle && npm publish --access public

echo "Publish finished!";
read -n1 -r -p "Press space to continue..." key
