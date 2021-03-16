#!/bin/env bash

ids=($(bspc query -N -n .hidden.window))
(( "${#ids[@]}" )) || exit
for wid in "${ids[@]}"; do
    title="$(xtitle "$wid")"
    options+="${title:-"$(bspc query -T -n "$wid" | jq -r '
        .client | "\(.instanceName):\(.className)"
    ')"}"$'\n'
done

id_index="$(<<< "$options" rofi -dmenu -i -format i -p "Show" -theme themes/sidetab.rasi)"
bspc node "${ids[${id_index}]}" -g hidden=off -f; bspc node "${ids[${id_index}]}" -g sticky=off -f
