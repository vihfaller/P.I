# Documento de Definição de Requisitos

**Projeto:** Live Light  
**Responsáveis:** Arthur Souto, Wendryu, Vitória Faller  

## 1. Introdução

Cerca de um bilhão de pessoas vivem com algum tipo de transtorno mental no mundo. Desse total, 14% são adolescentes. O que isso causa? Pode levar a vícios de farmacodependência a até suicídio. Temos esse resultado pois falta a comunicação e oportunidade de melhorar sua saúde mental, conseguir reverter seu quadro sem utilizar dinheiro, porque bilhões de pessoas se encontram nesse estado.

## 2. Descrição do Propósito do Sistema

É um sistema que permite uma pessoa que gostaria de ajuda psicológica se cadastre no app, permitindo realizar anotações diárias sobre como anda o dia e a mente. Também terá o acesso para consultas com psicólogos diariamente ou semanalmente, podendo o profissional, no qual terá acesso as anotações do paciente e o permitindo subir de nível. Ao longo da jornada do usuário, ele irá subir de nível, e chegando ao nível 25 poderá se conectar a outros usuários que estão no mesmo processo que ele, indo em busca de uma boa saúde mental e bem-estar consigo mesmo.  

## 3. Requisitos

### Requisitos e Regras de Negócio

| Identificador | Descrição | Prioridade | Depende de |
| --- | --- | --- | --- |
| RF01 | Tela login | Alta | RF02 |
| RF02 | Cadastro | Alta | RF01 |
| RF03 | DASHBOARD/Tela inicial onde a maioria das funcionalidades estarão presentes. | Alta | RF04, RF05, RF06, RF07, RF08 |
| RF04 | Sistema de diário/tela onde o user pode escrever diarimente sobre seus sentimentos(informações do diario serão privadas, onde apenas o user que escreveu terá acesso.) | Alta |  |
| RF05 | Sistema/tela sobre a porcentagem e infomações referente ao quadro de melhora do user. | Media |  |
| RF07 | Sistema/tela de procura ao especialista. | Media |  |
| RF08 | Sistema/tela com músicas, ou podcasts recomendados ao usuário. | Baixa |  |
| RF09 | Contratação do psicologo, juntamente com os preços dos planos. | Alta |  |
| RF10 | Tela de perfil/profile-area. | Media |  |
| RF11 | Área de relacionamento entre os usuarios. | Media |  |




### Requisitos não Funcionais

| Identificador | Descrição | Prioridade | Depende de |
| --- | --- | --- | --- |
| RF01 | O sistema deve rodar em dispositivos móveis, onde o dispositivo necessita ter mais de 2GB de RAM | Alta |  |
| RF02 | O sistema será inicialmente desenvolvido em JAVA, XML, e ANDROID SDK, IDE ANDROID STUDIO, podendo ter um port para versão web. | Alta |  |
| RF03 | Conexão com o banco de dados por meio de uma abordagem híbrida onde inicialmente faremos requisições no banco de dados integrado SQLite (Uma vez que ele funciona offline), depois mudaremos para consumo de uma API Remota que recebe as requisição(users, info) e armazena esses dados no banco de dados Postgres. | Alta |  |
| RF04 | O sistema deve ser intuitivo, responsivo e de fácil entendimento a todos os tipos de usuários. | media |  |
| RF05 | Os usuarios precisam estar logados e ter atingido o level 25(referente ao seu estado Psicologico) para liberar os relacionamentos com outros usuarios | Media |  |
| RF06 | Inicialmente ao se cadastrar, o usario responderá um questionário onde o sistema irá analizar as respostas do user e tirar uma base do seu estado psicologico. Essa base sera avaliada retornando um nivel ao user(onde 0 é o pior dos casos, 25 intermediario para melhora e 50 perfeitamente saudável) | Alta |  |
