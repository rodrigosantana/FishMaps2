# TODO

- Na função `panel.zero.points`
  - Arrumar o problema dos zeros e dos NAs (os primeiros exemplos no
    `FishMaps.R` mostram isso)
  - Colocar um argumento na função para escolher o pch do zero, o que
    leva a
- Colocar um argumento para dizer se quer plotar o zero separado ou nao,
  algo como `sep.zero = [TRUE/FALSE]`. Em muitos casos o zero pode não
  ser importante e a pessoa pode querer deixar o zero na escala com
  todos os dados
- Arrumar mais exemplos com dados (que podem ser fictícios) em outros
  oceanos e outras costas
- Separar esses arquivos de exemplos
- Escrever a documentação -> etapa iniciada no branch roxygen
- Compilar o pacote -> usando devtool
- Testar no Travis CI (como no
  [FishMaps](https://github.com/fernandomayer/FishMaps))
- Melhorar os imports das funcoes que estamos usando dentro da funcao
	principal
- Revisar o uso de data() dentro da funcao: uma forma melhor seria
	importar essa base e salvar como um arquivo rda
- Revisar os NOTEs do devtools::check()
