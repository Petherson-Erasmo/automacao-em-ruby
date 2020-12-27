
Então('sou redirecionado para o Dashboard') do

    expect(@dash_page.on_dash?).to be true
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert| # O expect_alert é um argumento.

    expect(@alert.dark).to eql expect_alert
end