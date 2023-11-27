# Sonarqube-Demo
A repository with explanation about Sonarqube functionalities.

Language: Pt-Br

## O que é SAST?
A análise de código estático consiste em realizar **uma série de verificações em seu código fonte** de forma automatizada.

O principal critério da análise de código estático é evitar que **problemas oriundos de um desenvolvimento parcialmente ou não revisado** gerem **vulnerabilidades, inconsistências ou até dificuldade na manutenção**, já que esses fatores podem gerar impactos significativos quando encontrados em ambiente de produção.

## Quais os benefícios de utilizar uma ferramenta SAST para avaliação do seu código?

1. A identificação antecipada de problemas, desde o princípio do desenvolvimento:
Utilizando uma ferramenta de **SAST**, é possível **antecipar problemas** realizando diagnósticos no código produzido, evitando a geração de um **build com vulnerabilidades, defeitos ou até más práticas de desenvolvimento**.

2. Garantia da qualidade do código:
Como citado acima, a análise de código estático nos auxilia na **avaliação da aplicação de boas práticas de programação, identificando os famosos code smells, conhecido por alguns como "cógido espaguete"**, ou seja, aquele código que não segue regras básicas de desenvolvimento e não possui qualquer rigor ou caráter como: **Fácil compreensão por qualquer desenvolvedor, distribuição de código utilizando alguma abstração, capacidade de receber manutenção, entre outros**.

#### Alguns tipos de Code Smells:

➡ **Códigos duplicados, métodos longos, classes extensas, classes preguiçosas e/ ou legadas** (com implementações com baixo uso ou mesmo sem extensão alguma - defasagem de implementação), **dependência** (alto acoplamento), **complexidade artificial** (Patterns que tornam o código demasiadamente complicado para lidar - Over Engineering), **identificadores excessivamente longos, hard coding**, etc...

4. Segurança
Uma ferramenta de **SAST** é capaz de analisar se **o código produzido abre brechas para exposição de informações sigilosas, rapto de dados e invasão de ambiente** (infraestrutura). Ela também é capaz de apresentar qual é o tipo de **vulnerabilidade gerada e no caso de bibliotecas/ dependências do projeto**, o código **CVE** (Common Vulnerabilities and Exposures).

5. Revisão de Código
Utilizar uma ferramenta de **SAST** acelera e otimiza a revisão de código. **O tempo desperdiçado na análise ponto-a-ponto do código é reduzida drasticamente,** já que a ferramenta indica onde devemos aplicar a correção. Inclusive, utilizando algum plugin que aplica Lint, a revisão fica ainda mais dinâmica.

## O que é o SonarQube?
O **SonarQube** é uma plataforma de código aberto desenvolvida pela **SonarSource** para inspeção contínua da qualidade do código para realizar revisões automáticas com **análise estática de código (SAST) para detectar bugs, code smells e vulnerabilidades de segurança em +30 linguagens de programação**.

## Sobre o Sonar Quality Gate?
Utilizando o **Sonar Quality Gate**, métricas pré-estabelecidas serão responsáveis por **mensurar e categorizar seu projeto de software**, basicamente, realizando um diagnóstico sobre o código produzido. Além disso, é permitido ao **Quality Gate**, com base nessas **métricas, promover ou não a publicação do código verificado para um próximo estágio**.

## Afinal, o que é o Clean Code?
**Clean Code**, resumidamente, é uma boa prática de desenvolvimento que enfatiza **a criação de um código para aplicações mais seguro, confiável e de fácil manutenção**, logo, aplicar o **Clean Code** é essencial para manter uma base de código saudável. Isso é extensível a **qualquer código**: código-fonte, código de teste, infraestrutura como código (IaC), scripts...
