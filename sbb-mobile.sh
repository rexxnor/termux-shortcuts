#!/data/data/com.termux/files/usr/bin/env bash
# Enables the SBB app and also opens it

# Define the package name of the app
PACKAGE_NAME="ch.sbb.mobile.android.b2c"

# Monitor logcat for activity changes
sudo pm enable "$PACKAGE_NAME"
am start -a ch.sbb.mobile.android.b2c_TAB -n ch.sbb.mobile.android.b2c/ch.sbb.mobile.android.vnext.main.MainActivity --ei ch.sbb.mobile.android.b2c_FANCY_TAB 3 -f 0x10000000

while true; do
    # Sleep for a short duration before checking again
    sleep 1

    # Get the current foreground activity
    CURRENT_ACTIVITY=$(sudo dumpsys activity activities | grep "ResumedActivity" | awk '{print $3}' | cut -d'/' -f1)

    # Check if the current activity is not the app's package
    if [[ "$CURRENT_ACTIVITY" != "$PACKAGE_NAME"* ]]; then
        sudo pm disable $PACKAGE_NAME
        break
    else
	continue
    fi
done
