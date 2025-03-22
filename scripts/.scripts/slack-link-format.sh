#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Slack Link Format
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# This script:
#   - Get the active tab URL from Google Chrome.
#   - Get the Jira issue summary from the active tab by executing JavaScript in the context of the active tab.
#   - Insert the Jira issue summary and the Jira link in the Slack message box.
#
# Important: You need to enable "Allow JavaScript from Apple Events" in Google Chrome to run this script.
# To turn it on, from the menu bar, go to View > Developer > Allow JavaScript from Apple Events.

ENGLISH_LAYOUT="ABC"
RUSSIAN_LAYOUT="RussianWin"

# Get the current input source
current_layout=$(xkbswitch -ge)
# Switch to the English layout if the current layout is not English
if [[ "$current_layout" != "$ENGLISH_LAYOUT" ]]; then
    xkbswitch -se $ENGLISH_LAYOUT
fi

# Get the active tab URL from Google Chrome
issue_url=$(osascript -e '
tell application "Google Chrome"
    set activeTabURL to URL of active tab of front window
    return activeTabURL
end tell
')
if [[ -z "$issue_url" ]]; then
    echo "Error: Could not retrieve the URL of the active tab."
    exit 1
fi
issue_key=$(echo $issue_url | grep -oE '([A-Z]+-[0-9]+)')

# echo "Active Tab URL: $issue_url"
# echo "Issue Key: $issue_key"

# Get the Jira issue summary from the active tab by executing JavaScript in the context of the active tab
issue_summary=$(osascript -l JavaScript <<JAVASCRIPT
(function() {
    var chrome = Application('Google Chrome');
    var activeTab = chrome.windows[0].activeTab();
    var summary = activeTab.execute({
        javascript: "document.getElementById('summary-val')?.innerText || 'Summary not found';"
    });
    return summary;
})();
JAVASCRIPT
)

# echo "Summary: $issue_summary"

# Add key to the summary
issue_summary="$issue_key: $issue_summary"


# Calculate the length of the summary
issue_summary_length=${#issue_summary}

# Simulate keypresses
# Forat for Slack: ISSUE_KEY: ISSUE_SUMMARY ISSUE_URL
osa_script='
tell application "System Events"
    tell application "Slack" to activate
    delay 0.4
    # Simulate keypresses to paste the text
    keystroke "'$issue_summary'" # Paste the text
    delay 0.4
    # Select the text by selecting the text length
    repeat '$issue_summary_length' times
        key code 123 using {shift down} # Left arrow
    end repeat
    delay 0.4
    # Copy url to clipboard
    set the clipboard to "'$issue_url'"
    delay 0.4
    # CMD + V to paste the URL
    keystroke "v" using command down
    delay 0.4
    # move the cursor to the end of the line
    key code 124 # Right arrow
end tell
'

# Forat for Slack: [ISSUE_KEY: ISSUE_SUMMARY](ISSUE_URL)
osa_script_v2='
tell application "System Events"
    tell application "Slack" to activate
    delay 0.4
    # Simulate keypresses to paste the text
    keystroke "['$issue_summary']" # Paste the text
    delay 0.4
    # Select the text by selecting the text length
    # repeat '$issue_summary_length' times
    #     key code 123 using {shift down} # Left arrow
    # end repeat
    # delay 0.4
    # Copy url to clipboard
    set the clipboard to "'$issue_url'"
    delay 0.4
    # Insert a link to the Jira issue surrounded by angle brackets
    keystroke "("
    # CMD + V to paste the URL
    keystroke "v" using command down
    delay 0.4
    keystroke ")"
    # move the cursor to the end of the line
    # key code 124 # Right arrow
end tell
'

osascript -e "$osa_script_v2"


# Switch back to the original layout
if [[ "$current_layout" != "$ENGLISH_LAYOUT" ]]; then
    xkbswitch -se $current_layout
fi
