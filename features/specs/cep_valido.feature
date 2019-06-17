#language: pt

Funcionalidade: Valida Cep

@valido
Cenário: Válidar CEP válido pela API dos correios
  Dado que faça uma consulta atraves de um CEP valido
  Então o sistema retorna as informações da pesquisa e valor do ibge
  E o código da resposta deve ser "200"

@invalido
  Cenário: Válidar CEP Inválido pela API dos correios
    Dado que faça uma consulta atraves de um CEP inválido
    Então o código da resposta deve ser "400"
