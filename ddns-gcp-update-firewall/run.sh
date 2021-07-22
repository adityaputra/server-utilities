curl https://ipinfo.io/ip | gcloud compute firewall-rules update allow-nfs --source-ranges="$(</dev/stdin)"/32
