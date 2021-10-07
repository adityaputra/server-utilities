# get current IP
ip=$(curl https://ipinfo.io/ip)

# update cloudflare firewall. refer to https://developers.cloudflare.com/firewall/api/cf-filters/put#update-a-single-filter
curl -X PUT \
     -H "Authorization: Bearer CF_TOKEN" \
     -H "X-Auth-Key: REDACTED" \
     -H "Content-Type: application/json" \
     -d '{
    "id": "CF_FIREWALL_FILTER_ID",
    "paused": false,
    "description": "allow DDNS IP",
    "expression": "(ip.src eq '$ip')"
}' "https://api.cloudflare.com/client/v4/zones/CF_FIREWALL_ZONE_ID/filters/CF_FIREWALL_FILTER_ID"
