#!/usr/bin/env bash

args=()
DISPLAYS="$(yabai -m query --displays | jq -rc '.[] | .index | @sh')"
NAMES=""
COUNT=0

for display in $DISPLAYS; do
    SPACES="$(yabai -m query --spaces --display $display | jq -rc '.[] | [.index, .windows[0], .label] | @sh')"

    # Read the current spaces from the yabai query
    while read -r index window yabai_name visible; do
        COUNT=$((COUNT + 1))

        NAMES="$NAMES space.${index}"
        args+=(--clone "space.${index}" space_template before
               --set   "space.${index}" label="${index}"
                                        icon="${index}"
                                        associated_space=${COUNT}
                                        background.drawing=off
                                        associated_display=${display}
                                        drawing=on
               --subscribe "space.${index}" space_changed)
    done <<<"$SPACES"

    # Reorder them and stick them onto sketchybar
    args+=(--reorder $NAMES)
    sketchybar -m ${args[@]} &>/dev/null
done

# Get the current space count
CURRENT_SPACE_COUNT=$(sketchybar -m --query bar | jq -r '.items | map(select(contains("space."))) | map(sub("space.";"")) | map(tonumber) | max')

if [ "$CURRENT_SPACE_COUNT" == "" ]; then
    CURRENT_SPACE_COUNT=0
fi

# If our current space count is greater than the count found by the yabai query,
# go through and remove the destroyed spaces
while [ $CURRENT_SPACE_COUNT -gt $COUNT ]; do
    sketchybar -m --remove "space.${CURRENT_SPACE_COUNT}"
    CURRENT_SPACE_COUNT=$((CURRENT_SPACE_COUNT - 1))
done

sketchybar -m --trigger space_changed
