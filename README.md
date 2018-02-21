## Criador de Virtual Hosts do Apache

Este script gera os arquivos de um Virtual Host, cria uma página inicial, habilita o novo site e reinicia o serviço Apache.

# Como utilizar

1. Crie um arquivo com o conteúdo do create.sh ou clone o repositório.

'git clone https://github.com/dssantos/Virtual-Host-Creator.git'

2. Torne o arquivo 'create.sh' executável.

'sudo chmod +x create.sh'

3. Execute o script, com sudo, informando o nome do site de deseja criar.

'sudo ./create.sh exemplo.local'

4. Insira o direcionamento do site para o endereço IP do servidor incluindo uma linha no arquivo '/etc/hosts'.

'''bash
\# /etc/hosts
127.0.0.1	exemplo.local
'''

5. Abra um navegador e acesse o site.