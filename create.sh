#!/bin/bash

# By Danilo Santos
# http://danilosantos.info
# [Twitter] @danilosantos86
# [Facebook] /danilosantos86

##### Criador de Virtual Hosts no Apache    
##### Shell Script para adicionar sites ao Apache HTTP Server

site="$1" #Recebe o nome do site como parâmetro
conf_file="$site/sites-available/$conf_file"
public="/var/www/$site/public_html"
logs="/var/www/$site/logs"
url_lauch="http://$site"

#Verifica se foi executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Execute o script como root e informe o nome do site como parâmetro"
  exit
fi

#Verifica se o parâmetro foi inserido e orienta a sintaxe do script
if [ -z $1 ]; then
   echo -e "Insira o nome do site ao executar o script. Exemplo:
   sudo ./script meusite.local"
   exit
else

   #Cria o arquivo de configuração do Virual Host
   echo -e "
   <VirtualHost *:80>
       ServerAdmin webmaster@$site
       ServerName $site
       ServerAlias www.$site
       DocumentRoot /var/www/$site/public_html/
       ErrorLog /var/www/$site/logs/error.log
       CustomLog /var/www/$site/logs/access.log combined
   </VirtualHost>
   " >> $avalaible

   echo "Arquivo $conf_file criado em /etc/apache2/sites-available/"

   #Prepara o diretório que armazema o arquivo HTML
   mkdir -p "$public"
   mkdir -p "$logs"
   cd $public
 
   #Cria o arquivo HTML
   echo -e "
   <html>
       <center>
       <h1>Bem vindo ao site $site</h1>
       <h2>Edite esta pagina inicial em:
       $public</h2>
       </center>
   </html>
   
   " >> index.html
 
   #Habilita a configuração do site, reinicia o serviço e abre a página do site no firefox
   a2ensite $conf_file &> /dev/null  #Desvia as mensagens da execução para um arquivo Nulo
   service apache2 reload

   # Testar acesso ao site
   echo -e "
   #################################################################
   #
   # Para testar o acesso, insira o direcionamento do site
   # para o endereço IP do servidor incluindo uma linha
   # no arquivo /etc/hosts. Exemplo:
   #
   #    127.0.0.1 $site
   #
   # Em seguida acesse o site: $url_lauch
   #
   #################################################################
   "


fi
