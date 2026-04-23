# Fechadura Eletrônica Digital com FPGA

Repositório dedicado ao projeto em nível de transferência de registradores (RTL) de uma Fechadura Eletrônica, desenvolvido em SystemVerilog. O projeto foi estruturado como requisito prático para a disciplina de Projeto de Sistemas Digitais do curso de Engenharia de Computação (IFPB).

O foco deste repositório é demonstrar a modelagem de hardware digital, o particionamento hierárquico de módulos, a implementação de Máquinas de Estado Finito (FSMs) complexas e a verificação robusta por simulação.

## Especificações Técnicas

O sistema foi desenhado para operar a um *clock* base de 1KHz e simula as regras de negócio de hardwares comerciais de segurança. As principais características incluem:

* **Buffer Anti-Spy:** Suporte à inserção de dígitos aleatórios antes ou depois da senha real, utilizando um buffer dinâmico de até 21 dígitos totais.
* **Gestão de Credenciais:** Armazenamento simultâneo de 1 Senha Master e até 4 senhas de usuário (com tamanho variável de 4 a 12 dígitos).
* **Sistema de Bloqueio (Security Lockout):**
    * *Timeout* de 5 segundos de inatividade entre o acionamento de teclas.
    * Penalidade de 1 segundo de inoperância por falha de autenticação.
    * *Hard-lock* de 30 segundos após 5 tentativas incorretas consecutivas.
* **Controles de Acesso:** Trancamento automático parametrizável, alarme sonoro (Bip) indicativo de porta aberta e função de bloqueio interno ("Não Perturbe").
* **Modo de Setup:** Interface via teclado para reconfiguração de temporizadores e credenciais *on-the-fly*.

## Arquitetura e Módulos

O design foi modularizado para garantir clareza, isolamento de domínios e facilidade de teste. Tipos de dados customizados (`structs` empacotadas) foram utilizados para estruturar a comunicação entre os blocos lógicos.

* `FechaduraTop`: O *Wrapper* principal do sistema. Roteia os sinais de I/O (matriz do teclado, botões de interrupção, sensores e saídas para os displays).
* `operacional`: *Datapath* e módulo de controle primário. Avalia as entradas, gerencia os contadores de timeout, verifica as credenciais no buffer e atua sobre os pinos de tranca e alarmes.
* `setup`: FSM isolada dedicada à reconfiguração. Intercepta as entradas do teclado mediante autenticação da Senha Master para atualizar os parâmetros de funcionamento global.
* `decodificador_de_teclado`: Implementa a varredura contínua da matriz 4x4, filtro de *debouncing* mecânico e o empacotamento dos dígitos válidos em BCD.
* `display`: Módulo puramente combinacional para roteamento e conversão de sinais BCD para a exibição nos seis displays de 7-segmentos.
* `resetHold5s`: Circuito de segurança integrado que exige 5 segundos contínuos de sinal lógico alto no botão físico para propagar o *reset* a todos os registradores do sistema.

## Verificação e Simulação

A validação da lógica combinacional, transições de estado e temporização foi inteiramente realizada através de simulações orientadas a *Testbenches*, garantindo o comportamento esperado antes de qualquer síntese física.

**Para reproduzir as simulações:**
1. Clone este repositório.
2. Importe os arquivos fonte (`.sv`) para o ambiente [EDA Playground](https://www.edaplayground.com/).
3. Selecione um simulador compatível com SystemVerilog (ex: *Synopsys VCS 2025.06*).
4. Execute o testbench principal.
5. Utilize o **EPWave** para analisar as formas de onda, verificando o acionamento da tranca e as transições de estado.

## Autores

1. Estudantes de Engenharia de Computação:
- **Hillary Maximino Andrade** | [Linkedin](https://www.linkedin.com/in/hillarymaximino/)
- **Luma Sousa de Queiroz** | [Linkedin](https://www.linkedin.com/in/luma-sousa-de-queiroz/)
- **Letícia Vitória Souza Soares** | [Linkedin](https://www.linkedin.com/in/leticiavitoriadev/)
