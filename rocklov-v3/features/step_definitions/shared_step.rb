
Então('sou redirecionado para o Dashboard') do
    # Retornar um verdadeiro ou falso
    expect(@dash_page.on_dash?).to be true
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert| # O expect_alert é um argumento.
    # Deixamos de usar o seguinte comando, pois, passamos a usar no arquivo alert.rb que é um componente
    # alert = find(".alert-dark")
    # @alert é a variável do arquivo hooks.rb
    # dark é o método/função do arquivo alert
    expect(@alert.dark).to eql expect_alert
end