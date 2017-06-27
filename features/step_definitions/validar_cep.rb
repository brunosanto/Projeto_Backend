Dado(/^que faça uma consulta atraves de um CEP$/) do
  @result = HTTParty.get('http://correiosapi.apphb.com/cep/06322010')
end

Dado(/^que faça uma consulta atraves de um CEP inválido$/) do
  @result = HTTParty.get('http://correiosapi.apphb.com/cep/99999999')
  puts @result.response.code
end

Então(/^o sistema retorna as informações da pesquisa$/) do
  resultado = @result.parsed_response
  expect(resultado).not_to be_empty
  puts resultado
end

Quando(/^tiver um cep cadastrado$/) do
 @cep = {
   :cep => "06322010",
   :tipoDeLogradouro => "Avenida",
   :logradouro => "Eugênia",
   :bairro => "Centro",
   :cidade => "Carapicuíba",
   :estado => "SP"
 }
end

Então(/^o código da resposta deve ser "([^"]*)"$/) do |arg1|
  expect(@result.response.code).to eql arg1
end