
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity mensagem_fd is
	generic(	constant M : integer := 8; --Tamanho da memoria
				constant N : integer := 3; --Num bits do tamanho
				constant filename: string := "conteudo_inicial.mif");
	port(	clock, reset, enable	: in  std_logic;
			fim						: out std_logic;
			ascii						: out std_logic_vector(6 downto 0);
			
			--depuração
			db_end : out std_logic_vector(N-1 downto 0));
end mensagem_fd;

architecture mensagem_fd_arc of mensagem_fd is
	signal s_zero	: std_logic_vector(6   downto 0);
	signal s_end	: std_logic_vector(N-1 downto 0);

	component contador_m is
		 generic(constant M: integer := 50;
					constant N: integer := 6);
		 port(CLK, zera, conta: in STD_LOGIC;
				Q: out STD_LOGIC_VECTOR (N-1 downto 0);
				fim: out STD_LOGIC);
	end component;
	
	component ram_MxN is
		GENERIC(	constant M       : integer := 16;
					constant N       : integer := 7;
					constant ADR     : integer := 4;
					constant filename: string := "conteudo_inicial.mif");
		PORT(	dado_entrada : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				dado_saida   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				endereco     : IN  STD_LOGIC_VECTOR(ADR-1 DOWNTO 0);         
				we, ce    	 : IN  STD_LOGIC);
	end component;

begin
	CONT: contador_m
		 generic map(M,N)
		 port map(	clock, reset, enable,
						s_end,
						fim);
					
	s_zero <= std_logic_vector(to_unsigned(0, 7));	
					
	RAM: ram_MxN
		GENERIC map(M,7,N,filename)
		PORT map(	s_zero,
						ascii,
						s_end,      
						'0','1');
		
		db_end <= s_end;
		
end mensagem_fd_arc;