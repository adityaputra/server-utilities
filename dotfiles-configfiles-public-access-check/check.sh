BASEURLS=('adityaputra.com' )
PATHS=('.env' '.htaccess' 'wp-config.php' 'app/etc/config.xml' 'config.php' 'config.xml')
#PATHS=('.env')

ORIGURL=()
RESULT=()

for url in "${BASEURLS[@]}"
do
  echo "Checking $url"
  for path in "${PATHS[@]}"
  do
    urlpath="https://$url/$path"
    status=$(curl -o /dev/null -s -w "%{http_code}\n" $urlpath)
    echo "$status $urlpath"
    ORIGURL+=("$urlpath")
    if [ ${status} -eq "200" ]; then
      content=$(curl -s $urlpath)
      RESULT+=("$urlpath")
      echo "$content"
      printf "=================$urlpath HAS CONTENT ACCESSIBLE. SEE THE CONTENT ABOVE. \n"
    fi
  done
done

printf "\n\n================= SUMMARY OF CHECKED URLS ================= \n"
for value in "${ORIGURL[@]}"
do
  echo $value
done

printf "\n\n================= SUMMARY OF ACCESSIBLE URLS ================= \n"
for value in "${RESULT[@]}"
do
  echo $value
done
