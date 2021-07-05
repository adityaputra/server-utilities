BASEURLS=('adityaputra.com' )

PATHS=('.env' '.htaccess' 'wp-config.php' 'app/etc/config.xml' 'config.php' 'config.xml')

for url in "${BASEURLS[@]}"
do
  echo "Checking $url"
  for path in "${PATHS[@]}"
  do
    urlpath="https://$url/$path"
    status=$(curl -o /dev/null -s -w "%{http_code}\n" $urlpath)
    echo "$status $urlpath"
    if [ ${status} -eq "200" ]; then
      content=$(curl -s $urlpath)
      echo "$content"
      printf "\n\n=================$urlpath HAS CONTENT ACCESSIBLE. SEE THE CONTENT ABOVE. \n\n"
    fi
  done
done
