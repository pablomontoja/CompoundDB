----
# CompoundDB

CompoundDB is a very simple web-based application written in Ruby on Rails. It can be used to store information about chemicals in laboratory.

## REQUIREMENTS

Matchmol is needed to search compounds in the database. It must be instaled in your server. 
http://merian.pch.univie.ac.at/~nhaider/cheminf/cmmm.html

Openbabel is needed to calculate molecular formula and molar mass.

## INSTALLATION (example based on Ubuntu Server 15.10)

#### Matchmol installation
```
sudo apt-get install fp-compiler

wget http://merian.pch.univie.ac.at/pch/download/chemistry/checkmol/checkmol.pas

fpc checkmol.pas -S2 -O3 -Op3

sudo cp checkmol /usr/local/bin

cd /usr/local/bin

sudo ln checkmol matchmol 
```
#### Openbabel installation
```
sudo apt-get install openbabel
```

Installation of Ruby on Rails has been omitted. You can do this, for example, using rvm.

#### App installation
```
sudo apt-get install nodejs

git clone https://github.com/pablomontoja/CompoundDB.git

cd CompoundDB

mkdir tmp/structures/

bundle install

rake db:migrate

rails server
```

## The easiest method - use VirtualBox image

I prepared Ubuntu Server image (.vdi container) that can be used to run my app. You need to configure VirtualBox Port Forwarding (add port forwarding rule with Host Port=3000 and Guest Port=3000).

You can download the image from:
```
https://app.box.com/s/007yun4iju7ht4q9udvup0ffa4z2ewhf

root password: admin
user login: admin
user password: admin
```

After login as admin go to /home/admin/rails/CompoundDB and run:
```
rails server -b 10.0.2.15
```
Now in your host system in browser go to:
```
127.0.0.1:3000
```
----
