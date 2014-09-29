# 事前作業
以下のツールをインストールする

* chef
* knife-solo
* vagrant
* vagrant-omnibus

```
# Chefのインストール
sudo gem install chef

# knife-soloのインストール
sudo gem install knife-solo

# vagrantのインストール
# 忘れた。ググってくれ

# vagrant-omnibusのインストール
vagrant plugin install vagrant-omnibus
```
# 導入

* boxのダウンロード（くっそ時間かかる） 
```
vagrant box add centos64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box
vagrant init centos64
```
* 起動
```
vagrant up
```
* SSHの設定（仮想マシンに名前を付ける）
```
vag ssh-config --host harmony >> ~/.ssh/config
```
* ディレクトリ移動
```
cd ./chef
```
* 料理する（くっそ時間かかる）
```
knife solo cook harmony
```
* ログインする
```
ssh harmony
```
* sockファイルの作成
```
sudo su -
touch /var/lib/mysql/mysql.sock
chown mysql:mysql /var/lib/mysql
service mysql restart
```
* MySQLのルートユーザーのパスワードを確認
```
cat /root/.mysql_secret
```
* MySQLにログイン
```
mysql -u root -p
set password = PASSWORD('password');
# 
# これで後はmysql -u root -ppasswordでログインできるようになる
```
