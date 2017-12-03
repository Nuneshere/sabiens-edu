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

Scenario: Inserindo conteúdo, que previamente não foi inserido, sem êxito, por falta de preenchimento do campo de “Conclusão e comentários”.

Given Estou na página de Cadastro de Conteudo
Given preenche o campo “Título” com “Resumo do Sistema Respiratório”
Given preenche o campo “Introdução” com “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given preenche o campo “Órgãos e explicações” com “Nome do órgão - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given não preenche nada no campo de  “Conclusão e comentários”.
When Adiciono um novo conteúdo
Then uma mensagem de erro é exibida devido a falta de preenchimento de um campo.

Scenario: Inserindo conteúdo, sem êxito, por não ter atingido o mínimo necessário de caracteres no campo conclusão.

Given Estou na página de Cadastro de Conteudo
Given preenche o campo “Título” com “Resumo do Sistema Respiratório”
Given preenche o campo “Introdução” com “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given preenche o campo “Órgãos e explicações” com “Nome do órgão - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut” 
Given não preenche nada no campo de  “Conclusão e comentários” simplesmente com "hello".
When Adiciono um novo conteúdo
Then uma mensagem de erro é exibida devido a falta do número caracteres minimos para efetuar a inserção.

Scenario: Removendo um conteúdo, em seguida, não vendo ele mais na lista de conteudo 

Given “Fátima” está na página “Sistema Respiratório”
Given So está contidos na lista de conteúdo o conteudo com seguinte titulo "Resumo rápido do Sistema Respiratorio" , descricao de "orem ipsum dolor sit" , introducao de "orem ipsum dolor sit" , desenvolvimento com titulo de "lorem ipsum dolor sit" e descricao "orem ipsum dolor sit" e por fim, conclusao com "orem ipsum dolor sit"
When Seleciono para remover o unico conteúdo da lista
Then Vejo a lista, agora vazia.