
# language: pt
# author: Claudio Hideo Kashiwakura
# date: 2015-10-02

Funcionalidade: Cadastro Completo de Aluno
  Como um administrador do sistema
  Quero validar todos os campos do formulário de cadastro
  Para garantir a integridade e segurança dos dados dos alunos

  Contexto:
    Dado que o usuário tenha permissão de acesso e esteja na tela de cadastro

  Esquema do Cenário: Validar formatação do Nome
    Quando o usuário preenche o campo nome com "<nome>"
    Então o sistema deve exibir a "<mensagem_retorno>"

    Exemplos:
      | nome            | mensagem_retorno                                 |
      |                 | Erro: Campo obrigatório                          |
      | CLAUDIO         | Erro: Apenas a primeira letra deve ser maiúscula |
      |<h1> Virus </h1> | Erro: Caracteres não permitidos                  |
      | Claudio         | Dados inseridos com sucesso                      |

  Esquema do Cenário: Validar campo de E-mail
    Quando o usuário preenche o campo e-mail com "<email>"
    Então o sistema deve retornar a "< mensagem_retorno   >"

    Exemplos:
      | email                     | mensagem_retorno                 |
      |                           | Erro: Campo obrigatório          |
      | claudio@                  | Erro: Formato de e-mail inválido |
      | <script>alert(1)</script> | Erro: Formato inválido           |
      | claudio@gmail.com         | Sucesso                          |

  Esquema do Cenário: Validar campo CPF
    Quando o usuário digita o CPF "<valor_cpf>"
    Então o sistema valida e retorna "< mensagem_retorno   >"

    Exemplos:
      | valor_cpf            | mensagem_retorno         |
      |                      | Erro: Campo obrigatório  |
      | 1                    | Erro: CPF inválido       |
      | 12345678901234567890 | Erro: CPF inválido       |
      | <h1> Virus </h1>     | Erro: Formato inválido   |
      | 44455566677          | Sucesso                  |

  Esquema do Cenário: Regras de Datas (Nascimento, Início e Fim)
    Quando o usuário insere a "<data_nasc>", "<data_inicio>" e "<data_fim>"
    Então o sistema valida a regra "< mensagem_retorno   >"

    Exemplos:
      | data_nasc        | data_inicio       | data_fim         | mensagem_retorno                             |
      | 01/01/2016       | 01/01/2015        | 01/01/2016       | Erro: Data de nascimento não pode ser futura |
      | 01/01/1990       | 10/01/2015        | 01/01/2015       | Erro: Data fim não pode ser menor que início |
      | <h1> Virus </h1> | 01/01/2015        | 01/01/2016       | Erro: Caracteres não permitidos              |         
      | 01/01/1990       | <h1> Virus </h1>  | 01/01/2016       | Erro: Caracteres não permitidos              |        
      | 01/01/1990       | 01/01/2015        | <h1> Virus </h1> | Erro: Caracteres não permitidos              |           
      | 01/01/1990       | 01/01/2015        | 01/01/2016       | Sucesso                                      |

  Esquema do Cenário: Upload de Arquivos (Apenas Imagem)
    Quando o usuário seleciona um arquivo com a extensão "<extensao>"
    Então o sistema deve emitir o "< mensagem_retorno   >"

    Exemplos:
      | extensao |  mensagem_retorno                           |
      | .jpg     | Arquivo enviado com sucesso                 |
      | .jpeg    | Arquivo enviado com sucesso                 |
      | .png     | Arquivo enviado com sucesso                 |
      | .bmp     | Arquivo enviado com sucesso                 |   
      | .webp    | Arquivo enviado com sucesso                 |
      | .svg     | Arquivo enviado com sucesso                 |
      | .ai      | Arquivo enviado com sucesso                 |
      | .pdf     | Erro: Formato não permitido (apenas imagem) |
      | .exe     | Erro: Formato não permitido (apenas imagem) |
      | .php     | Erro: Formato não permitido (apenas imagem) |
      | .gif     | Erro: Formato não permitido (apenas imagem) |

   Esquema do Cenário: Validar o campo "1_bimestre"
    Quando o usuário insere a "<1_bimestre>"
    Então o sistema valida a regra "< mensagem_retorno   >"

    Exemplos:
      	| 1_bimestre          | mensagem_retorno               |
	    | -1		          | ERRO Nota deve ser maior 0.00  |
		| 0		              | SUCESSO			               |
	    | 0.1		          | SUCESSO			               |
	    | 0,1		          | ERRO formato numero		       |
	    | 10		          | SUCESSO			               |
	    | 10.1		          | ERRO Nota deve ser menor 10.00 |
        | <h1> Virus </h1>    | Erro: Formato inválido         |


  Esquema do Cenário: Validar o campo "2_bimestre"
    Quando o usuário insere a "<2_bimestre>"
    Então o sistema valida a regra "< mensagem_retorno   >"

    Exemplos:
      	| 2_bimestre          | mensagem_retorno               |
	    | -1		          | ERRO Nota deve ser maior 0.00  |
	    | 0		              | SUCESSO			               |
	    | 0.1		          | SUCESSO			               |
	    | 0,1		          | ERRO formato numero		       |
	    | 10		          | SUCESSO			               |
	    | 10.1		          | ERRO Nota deve ser menor 10.00 |
        | <h1> Virus </h1>    | Erro: Formato inválido         |



  Esquema do Cenário: Validar o campo "3_bimestre"
    Quando o usuário insere a "<3_bimestre>"
    Então o sistema valida a regra "< mensagem_retorno   >"

    Exemplos:
      	| 3_bimestre        | mensagem_retorno               |
	    | -1		        | ERRO Nota deve ser maior 0.00	 |
	    | 0		            | SUCESSO			             |
	    | 0.1		        | SUCESSO			             |
	    | 0,1		        | ERRO formato numero		     |
	    | 10		        | SUCESSO			             |
	    | 10.1		        | ERRO Nota deve ser menor 10.00 |
        | <h1> Virus </h1>  | Erro: Formato inválido         |  

  Esquema do Cenário: Validar o campo "4_bimestre"
    Quando o usuário insere a "<4_bimestre>"
    Então o sistema valida a regra "< mensagem_retorno   >"

    Exemplos:
      	| 4_bimestre        | mensagem_retorno               |
	    | -1		        | ERRO Nota deve ser maior 0.00	 |
	    | 0		            | SUCESSO			             |
	    | 0.1		        | SUCESSO			             |
	    | 0,1		        | ERRO formato numero		     |
	    | 10		        | SUCESSO			             |
	    | 10.1		        | ERRO Nota deve ser menor 10.00 |
        | <h1> Virus </h1>  | Erro: Formato inválido         |


Esquema do Cenário: Validar Cálculo da Média Final
    Dado que o usuário inseriu as notas de todos os bimestres
    Quando o sistema processa as notas "<n1>", "<n2>", "<n3>" e "<n4>"
    Então a média final exibida deve ser "<media_esperada>"

    Exemplos:
      | n1   | n2   | n3   | n4   | media_esperada |
      | 10.0 | 10.0 | 10.0 | 10.0 | 10.0           |
      | 5.0  | 5.0  | 5.0  | 5.0  | 5.0            |
      | 8.0  | 7.0  | 9.0  | 6.0  | 7.5            |
      | 0.0  | 0.0  | 0.0  | 0.0  | 0.0            |

Esquema do Cenário: Validar que o campo Média Final não é editável (Read-only)
    Dado que o sistema calculou a média final do aluno
    Quando o usuário tenta clicar ou digitar no campo "Média Final"
    Então o sistema não deve permitir a edição do valor
    E o campo deve apresentar o atributo visual de "Somente Leitura" (Disabled/Read-only)


      
