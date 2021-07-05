# Dotfiles and config files access checker

Very handy and simple script to see if your website(s) has .env, wp-config.php, or any other sensitive information accessible publicly on the internet. Basically this script will check the status code of the given URL.

To use it, simply:
1. download this check.sh into your local
2. chmod u+x check.sh
3. use your favorite editor to put all the domains and paths that you want to check
4. run:
```./check.sh```


Example output:
```
➜  dotfiles-configfiles-public-access-check git:(master) ✗ ./check.sh
Checking adityaputra.com
200 https://adityaputra.com/.env
APP_URL=https://adityaputra.com/
APP_NAME=TMP
APP_DESC='XXXX'
APP_DOMAIN=https://adityaputra.com/

DB_HOST=localhost
DB_USER=xxxxx
DB_PASS=xxxxx
DB_NAME=xxxxx

#MAILGUN_API_KEY=xxxxx
#MAILGUN_URL=xxxxxx
#SUPPORT_EMAIL=xxxxxx

MAILGUN_API_KEY=xxxxx
MAILGUN_URL=xxxxx
SUPPORT_EMAIL=xxxxx

#SHOPIFY_API_KEY=xxxxx
#SHOPIFY_API_SECRET=xxxxx

SHOPIFY_API_KEY=xxxxx
SHOPIFY_API_SECRET=xxxxx

SHOPIFY_REDIRECT_URL=https://adityaputra.com/callback
#SHOPIFY_SCOPES='write_script_tags,read_script_tags'
SHOPIFY_SCOPES='read_themes,write_themes'
SHOPIFY_API_URL='/admin/api/2020-01/'

SHOPIFY_PLAN_TRIAL_DAYS="14"
SHOPIFY_PAYMENT_TITLE="xxxxxx"
SHOPIFY_PLAN_PRICE="8.99"
SHOPIFY_PAYMENT_TEST_MODE="false"


=================https://adityaputra.com/.env HAS CONTENT ACCESSIBLE. SEE THE CONTENT ABOVE. 

200 https://adityaputra.com/.htaccess
RewriteEngine on
RewriteCond $1 !^(index\.php|resources|robots\.txt)
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L]

Header set Access-Control-Allow-Origin *
Header set Access-Control-Allow-Methods: "*"
Header set Accept: "*"
Header set Access-Control-Allow-Headers: "Access-Control-Allow-Headers, Access-Control-Allow-Origin, Access-Control-Allow-Methods, Content-Type, Accept, X-Requested-With"


=================https://adityaputra.com/.htaccess HAS CONTENT ACCESSIBLE. SEE THE CONTENT ABOVE. 

520 https://adityaputra.com/wp-config.php
404 https://adityaputra.com/app/etc/config.xml
520 https://adityaputra.com/config.php
404 https://adityaputra.com/config.xml

```
