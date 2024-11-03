#!/bin/bash

if xrandr -q | grep ' connected '; then

    NMONITO=$(xrandr -q | grep ' connected' | awk 'END { print NR }')
    echo "-->   Numero de monitores: $NMONITO"

    # Monitor 1
    if [ $(xrandr -q | grep ' connected primary ' | awk '{print $1}') ]; then
	    if [[ "1 2 3 4 5 6" == *$NMONITO* ]]; then
            MONITO1=$(xrandr -q | grep ' connected primary' | awk '{print $1}')
            echo "Monitor 1: $MONITO1"

            RESO1=$(xrandr -q | grep "^$MONITO1" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 1: $RESO1"
        fi

	    if [[ "2 3 4 5 6" == *$NMONITO* ]]; then
            MONITO2=$(xrandr -q | grep ' connected' | sed '/primary/d' | awk 'NR==1 {print $1}')
            echo "Monitor 2: $MONITO2"

            RESO2=$(xrandr -q | grep "^$MONITO2" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 2: $RESO2"
        fi

	    if [[ "3 4 5 6" == *$NMONITO* ]]; then
            MONITO3=$(xrandr -q | grep ' connected' | sed '/primary/d' | awk 'NR==2 {print $1}')
            echo "Monitor 3: $MONITO3"

            RESO3=$(xrandr -q | grep "^$MONITO3" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 3: $RESO3"
        fi

	    if [[ "4 5 6" == *$NMONITO* ]]; then
            MONITO4=$(xrandr -q | grep ' connected' | sed '/primary/d' | awk 'NR==3 {print $1}')
            echo "Monitor 4: $MONITO4"

            RESO4=$(xrandr -q | grep "^$MONITO4" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 4: $RESO4"
        fi

	    if [[ "5 6" == *$NMONITO* ]]; then
            MONITO5=$(xrandr -q | grep ' connected' | sed '/primary/d' | awk 'NR==4 {print $1}')
            echo "Monitor 5: $MONITO5"

            RESO5=$(xrandr -q | grep "^$MONITO5" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 5: $RESO5"
        fi

	    if [[ "6" == *$NMONITO* ]]; then
            MONITO6=$(xrandr -q | grep ' connected' | sed '/primary/d' | awk 'NR==5 {print $1}')
            echo "Monitor 6: $MONITO6"

            RESO6=$(xrandr -q | grep "^$MONITO6" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 6: $RESO6"
        fi
    else
	    if [[ "1 2 3 4 5 6" == *$NMONITO* ]]; then
            MONITO1=$(xrandr -q | grep ' connected' | awk 'NR==1 {print $1}')
            echo "Monitor 1: $MONITO1"

            RESO1=$(xrandr -q | grep "^$MONITO1" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 1: $RESO1"
        fi

	    if [[ "2 3 4 5 6" == *$NMONITO* ]]; then
            MONITO2=$(xrandr -q | grep ' connected' | awk 'NR==2 {print $1}')
            echo "Monitor 2: $MONITO2"

            RESO2=$(xrandr -q | grep "^$MONITO2" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 2: $RESO2"
        fi

	    if [[ "3 4 5 6" == *$NMONITO* ]]; then
            MONITO3=$(xrandr -q | grep ' connected' | awk 'NR==3 {print $1}')
            echo "Monitor 3: $MONITO3"

            RESO3=$(xrandr -q | grep "^$MONITO3" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 3: $RESO3"
        fi

	    if [[ "4 5 6" == *$NMONITO* ]]; then
            MONITO4=$(xrandr -q | grep ' connected' | awk 'NR==4 {print $1}')
            echo "Monitor 4: $MONITO4"

            RESO4=$(xrandr -q | grep "^$MONITO4" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 4: $RESO4"
        fi

	    if [[ "5 6" == *$NMONITO* ]]; then
            MONITO5=$(xrandr -q | grep ' connected' | awk 'NR==5 {print $1}')
            echo "Monitor 5: $MONITO5"

            RESO5=$(xrandr -q | grep "^$MONITO5" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 5: $RESO5"
        fi

	    if [[ "6" == *$NMONITO* ]]; then
            MONITO6=$(xrandr -q | grep ' connected' | awk 'NR==6 {print $1}')
            echo "Monitor 6: $MONITO6"

            RESO6=$(xrandr -q | grep "^$MONITO6" -A 1 | sed '1d' | awk '{print $1}')
            echo "Resolucion 6: $RESO6"
        fi
    fi

    case $NMONITO in
        "1")
            echo '===   Iniciar xrandr para 1 monitor   ==='
            xrandr --output $MONITO1 --mode $RESO1
            bspc monitor $MONITO1 -d I II III IV V VI VII VIII IX X
        ;;
        "2")
            echo '===   Iniciar xrandr para 2 monitor   ==='

            echo '-->   Monitor 1'
            xrandr --output $MONITO1 --mode $RESO1
            bspc monitor $MONITO1 -d I II III IV V VI VII VIII IX

            echo '-->   Monitor 2'
            xrandr --output $MONITO2 --mode $RESO2 --right-of $MONITO1
            bspc monitor $MONITO2 -d X
        ;;
        "3")
            echo '===   Iniciar xrandr para 3 monitor   ==='
            xrandr --output $MONITO1 --mode $RESO1
            bspc monitor $MONITO1 -d II III IV V VI VII VIII IX

            xrandr --output $MONITO2 --mode $RESO2 --right-of $MONITO1
            bspc monitor $MONITO2 -d X

            xrandr --output $MONITO3 --mode $RESO3 --left-of $MONITO1
            bspc monitor $MONITO3 -d I
        ;;
        4)
            echo '===   Iniciar xrandr para 4 monitor   ==='
            xrandr --output $MONITO1 --mode $RESO1
            bspc monitor $MONITO1 -d III IV V VI VII VIII IX

            xrandr --output $MONITO2 --mode $RESO2 --right-of $MONITO1
            bspc monitor $MONITO2 -d X

            xrandr --output $MONITO3 --mode $RESO3 --left-of $MONITO1
            bspc monitor $MONITO3 -d II

            xrandr --output $MONITO4 --mode $RESO4 --left-of $MONITO3
            bspc monitor $MONITO4 -d I
        ;;
        5)
            echo '===   Iniciar xrandr para 5 monitor   ==='
            xrandr --output $MONITO1 --mode $RESO1
            bspc monitor $MONITO1 -d III IV V VI VII VIII

            xrandr --output $MONITO2 --mode $RESO2 --right-of $MONITO1
            bspc monitor $MONITO2 -d IX

            xrandr --output $MONITO3 --mode $RESO3 --left-of $MONITO1
            bspc monitor $MONITO3 -d II

            xrandr --output $MONITO4 --mode $RESO4 --left-of $MONITO3
            bspc monitor $MONITO4 -d I

            xrandr --output $MONITO5 --mode $RESO5 --righi-of $MONITO2
            bspc monitor $MONITO5 -d X
        ;;
        6)
            echo '===   Iniciar xrandr para 6 monitor   ==='
        ;;
    esac
fi
