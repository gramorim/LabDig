
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity mensagem is
	generic( constant ratio 		: integer := 7;
				constant log2_ratio 	: integer := 3);
	PORT(	clock, reset 			: in  std_logic;
			i_mensagem 				: in  std_logic_vector( 2 downto 0);
			jogada					: in  std_logic_vector(13 downto 0);
			enviar					: in  std_logic;
			saida_serial, pronto : out std_logic;
			
			--Depuração
			db_estado 	: out std_logic_vector(3 downto 0);
			db_tick, db_enable, db_Q		: out std_logic;
			db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(6 downto 0));
end mensagem;

architecture mensagem_arc of mensagem is
	
	component mensagem_fd is
		generic( constant ratio 			: integer;
					constant log2_ratio 		: integer);
		port(	clock, reset						: in  std_logic;
				i_mensagem 							: in  std_logic_vector( 2 downto 0);
				jogada								: in  std_logic_vector(13 downto 0);
				enable, i_reset, partida					: in  std_logic;
				saida_serial, zero, pronto, Q : out std_logic;
			
				--depuração
				db_tick	: out std_logic;
			db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(6 downto 0));
	end component;
	
	component mensagem_uc is
		port(	clock, reset, enviar 		: in  std_logic;
				zero, i_pronto, Q 			: in  std_logic;
				enable, o_reset, partida, o_pronto 	: out std_logic;
			
				--Depuração
				db_estado 	: out std_logic_vector(3 downto 0));
	end component;
	
	signal s_enable, s_reset, s_partida, s_zero, s_pronto, s_Q : std_logic;
begin
	
	FD : mensagem_fd
		generic map(ratio,log2_ratio)
		port map(clock, reset,
					i_mensagem,
					jogada,
					s_enable, s_reset, s_partida,
					saida_serial, s_zero, s_pronto, s_Q,
					db_tick, 
					db_ascii_dec, db_ascii_jogada, db_ascii);
	
	UC : mensagem_uc
		port map(clock, reset, enviar,
					s_zero, s_pronto, s_Q,
					s_enable, s_reset, s_partida, pronto,
					db_estado);
					
	db_enable <= s_enable;
	db_Q <= s_Q;
end mensagem_arc;