# Esse arquivo vai ser usado para as steps que serão compartilhadas quando tem o mesmo comportamento.
# EX: o step "Então sou redirecionado para o Dashboard" arquivo cadastro.feature é o mesmo do arquivo login.feature

Então('sou redirecionado para o Dashboard') do
    # O expect é um recurso de validação do rspec. O page é um objeto do capybara
    expect(page).to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert| # O expect_alert é um argumento.
    alert = find(".alert-dark")
    expect(alert.text).to eql expect_alert
end