-- codigo ADAPTADO do código encontrado no livro 
-- VHDL Descricao e Sintese de Circuitos Digitais
-- Roberto D'Amore, LTC Editora.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ram_MxN IS
	GENERIC (	constant M   : integer := 16;
					constant N   : integer := 7;
					constant ADR : integer := 4;
					constant filename: string := "conteudo_inicial.mif");
   PORT(	dado_entrada : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         dado_saida   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         endereco     : IN  STD_LOGIC_VECTOR(ADR-1 DOWNTO 0);         
         we, ce    	 : IN  STD_LOGIC);
END ram_MxN;

ARCHITECTURE ram1 OF ram_MxN IS
  TYPE   arranjo_memoria IS ARRAY(0 TO M-1) OF STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  signal memoria : arranjo_memoria;
  attribute ram_init_file: string;
  attribute ram_init_file of memoria: signal is filename;
BEGIN

  PROCESS(we, ce, endereco)
  BEGIN
    IF ce = '0' THEN
      IF rising_edge(we) THEN  memoria(to_integer(unsigned(endereco))) <= dado_entrada;
      END IF;
    END IF;
    dado_saida <= memoria(to_integer(unsigned(endereco)));
  END PROCESS;

END ram1;