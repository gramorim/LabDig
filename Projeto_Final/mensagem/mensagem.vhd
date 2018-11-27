
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity mensagem is
	generic( constant ratio 		: integer := 434;
				constant log2_ratio 	: integer := 9);
	PORT(	clock, reset 			: in  std_logic;
			mensagem 				: in  std_logic_vector( 2 downto 0);
			jogada					: in  std_logic_vector(13 downto 0);
			enviar					: in  std_logic;
			saida_serial, pronto : out std_logic);
end mensagem;

architecture mensagem_arc of mensagem is
	
	component mensagem_fd is
			generic( constant ratio 			: integer;
						constant log2_ratio 		: integer);
		port(	clock, reset						: in  std_logic;
				mensagem 							: in  std_logic_vector( 2 downto 0);
				jogada								: in  std_logic_vector(13 downto 0);
				enable, partida					: in  std_logic;
				saida_serial, zero, pronto, Q : out std_logic);
	end component;
	
	component mensagem_uc is
		port(	clock, reset, enviar 		: in  std_logic;
				zero, i_pronto, Q 			: in  std_logic;
				enable, partida, o_pronto 	: out std_logic);
	end component;
	
	signal s_enable, s_partida, s_zero, s_pronto, s_Q : std_logic;
begin
	
	FD : mensagem_fd
		generic map(ratio,log2_ratio)
		port map(clock, reset,
					mensagem,
					jogada,
					s_enable, s_partida,
					saida_serial, s_zero, s_pronto, s_Q);
	
	UC : mensagem_uc
		port map(clock, reset, enviar,
					s_zero, s_pronto, s_Q,
					s_enable, s_partida, pronto);
end mensagem_arc;