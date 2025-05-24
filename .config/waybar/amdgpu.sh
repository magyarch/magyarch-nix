#!/usr/bin/env bash

CARD_PATH="/sys/class/drm/card1/device"

TEMP=$(cat "$CARD_PATH/hwmon/"*/temp1_input 2>/dev/null)
FREQ=$(cat "$CARD_PATH/pp_dpm_sclk" 2>/dev/null | grep "*" | awk '{print $2}')
POWER=$(cat "$CARD_PATH/hwmon/"*/power1_average 2>/dev/null)

# Konvertálás
TEMP_C=$((TEMP / 1000))
POWER_W=$((POWER / 1000000))

echo -n "{\"text\": \"🎮 ${TEMP_C}°C\", "
echo -n "\"tooltip\": \"🌡️ Temp: ${TEMP_C}°C\\n⚙️ Clock: ${FREQ}\\n🔋 Power: ${POWER_W} W\"}"

