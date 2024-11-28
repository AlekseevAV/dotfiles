sketchybar  --add   item slack left \
            --set   slack \
                    update_freq=180 \
                    script="$PLUGIN_DIR/slack.sh" \
           --subscribe slack system_woke
