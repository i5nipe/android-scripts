#!/bin/bash
# Sign APK files

if [ "$1" == "" ]
then
        echo "Usage: $0 aplication.apk"
else
        #echo "Name of the file:"
        #read name
        name="sig_key"

        #echo "Password(min: 6 caracters):"
        pass="Default123"

        echo "Generating signature file..."
        keytool -genkey -keystore $name.jks -storepass $pass -storetype jks -alias $name -keyalg rsa -dname "CN=NIPE" -keypass $pass

        echo "Signing apk"
        jarsigner -keystore $name.jks -storepass $pass -storetype jks -sigalg sha1withrsa -digestalg sha1 $1 $name

        echo "Verifying signature"
        jarsigner -verify -certs -verbose $1
fi
