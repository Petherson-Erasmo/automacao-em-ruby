# automacao-em-ruby
Este projeto é referente ao curso de automação 180 da QA NInja. Foi criado testes automatizados para web e para API REST, utilizando o Cucumber, Ruby, Capybara, RSpec, Jenkins, especificações em BDD.

Cada pasta tem uma função, a pasta code4teste é utilizada para introduzir conceitos da programação em Ruby. A pasta web-base introduz alguns conceitos em HTML. A pasta rocklov tem a primeira versão do projeto.

Decidi criar a pasta rocklov-v2, pois, como atualizamos a versão do contêiner e estou fazendo anotações no código para explicar o funcionamento, achei válido criar essa pasta com os arquivos já feitos, mas sem os comentários que já tinha feito para facilitar a leitura do código e não ficar poluído.

Novamente atualizamos o ambiente de teste e criamos a pasta rocklov-v3, o objetivo de criar essa pasta é poder saber até onde vai à atualização do contêiner rocklov-web, já que cada atualização muda um pouco o ambiente de teste e implementa mais coisas. Outra vantagem é que eu posso apagar os comentários antigos, já que estou usando o git para controle de versão e fazer anotações que julgo necessárias e que poderão me ajudar no futuro. Na empresa isso não vai ser necessário.

A partir da pasta rocklov-v3 passamos a usar o relatório do allure-cucumber. Para funcionar é preciso da JDK 8 instalada e instalar o allure framework, se for pelo windows tem que instalar pelo scoop. Depois de instalado servidor do allure, para ver os relatórios basta digitar no terminal "allure serve logs\".

Para rodar os testes no Chrome é preciso baixar o chromedrive na mesma versão do navegador pelo link https://chromedriver.storage.googleapis.com/index.html
Para rodar os teste no Firefox é preciso baixar o geckodriver com a mesma arquitetura do processador pelo link https://github.com/mozilla/geckodriver/releases
Depois é preciso ir na variável de ambiente do computador e colocar o caminho da pasta que tem os drivers para a pasta se tornar global.

Para realizarmos os testes na API usamos o Insomnia