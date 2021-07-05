BASEURLS=('adityaputra.com' )
PATHS=('.env' '.htaccess' 'wp-config.php' 'app/etc/config.xml' 'config.php' 'config.xml')

# Declare a string array
RESULT=()

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
      RESULT+=("$urlpath")
      echo "$content"
      printf "=================$urlpath HAS CONTENT ACCESSIBLE. SEE THE CONTENT ABOVE. \n"
    fi
  done
done

# Iterate the loop to read and print each array element
printf "\n\n================= SUMMARY OF ACCESSIBLE URLS ================= \n"
for value in "${RESULT[@]}"
do
  echo $value
done
