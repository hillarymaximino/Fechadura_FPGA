## ⚙️ Finite State Machine (FSM) / Máquina de Estados Finitos

The keypad decoder logic is governed by a Finite State Machine (FSM) encoded in 4-bit Hexadecimal. Below is the description of each state.
*(A lógica do decodificador de teclado é governada por uma Máquina de Estados Finitos codificada em Hexadecimal de 4 bits. Abaixo está a descrição de cada estado).*

| State (Hex) | State Name (Original) | Description (English) | Descrição (Português) |
| :---: | :--- | :--- | :--- |
| **0x0** | `IDLE` | Idle state. The system is resting, waiting for any key to be pressed. | Estado ocioso. O sistema está em repouso, aguardando o acionamento de qualquer tecla. |
| **0x1** | `VARREDURA` | Matrix scanning. Iterates through rows and columns to identify the exact key pressed. | Varredura da matriz. Itera sobre as linhas e colunas para identificar qual tecla exata foi pressionada. |
| **0x2** | `DEBOUNCE` | Debounce filter. Waits for signal stabilization to eliminate mechanical switch noise. | Filtro de ruído. Aguarda a estabilização do sinal elétrico para eliminar o ruído mecânico (bounce) do botão. |
| **0x3** | `ROTEADOR` | Routing state. Directs the FSM to the appropriate processing state based on the decoded key. | Estado de roteamento. Direciona a FSM para o estado de processamento correto com base na tecla identificada. |
| **0x4** | `PROCESSA_CLEAR` | Clears the current input. [cite_start]Triggered by the '#' key to discard the current password[cite: 27]. | Limpa a entrada atual. [cite_start]Acionado pela tecla '#' para descartar a senha atual[cite: 27]. |
| **0x5** | `PROCESSA_CONFIRMA` | Confirms the input sequence. [cite_start]Triggered by the '*' key[cite: 279]. | Confirma a sequência digitada. [cite_start]Acionado pelo pressionamento da tecla '*'[cite: 279]. |
| **0x6** | `PROCESSA_NUMERO` | Processes standard numeric inputs (0-9) and stores them in the BCD array. | Processa as entradas numéricas padrão (0 a 9) e as armazena no vetor BCD. |
| **0x7** | `TIMEOUT` | Handles the 5-second inactivity timeout. If expired, clears the array and emits an error code[cite: 26, 297]. | Lida com o estouro de tempo de 5 segundos de inatividade[cite: 26]. Caso expire, emite um código de erro[cite: 297]. |
| **0x8** | `AGUARDA_SOLTAR` | Wait for release. Prevents multiple accidental inputs by waiting for the user to physically release the key. | Aguarda soltar. Previne múltiplas entradas acidentais aguardando o usuário soltar fisicamente o botão. |
| **0x9** | `LIMPEZA` | Cleanup state. Resets internal counters and temporary buses before returning to IDLE. | Estado de limpeza. Zera contadores internos e barramentos temporários antes de retornar ao estado ocioso. |
| **0xA** | `PRESSIONANDO` | Hold timer. Evaluates if the key is held for more than 2 seconds for the auto-repeat function[cite: 275]. | Temporizador de pressão. Avalia se a tecla foi mantida por mais de 2 segundos para acionar a repetição automática[cite: 275]. |
| **0xB** | `AGUARDANDO` | Wait state. A transitional delay state used to synchronize timing between events or clock cycles. | Estado de espera. Um atraso transicional utilizado para sincronizar o tempo entre eventos ou ciclos de clock. |
