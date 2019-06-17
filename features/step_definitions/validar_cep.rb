Dado(/^que faça uma consulta atraves de um CEP valido$/) do
  @result = HTTParty.get('https://viacep.com.br/ws/06322010/json')
end

Dado(/^que faça uma consulta atraves de um CEP inválido$/) do
  @result = HTTParty.get('https://viacep.com.br/ws/000/json')
  puts @result.response.code
end

Então(/^o sistema retorna as informações da pesquisa e valor do ibge$/) do
  resultado = @result.parsed_response
  expect(resultado).not_to be_empty
  puts ibge = JSON.parse(resultado)['ibge']
end

Então(/^o código da resposta deve ser "([^"]*)"$/) do |arg1|
  expect(@result.response.code).to eql arg1
end
