#!/bin/bash
clear
string4=$(openssl rand -hex 32 | cut -c 1-4)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
uuid=$(openssl rand -hex 32 | cut -c 1-32)
phone="$string8-$string4-$string4-$string4-$string12"
guid="$string8-$string4-$string4-$string4-$string12"
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
var=$(curl -i -s -H "$header" https://i.instagram.com/api/v1/si/fetch_headers/?challenge_type=signup&guid=$uuid > /dev/null)
var2=$(echo $var | grep -o 'csrftoken=.*' | cut -d ';' -f1 | cut -d '=' -f2)
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"



banner() {
lolcat bann.txt
}
banner1() {
lolcat bann1.txt
}
banner2() {
lolcat bann2.txt
}
login_user() {


if [[ $user == "" ]]; then
printf "\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Login\e[0m\n"
read -p $'\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Username: \e[0m' user
fi

if [[ -e cookie.$user ]]; then

printf "\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Cookies found for user\e[0m\e[1;77m %s\e[0m\n" $user

default_use_cookie="Y"

read -p $'\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Use it?\e[0m\e[1;77m [Y/n]\e[0m ' use_cookie

use_cookie="${use_cookie:-${default_use_cookie}}"

if [[ $use_cookie == *'Y'* || $use_cookie == *'y'* ]]; then
printf "\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Using saved credentials\e[0m\n"
else
rm -rf cookie.$user
login_user
fi


else

read -p $'\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Password: \e[0m' pass
printf "\n"
data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'

IFS=$'\n'

hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trying to login as\e[0m\e[1;93m %s\e[0m\n" $user
IFS=$'\n'
var=$(curl -c cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); 
if [[ $var == "challenge" ]]; then printf "\e[1;93m\n[!] Login instagram dulu\n" ; exit 1; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n[+] Login Berhasil\n" ; elif [[ $var == "Sebentar ya samyang" ]]; then echo "Sebentar ya samyang"; fi; 

fi

}

followw() {

printf "\e[1;77m[\e[0m\e[1;31m+\e[0m\e[1;77m] MENGGUNAKAN TEKNIK FOL/UNFOL PANNEL\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;31m+\e[0m\e[1;77m] NAMBAH FOLLOWERS INSTAN WHEWHE \e[0m\n"
printf "\e[1;77m[\e[0m\e[1;31m+\e[0m\e[1;77m]\e[0m\e[1;93m Press Ctrl + C to stop \e[0m\n"
sleep 5

username_id=$(curl -L -s 'https://www.instagram.com/'$user'' > getid && grep -o  'profilePage_[0-9]*.' getid | cut -d "_" -f2 | tr -d '"')

selena="460563723"
neymar="26669533"
ariana="7719696"
beyonce="247944034"
cristiano="173560420"
kimkardashian="18428658"
kendall="6380930"
therock="232192182"
kylie="12281817"
jelopez="305701719"
messi="427553890"

dualipa="12331195"
mileycyrus="325734299"
shawnmendes="212742998"
katyperry="407964088"
charlieputh="7555881"
lelepons="177402262"
camila_cabello="19596899"
madonna="181306552"
leonardodicaprio="1506607755"
ladygaga="184692323"
taylorswift="11830955"
instagram="25025320"

ayu="522969993"
laudia="2993265"
luna="1948416"
prily="225064794"
raisa="8115577"
aliando="328482450"
agnes="4934196"
maudi="1821019"
rafi="1918078581"
olla="267809931"
atta="186744830"






if [[ ! -e celeb_id ]]; then
printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" $ayu $laudia $luna $prily $raisa $aliando $agnes $maudi $rafi $olla $atta $dualipa $mileycyrus $shawnmendes $katyperry $charlieputh $lelepons $camila_cabello $madonna $leonardodicaprio $ladygaga $taylorswift $instagram $neymar $selena $ariana $beyonce $cristiano $kimkardashian $kendall $therock $kylie $jelopez $messi > celeb_id
fi

while [[ true ]]; do


for celeb in $(cat celeb_id); do

data='{"_uuid":"'$guid'", "_uid":"'$username_id'", "user_id":"'$celeb'", "_csrftoken":"'$var2'"}'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Trying to follow celebgram %s ..." $celeb

check_follow=$(curl -s -L -b cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/friendships/create/$celeb/" | grep -o '"following": true')

if [[ $check_follow == "" ]]; then
printf "\n\e[1;93m [!] Error\n"
exit 1
else
printf "\e[1;92mOK\e[0m\n"
fi

sleep 3

done
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;77m Jeda dulu 60 detik...\e[0m\n"
sleep 60
#unfollow
for celeb in $(cat celeb_id); do
data='{"_uuid":"'$guid'", "_uid":"'$username_id'", "user_id":"'$celeb'", "_csrftoken":"'$var2'"}'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Trying to unfollow celebgram %s ..." $celeb
check_unfollow=$(curl -s -L -b cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/friendships/destroy/$celeb/" | grep -o '"following": false' ) 

if [[ $check_unfollow == "" ]]; then
printf "\n\e[1;93m [!] Error, stoping to prevent blocking\n"
exit 1
else
printf "\e[1;92mOK\e[0m\n"
fi

sleep 3
done
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;77m Jeda dulu 60 detik...\e[0m\n"
sleep 60


done


}

loading() {

R='\x1b[1;31m'
G='\x1b[1;32m'
B='\x1b[1;34m'
Y='\x1b[1;33m'
C='\x1b[1;36m'
D='\x1b[0m'

function Percent(){
    message="$1" #$1 artinya untuk memasukan data ke parameter ke 1
    max=$2 #$2 untuk parameter ke 2 dan seterusnya
    
    #make loop
        i=0
        # -le (less than) atau kurang dari
        # 0 kurang dari max (100) 
        # maka pernyataan di jalankan berupa tulisan 1-100
        while [ $i -le $max ]; do
            echo -ne "\r${G}[+]${D} $message ${C}$i${D} %"
            sleep 0.1
            # jika i nilainya sama dengan 100 atau batas max maka metode / fungsi Percent di jalankan lagi
            # Percent "Loading..." 100
            # akan terus di ulang
            if [ $i -eq 100 ]; then
                echo -ne "${C} [complete!]${D}\n"
                Percent "Loading..." 1
            fi
            # naikan nilai variabel i sebesar 1
            # ini yang akan membuat tulisan angka 1 sampai 100
            let i++
        done
}
Percent "Loading..." 100
}


loading1() {

R='\x1b[1;31m'
G='\x1b[1;32m'
B='\x1b[1;34m'
Y='\x1b[1;33m'
C='\x1b[1;36m'
D='\x1b[0m'

function Percent(){
    message="$1" #$1 artinya untuk memasukan data ke parameter ke 1
    max=$2 #$2 untuk parameter ke 2 dan seterusnya
    
    #make loop
        i=0
        # -le (less than) atau kurang dari
        # 0 kurang dari max (100) 
        # maka pernyataan di jalankan berupa tulisan 1-100
        while [ $i -le $max ]; do
            echo -ne "\r${G}[+]${D} $message ${C}$i${D} %"
            sleep 0.1
            # jika i nilainya sama dengan 100 atau batas max maka metode / fungsi Percent di jalankan lagi
            # Percent "Loading..." 100
            # akan terus di ulang
            if [ $i -eq 10 ]; then
                echo -ne "${C} [complete!]${D}\n"
                Percent "Loading..." 1
            fi
            # naikan nilai variabel i sebesar 1
            # ini yang akan membuat tulisan angka 1 sampai 100
            let i++
        done
}
Percent "Loading..." 100
}


menu() {
printf " ${G} tools milik limit queen"
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m1\e[0m\e[1;31m]\e[0m\e[1;93m Tambah Slow\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m2\e[0m\e[1;31m]\e[0m\e[1;93m Tambah Medium\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m3\e[0m\e[1;31m]\e[0m\e[1;93m Tambah Hard\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m4\e[0m\e[1;31m]\e[0m\e[1;93m Upgrade tools\e[0m\n"
printf "\n"


read -p $' \e[1;31m[\e[0m\e[1;77m::\e[0m\e[1;31m]\e[0m\e[1;77m Pilih satu : \e[0m' option

if [[ $option -eq 1 ]]; then
clear
banner
banner1
loading
echo ""
login_user
followw
menu
elif [[ $option -eq 2 ]]; then
clear
banner
banner2
loading1
echo ""
sleep 1.6
echo -en """
${C}
Fitur ini
Tersedia setelah subscriber
Mencapai 400 hwehwe
Makanya share anzincs
"""
sleep 3.5
menu
elif [[ $option -eq 3 ]]; then
clear
banner
banner2
loading1
echo ""
sleep 1.2
echo -en """
${C}
Fitur ini
Tersedia setelah subscriber
Mencapai 400 hwehwe
Makanya share anzincs
"""
sleep 3.5
menu
elif [[ $option -eq 4 ]]; then
upgrade
else
clear
banner
printf "\e[1;93m[!] Pilih yang ada aja cantik\e[0m\n"
sleep 4
clear
banner
menu

fi
}
banner
menu
