BASEURLS=('adityaputra.com' )

PATHS=('.env' '.htaccess' 'wp-config.php' 'app/etc/config.xml' 'config.php' 'config.xml')
#PATHS=('.env')

for url in "${BASEURLS[@]}"
do
  echo "Checking $url"
  for path in "${PATHS[@]}"
  do
    urlpath="https://$url/$path"
    echo "Checking $urlpath"
    curl -o /dev/null -s -w "%{http_code}\n" $urlpath
  done
done
