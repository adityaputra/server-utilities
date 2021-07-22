ip=$(curl https://ipinfo.io/ip)
gcloud compute firewall-rules update allow-nfs --source-ranges="$ip"/32


