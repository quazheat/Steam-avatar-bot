#!/bin/bash

# path (like MSYS2) change for yours
avatarFolder="/c/Users/Alex/Documents/SteamAvatarBot"

# Steam account cookies
uploadURL="https://steamcommunity.com/actions/FileUploader" #keep it
sessionID="xxx" # your session id
steamID64="76561199691622478" # your steam 64 id
steamLoginSecure="76561199691622478" # long thing starts always with your steam64ID% can be found in browser cookies
currentAvatarFile="${avatarFolder}/current_avatar.txt" # keep it

if [ ! -f "$currentAvatarFile" ]; then
  echo "1" > "$currentAvatarFile"
fi

change_avatar() {
  # path made like this for VBS scripts if you want to use
  currentAvatar=$(/usr/bin/cat "$currentAvatarFile")
  nextAvatar=$((currentAvatar + 1))
  

  if [ ! -f "${avatarFolder}/${nextAvatar}.jpg" ]; then
    echo "❌ File ${nextAvatar}.jpg not found, I will use first one."
    nextAvatar=1
  fi
  
  avatarPath="${avatarFolder}/${nextAvatar}.jpg"
  
  echo "🔄 Trying to set ${nextAvatar}.jpg..."
  
  response=$(curl -s \
    -H "Content-Type: multipart/form-data" \
    -b "sessionid=${sessionID}; steamLoginSecure=${steamLoginSecure};" \
    -F "type=player_avatar_image" \
    -F "sId=${steamID64}" \
    -F "sessionid=${sessionID}" \
    -F "doSub=1" \
    -F "avatar=@${avatarPath}" \
    "$uploadURL" | /usr/bin/tr -d '\0')
  
  if [[ ${#response} -gt 100 ]]; then
    echo "✅ Success! New pic: ${nextAvatar}.jpg"
    echo "$nextAvatar" > "$currentAvatarFile"
  else
    echo "❌ Something went wrong: $response"
  fi
}

while true; do
  change_avatar
  echo "⏳ next in 20 min..."
  # same with path for VBS
  /usr/bin/sleep 1200  # = 20 min
done
