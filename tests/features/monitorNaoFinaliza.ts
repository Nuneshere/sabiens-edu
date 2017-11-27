import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;
var sameTitle = listaConteudo.filter(elem => sameTitle(elem,title));
let sameTitle = ((elem, title) => elem.element(by.name('titleList')).getText().then(text => text === title));

defineSupportCode(function ({ Given, When, Then }) {

    Given(/^Está no modal de lista de tarefas do Sistema Respiratorio$/, async () => {
        await browser.get("http://localhost:4200/adm/");
        await $("a[name='sistemas']").click();
        await $("a[name='sisResp']").click();
        await expect(browser.getTitle()).to.eventually.equal('Sistema Respiratório');
        await $("a[name='listaTarefas']").click();
    })

    Given(/^vê a “lista de tarefa de criação do formulário do Sistema Neurológico“ igualmente vazia." $/, async (title, intro, desv,concl) => {
        await $("a[name='listaTarefas']").click();        
        await $("input[name='titulo']").sendKeys(<string> title); //Adicionando o conteudo na lista
        await $("input[name='introducao']").sendKeys(<string> intro);
        await $("input[name='desenvolvimento']").sendKeys(<string> desv);
        await $("input[name='conclusao']").sendKeys(<string> concl);
        await element(by.buttonText('inserir')).click(); //inserir

        await browser.get("http://localhost:4200/adm/Sistemas/SistemaRespiratorio/"); // aguarda para entrar novamente na pagina
        await expect(browser.getTitle()).to.eventually.equal('Sistema Respiratório'); // observa se voltou para pagina do sistema
        
        await $("a[name='inserir]").click();
    
    });

    Given(/^Preenche o campo titulo com "([^\"]*)"$/, async (title) => {
        await browser.get("http://localhost:4200/adm/Sistemas/SistemaRespiratorio/addConteudo"); // aguarda para entrar novamente na pagina
        await expect(browser.getTitle()).to.eventually.equal('Adicionar conteudo');//checa se está
        await $("input[name='titulo']").sendKeys(<string> title); //Adicionando o conteudo na lista
    });
    
      
    Given(/^Preenche o campo Introdução com "([^\"]*)"$/, async (intro) => {
        await $("input[name='intro']").sendKeys(<string> intro); 
    }); 

    Given(/^Preenche o campo desenvolimento com "([^\"]*)"$/, async (desv) => {
        await $("input[name='desenvolvimento']").sendKeys(<string> desv); 
    });
    
    Given(/^Preenche o campo Conclusão e comentários com "([^\"]*)"$/, async (conclusao) => {
        await $("input[name='conclusao']").sendKeys(<string> conclusao); 
    });
    

    When(/^Ele tenta inserir o conteudo$/, async (name, cpf) => {
        await $("a[name='inserir']").click();

    });

    Then(/^Then uma mensagem de erro em forma de alert com o texto "([^\"]*)" pois existe um conteudo com Título de "([^\"]*)".$/, async (alertMes, title) => {
        var listaConteudo : ElementArrayFinder = element.all(by.name('listaConteudo'));
        await listaConteudo;
        var sameTitle = listaConteudo.filter(elem => sameTitle(elem,title));
        await sameTitle;
        await sameTitle.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
})
