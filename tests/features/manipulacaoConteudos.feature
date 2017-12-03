Feature: Manipulação de conteúdos 
	As an Administrador da aplicação
	I want to manipular os conteúdos em cada tópico que correspondem aos sistemas do corpo humano.
	So that eu possa disponibilizar o conteúdo na aplicação.

Scenario: Tentativa de inserção conteúdo à um sistema do corpo humano que já possui conteúdo com mesmo “título”.

Given Estou na página de Cadastro de Conteudo
Given So está contidos na lista de conteúdo o conteudo com seguinte titulo "Resumo rápido do Sistema Respiratorio" , descricao de "orem ipsum dolor sit" , introducao de "orem ipsum dolor sit" , desenvolvimento com titulo de "lorem ipsum dolor sit" e descricao "orem ipsum dolor sit" e por fim, conclusao com "orem ipsum dolor sit"
Given Adiciono na lista de conteudo o conteudo com seguinte titulo "Resumo rápido do Sistema Respiratorio" , descricao de "Descricao ipsum dolor sit" , introducao de "Introducao ipsum dolor sit" , desenvolvimento com titulo de "ipsum dolor sit" e descricao "ipsum dolor sit" e por fim, conclusao com "ipsum dolor sit"
When Eu tento inserir o conteudo
Then Uma mensagem de erro em forma de alert com o texto "Essa conteudo já existe" aparece na tela
