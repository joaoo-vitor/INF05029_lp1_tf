# Trabalho Final da Cadeira de LP1 (Linguagens de Programação 1 )
## Enunciado
O trabalho consiste em desenvolver um scanner, parser, type_infer e avaliador para a linguagem L2 v2.

### Especificação da linguagem L2 v2
- Expressões (e):
    - Números inteiros (1, 2, 3,...);
    - Booleano (true, false);
    - Operações binárias (e1 op e2);
    - If-else (if e1 then {e2} else {e3});
    - Identificador (x);
    - Let (let x: T = e1 in {e2});
    - Atribuição (x := e);
    - Captura do valor da memória (!e);
    - Alocação de memória (new e);
    - Valor vazio ( () );
    - While (while e1 do {e2});
    - Sentenças separadas (e1; e2)
    - Endereço de memória (l).
*Obs1*: e (e1, e2...) representam expressões qualquer.
*Obs2*: op pertence ao conjunto {+, -, *, /, &&, ||, =, <, >}.
*Obs3*: l pertence ao conjunto de Locations, que são localizações/endereços de memória.
*Obs4*: l's não são usados é usado pelo programador.

- Valores (v)
    - Números inteiros (1, 2, 3,...);
    - Booleano (true, false);
    - Valor vazio ( () );
    - Endereço de memória (l).

- Tipos (T)
    - Inteiro (int);
    - Booleano (bool);
    - Referência para um tipo (ref T);
    - Vazio (unit).

A *semântica operacional small-step* está identificada no pdf da especificação do trabalho.


## Escolhas para o trabalho
- Para compilar os arquivos OCaml juntos, foi usado a biblioteca [Dune](https://dune.build/)
- Para o scanner, foi utilizada a biblioteca ocamllex a partir do arquivo de configurações `lexer.mll`.
- Para o parser, foi utilizada a biblioteca menhir a partir do arquivo de configurações `parser.mly` e `ast.ml`.
Leia a estrutura de arquivos para saber o que cada um faz.



### Arquivos


### Como rodar o trabalho
A main roda um teste específico a partir do que for dado como entrada.
Rodando um teste específico:
```bash
dune exec lp1_tfs
```
