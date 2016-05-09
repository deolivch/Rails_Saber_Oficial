# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


list = [
  {level: 1, question: 'Como eu crio o objeto pessoa?<br />
    Lembrando que esse objeto recebe o atributo "Pessoa"',      answer: 'pessoa=Pessoa.new("Pessoa")'},
  {level: 1, question: 'Exiba a mensagem "Bom Dia"',            answer: 'puts("Bom Dia")'},
  {level: 1, question: 'Crie um método nome que recebe do 
    objeto Nome o valor "Rails"',                               answer: 'nome=Nome.new("Rails")'},
  {level: 1, question: 'A expressão nome=Nome("Rails") pode ser
    impressa com puts sim ou não?',                             answer: 'sim'},

  {level: 2, question: 'Quanto é 2 + 2 ?',      answer: 4},
  {level: 2, question: 'Qual é 3 + 3 ?',        answer: 6},
  {level: 2, question: 'Quanto é 4 + 4',        answer: 8},
  {level: 2, question: 'Quanto é 5 + 5',        answer: 10},

  {level: 3, question: 'Quanto é 6 * 6 - 6:',   answer: 30},
  {level: 3, question: 'Qual é a raiz de 9 ?',  answer: 3},
  {level: 3, question: 'Quanto é 20 * (1/-2)',  answer: -10},
  {level: 3, question: 'Quanto é 10 * (1/-2)',  answer: -5},
]

list.each do |obj|
  Question.find_or_create_by!(obj)
end
