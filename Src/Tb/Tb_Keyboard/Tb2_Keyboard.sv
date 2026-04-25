`timescale 1ms / 1us 

module tb_controle_mestre;

  logic       clk;
  logic       rst;
  logic       enable;
  logic [3:0] col_matriz;
  logic [3:0] lin_matriz;
  logic [79:0] digitos_value; 
  logic       digitos_valid;

  decodificador_de_teclado dut (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .col_matriz(col_matriz),
    .lin_matriz(lin_matriz),
    .digitos_value(digitos_value),
    .digitos_valid(digitos_valid)
  );

  initial clk = 0;
  always #0.5 clk = ~clk;

  logic [3:0] tb_linha_pressionada = 4'b1111;
  logic [3:0] tb_coluna_pressionada = 4'b1111;
  assign col_matriz = (lin_matriz == tb_linha_pressionada) ? tb_coluna_pressionada : 4'b1111;

  task press_key(input [3:0] linha, input [3:0] coluna, input string nome_tecla);
    begin
      tb_linha_pressionada = linha;
      tb_coluna_pressionada = coluna;
      #150;
      tb_linha_pressionada = 4'b1111;
      tb_coluna_pressionada = 4'b1111;
      #50; 
    end
  endtask

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_controle_mestre);

    rst = 1; enable = 0; 
    #15;

    rst = 0; enable = 1; 
    #15; 
    
    press_key(4'b0111, 4'b0111, "1");
    #20;
    
    enable = 0; 
    #30;
    
    press_key(4'b0111, 4'b1011, "2"); 
    enable = 1; 
    #30;
    
    press_key(4'b0111, 4'b1101, "3"); 
    tb_linha_pressionada = 4'b1011;
    tb_coluna_pressionada = 4'b0111; 
    #50; 
    
    rst = 1; 
    #30; 
    
    rst = 0;
    tb_linha_pressionada = 4'b1111;
    tb_coluna_pressionada = 4'b1111;
    #50; 
    
    $finish; 
  end

endmodule
