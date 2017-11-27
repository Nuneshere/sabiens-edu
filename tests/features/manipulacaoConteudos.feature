Feature: Manipulação de conteúdos 
	As an Administrador da aplicação
	I want to manipular os conteúdos em cada tópico que correspondem aos sistemas do corpo humano.
	So that eu possa disponibilizar o conteúdo na aplicação.

Scenario: Tentativa de inserção conteúdo à um sistema do corpo humano que já possui conteúdo com mesmo “título”.

Given Estou na página na pagina de Sistema Respiratório
Given Só está contidos na lista de conteúdo o seguinte conteudo com titulo de “Curiosidades sobre os órgãos” e  desenvolvimento de "hello" e conclusao de "hello" 
Given preenche o campo Título de “Resumo rápido do Sistema Respiratorio” 
Given preenche o campo Introdução com “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given preenche o campo Desenovolvimento com “Nome do órgão - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given preenche o campo Conclusão e comentários com “Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
When Ela tenta inserir um conteúdo 
Then uma mensagem de erro em forma de alert com o texto "Sistema com mesmo titulo já existente" pois existe um conteudo com Título de “Curiosidades sobre os órgãos”

Scenario: Inserindo conteúdo, que previamente não foi inserido, sem êxito, por falta de preenchimento do campo de “Conclusão e comentários”.

Given “Fátima” está na página “Sistema Respiratório”
Given so estão contidos na lista de conteúdo os seguintes “Curiosidades sobre os órgãos” , “Descobertas na área”.
Given preenche o campo “Título” com “Resumo do Sistema Respiratório”
Given preenche o campo “Introdução” com “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given preenche o campo “Órgãos e explicações” com “Nome do órgão - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given não preenche nada no campo de  “Conclusão e comentários”.
When “Fátima” adiciona um novo conteúdo
Then uma mensagem de erro é exibida devido a falta de preenchimento de um campo.
