
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



      
