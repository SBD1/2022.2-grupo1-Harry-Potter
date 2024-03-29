
![asd](./Documentos/Imagens/Harry_Potter_wordmark.png)

# 2022.2-grupo1-Harry-Potter
Repositório para desenvolvimento do jogo Harry Potter da disciplina de SBD1 - 2022.2

## Como rodar o jogo:

Certifique-se que tenha as bibliotecas "pandas" e "psycopg2" instaladas. Caso não, rode o seguinte comando na pasta raíz:

```
pip install -r requirements.txt
```

Para rodar o jogo, primeiramente verifique se a porta localhost (5432) está disponível.

Após isso, para subir o banco tendo em vista que já possua o docker instalado, basta executar o comando:

```
docker-compose up
```

Por fim para rodar o jogo estando na pasta do projeto, basta executar:

```
python app/game.py
```

## Como acessar o banco de dados:

Para acessar o banco de dados, verifique se este está rodando pelo docker e execute o comando:

```
psql -U postgres
```

E insira a senha ```postgres```
## Integrantes da equipe

| Nome         | Perfil do github                                 | Matrícula|
|--------------|--------------------------------------------------|----------|
|Alexia Naara  | [alexianaa](https://github.com/alexianaa)        | 202045007|
|André Corrêa  | [dartmol203](https://github.com/dartmol203)      | 200014447|
|Felipe Candido| [felipecdmoura](https://github.com/felipecdmoura)| 200030469|
|Iago Campelo  | [iagoscm](https://github.com/iagoscm)            | 202023743|
|Letícia Karla | [leticiaarj](https://github.com/leticiaarj)      | 150135939|

## Videos de apresentação

| Módulo         | Link da gravação       | Data |
|----------------|------------------------|------|
| 1              | [Apresentação Módulo 1](https://unbbr.sharepoint.com/:v:/s/SBD1-20222/EejUfL9qXfpEsDy2qnnhH1YBqo5rGOxfywmj5EtrEw4qOQ) | 28/11/2022 |
| 2              | [Apresentação Módulo 2](https://unbbr-my.sharepoint.com/:v:/g/personal/200014447_aluno_unb_br/EUAUxqW0gJlPk9X95PemVJsBupmwQM0x_uJ2BQkhjIR8tg?e=gTtRAi) | 16/01/2023 |
| 3              | [Apresentação Módulo 3](https://unbbr-my.sharepoint.com/:v:/g/personal/200030469_aluno_unb_br/ETnUByFmnXtLp5LSV3T9dpUBL-LRKV6ezbwrexVFy4ZI_Q?e=8W1Kqs) | 01/02/2023 |
| 4       | [Apresentação Módulo 4](https://unbbr-my.sharepoint.com/:v:/g/personal/200014447_aluno_unb_br/EQJ3KHEQ4aVKmnQjfa0GQ0wBi_0DVoaMX2EIKGUNbFLlFQ) | 06/02/2023 |


## Entregas

- Módulo 1
  - [DER](Imagens/DER_HarryPotter_v4.0.pdf)
  - [DLD](Imagens/DLD_HarryPotter_v.4.0.pdf)
  - [Dicionário de Dados](Dicionario_Dados.md)

- Módulo 2
  - [Queries](sql/)
  - [Código do Jogo](app/)
  - [Docker](docker-compose.yml)
  
- Módulo 3
  - [Views](sql/TF_Query_3_GameActions.sql)
  - [Triggers and Stored Procedures](sql/TF_Query_4_TriggersAndStoredProcedures.sql)
  - [Roles e Usuários](sql/TF_Query_AcessControl.sql)
  - [Implementação de Loja, Combate e outras features no jogo](app/)
  
- Módulo 4
  - [Aperfeiçoamentos no jogo](app/)
  - [Novos feitiços e poções](app/)
  - [Novas lojas](app/)
  - [Sistema de cura](app/)
  - [Novos personagens e inimigos](app/)
