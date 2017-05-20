#!/bin/bash
echo "Choose build type:"
select choice in OFFICIAL-user TEST-user EXPERIMENTAL-user TEST-userdebug EXPERIMENTAL-userdebug EXPERIMENTAL-eng
do
    case "$choice" in
        "OFFICIAL-user")
            export VERTEX_BUILDTYPE=OFFICIAL
            . build/envsetup.sh
            lunch vertex_oneplus3-user
            find . -name "*Development*.apk" | xargs rm
            break;;
        "TEST-user")
            export VERTEX_BUILDTYPE=TEST
            . build/envsetup.sh
            lunch vertex_oneplus3-user
            break;;
        "TEST-userdebug")
            export VERTEX_BUILDTYPE=TEST
            . build/envsetup.sh
            lunch vertex_oneplus3-userdebug
            break;;
        "EXPERIMENTAL-user")
            export VERTEX_BUILDTYPE=EXPERIMENTAL
            . build/envsetup.sh
            lunch vertex_oneplus3-user
            break;;
        "EXPERIMENTAL-userdebug")
            export VERTEX_BUILDTYPE=EXPERIMENTAL
            . build/envsetup.sh
            lunch vertex_oneplus3-userdebug
            break;;
        "EXPERIMENTAL-eng")
            export VERTEX_BUILDTYPE=EXPERIMENTAL
            . build/envsetup.sh
            lunch vertex_oneplus3-eng
            break;;
        *) echo "Invalid option. Try again!"
            ;;
    esac
done

time make bacon -j16
