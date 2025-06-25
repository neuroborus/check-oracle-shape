#!/bin/bash

COMPARTMENT_ID="" # ← OCIP
BOT_TOKEN="" # ← TG bot
CHAT_ID="" # ← TG chat_id
REGION="eu-frankfurt-1"

AD_LIST=("Wgmt:EU-FRANKFURT-1-AD-1" "Wgmt:EU-FRANKFURT-1-AD-2" "Wgmt:EU-FRANKFURT-1-AD-3")

for AD in "${AD_LIST[@]}"; do
  available=$(oci limits resource-availability get \
    --service-name compute \
    --limit-name standard-a1-core-count \
    --availability-domain "$AD" \
    --compartment-id "$COMPARTMENT_ID" \
    --region "$REGION" \
    --query 'availableCount' --raw-output)

  if [[ "$available" =~ ^[0-9]+$ ]] && [ "$available" -gt 0 ]; then
    curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
      -d chat_id="${CHAT_ID}" \
      -d text="✅ A1.Flex Available in $AD — quantity: $available cores"
  fi
done
