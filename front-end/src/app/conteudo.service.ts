import { Conteudo } from './conteudo';

export class ConteudoService {
  conteudos: Conteudo[] = [];
  minimocaracteres: Number = 60;
  gravarConteudo(conteudo: Conteudo): String {
    var result = null;
    var copyConclusao: String = conteudo.conclusao;
    var copyDesTopico: String = conteudo.desenvolvimento[0].descricao;
    copyConclusao = copyConclusao.split(" ").join("");
    copyDesTopico = copyDesTopico.split(" ").join("");
    var quantidadeConc:Number = copyConclusao.length;  
    var quantidadeDes:Number = copyDesTopico.length;  

    if (conteudo.conclusao == "" || conteudo.conclusao == undefined || conteudo.nome == "" || conteudo.nome == undefined || conteudo.descricao == "" || conteudo.descricao == undefined
  || conteudo.introducao == "" || conteudo.introducao == undefined || conteudo.desenvolvimento[0].nome== ""  || conteudo.desenvolvimento[0].nome== undefined || conteudo.desenvolvimento[0].descricao==""  
|| conteudo.desenvolvimento[0].descricao== undefined){
      result = "emptyField";
    } else if(this.conteudoExistente(conteudo.nome)==false) {
        console.log("deu certo, ele identificou um conteudo preexistente");
        result = "sameTitle";
    } else if(quantidadeConc < this.minimocaracteres || quantidadeDes < this.minimocaracteres) {
      console.log("não foi atingido o minimo de caracteres na conclusao");
      result = "minCaracterConc";
    } else if(quantidadeDes < this.minimocaracteres) {
      console.log("não foi atingido o minimo de caracteres desenvolv");
      result = "minCaracterDes";
    }else{
      console.log("nome visto ", conteudo.nome);
      this.conteudos.push(conteudo);
      result = "ok";
      console.log("array do service ", this.conteudos);
    }
    console.log("resultado é", result);
    return result;
  }
  removerConteudo(id:number): String{
    console.log("id no back é",id);
    this.conteudos.splice(id,id);
    console.log("deletando array do service ", this.conteudos);
    var result = "ok";
    return result;
  }
  quantidadeConteudos(): number {
    return this.conteudos.length;
  }
  conteudoExistente(titulo:string): boolean {
    return !this.conteudos.find(conteudoX => conteudoX.nome == titulo);
  }
  
}