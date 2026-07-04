# Template LaTeX — Trabalhos Acadêmicos UVA

Template em LaTeX para a formatação de trabalhos acadêmicos (monografias, artigos e demais trabalhos) da **Universidade Veiga de Almeida (UVA)**, seguindo as normas da **ABNT** (NBR 14724).

O template já vem estruturado com todos os elementos exigidos — capa, folha de rosto, folha de aprovação, resumo, listas, sumário, corpo do texto e referências — bastando preencher com o seu conteúdo.

## Requisitos

Para compilar o documento é necessário ter uma distribuição LaTeX instalada no computador:

- **[TeX Live](https://www.tug.org/texlive/)** - A comprehensive TeX system with binaries for most flavors of Unix, including GNU/Linux and also Windows;
- **[MiKTeX](https://miktex.org/)** - A modern TeX distribution for Windows, Linux and macOS;
- **[MacTeX](https://www.tug.org/mactex/)** - A package which installs TeX Live on the Macintosh.

Além disso, o template utiliza os pacotes:

- **`biblatex`** com estilo **ABNT** e o motor **Biber** para a geração das referências;
- **`minted`** para a formatação de blocos de código. Este pacote depende do **[Python](https://www.python.org/)** com a biblioteca **[Pygments](https://pygments.org/)** instalada:

  ```bash
  pip install Pygments
  ```

  Por depender do Pygments, o `minted` exige que a compilação seja feita com a flag **`--shell-escape`** habilitada (veja abaixo).

## Editor recomendado

Para editar e compilar o projeto no **Visual Studio Code**, recomenda-se a extensão **[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)**, de *James Yu*. Ela oferece compilação automática ao salvar, visualização do PDF integrada, *SyncTeX* (navegação entre código e PDF), realce de sintaxe e autocompletar.

Como o template usa `minted` e `biber`, adicione a seguinte *recipe* às configurações do VS Code (`settings.json`) para que a compilação use `--shell-escape` e rode o Biber na ordem correta:

```json
"latex-workshop.latex.tools": [
  {
    "name": "pdflatex",
    "command": "pdflatex",
    "args": ["--shell-escape", "-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"]
  },
  { "name": "biber", "command": "biber", "args": ["%DOCFILE%"] }
],
"latex-workshop.latex.recipes": [
  {
    "name": "pdflatex → biber → pdflatex × 2",
    "tools": ["pdflatex", "biber", "pdflatex", "pdflatex"]
  }
]
```

## Como compilar

O arquivo principal é o [main.tex](main.tex). Como o template usa `minted` (Pygments) e `biblatex` (Biber), a sequência completa de compilação é:

```bash
pdflatex --shell-escape main.tex
biber main
pdflatex --shell-escape main.tex
pdflatex --shell-escape main.tex
```

O PDF final será gerado como `main.pdf`.

> **Dica:** no **VS Code**, use a extensão **LaTeX Workshop** com a *recipe* descrita na seção [Editor recomendado](#editor-recomendado) — ela executa esses passos automaticamente. Em outros editores (TeXstudio, Overleaf, etc.), lembre-se de habilitar o `shell-escape` e definir o *bibliography backend* como **Biber**.

## Estrutura do projeto

```text
UVA_Trabalho_Final/
├── main.tex              # Arquivo principal — imports, configurações e ordem das seções
├── UVA_ABNT.cls          # Classe de documento personalizada (formatação UVA/ABNT)
├── Referencias.bib       # Base de referências bibliográficas (BibTeX/Biber)
├── Figuras/              # Imagens usadas no documento (logo UVA, placeholders, etc.)
├── Codigos/              # Trechos de código-fonte para inclusão via minted
├── Tex/
│   ├── ParteExterna/     # Capa
│   ├── Pretexto/         # Elementos pré-textuais (folha de rosto, aprovação,
│   │                     #   dedicatória, agradecimentos, epígrafe, resumo, listas)
│   └── Corpo/            # Elementos textuais (introdução, desenvolvimento, conclusão)
├── Recursos Externos/    # PDFs de referência da UVA e da ABNT (ver abaixo)
└── build/                # Saída da compilação (ignorada pelo Git)
```

## Como usar

1. **Preencha os dados do trabalho** no [main.tex](main.tex), na seção *Valores do Documento*:

   ```latex
   \setTitle[Título do Trabalho em Portugues]
   \setSubtitle[Subtítulo do Trabalho em Portugues]
   \setCity[Rio de Janeiro]
   \setAuthors[NOME DO AUTOR \\ MATRÍCULA]
   ```

2. **Edite o conteúdo** nos arquivos dentro de [Tex/](Tex/). Cada elemento do trabalho está em seu próprio arquivo `.tex`, incluído pelo `main.tex`.
   - Páginas marcadas como *opcionais* (dedicatória, agradecimentos, epígrafe) podem ser removidas comentando a linha `\input{...}` correspondente no `main.tex`.
3. **Adicione suas referências** no [Referencias.bib](Referencias.bib) e cite-as normalmente no texto. As referências são formatadas automaticamente segundo a ABNT.
4. **Inclua imagens** na pasta [Figuras/](Figuras/) e códigos-fonte na pasta [Codigos/](Codigos/).
5. **Compile** seguindo os passos da seção anterior.

## Recursos Externos

A pasta [Recursos Externos/](Recursos%20Externos/) contém três PDFs de consulta com os modelos oficiais da UVA e a norma da ABNT, úteis para conferir a formatação exigida:

- **[Norma_ABNT_NBR-14724_2011.pdf](Recursos_Externos/Norma_ABNT_NBR-14724_2011.pdf)** — Norma ABNT que estabelece os princípios gerais para a apresentação de trabalhos acadêmicos.
- **[UVA_examplo_monografia_2021.pdf](Recursos_Externos/UVA_examplo_monografia_2021.pdf)** — Modelo/exemplo oficial de monografia da UVA (2021).
- **[UVA_exemplo_artigo_cientifico_2021.pdf](Recursos_Externos/UVA_exemplo_artigo_cientifico_2021.pdf)** — Modelo/exemplo oficial de artigo científico da UVA (2021).
