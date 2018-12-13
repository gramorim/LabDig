
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity mensagem is
	generic( constant ratio 		: integer := 7;
				constant log2_ratio 	: integer := 3;
				constant tam_ascii : integer := 7);
	PORT(	clock, reset 			: in  std_logic;
			i_mensagem 				: in  std_logic_vector( 2 downto 0);
			jogada					: in  std_logic_vector(2*tam_ascii-1 downto 0);
			enviar					: in  std_logic;
			saida_serial, pronto : out std_logic;
			
			--Depuração
			db_estado 	: out std_logic_vector(3 downto 0);
			db_tick, db_enable, db_Q		: out std_logic;
			db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(tam_ascii-1 downto 0));
end mensagem;

architecture mensagem_arc of mensagem is
	
	component mensagem_fd is
		generic( constant ratio 			: integer;
					constant log2_ratio 		: integer;
					constant tam_ascii : integer := 7);
		port(	clock, reset						: in  std_logic;
				i_mensagem 							: in  std_logic_vector( 2 downto 0);
				jogada								: in  std_logic_vector(2*tam_ascii-1 downto 0);
				enable, i_reset, partida, i_prepara					: in  std_logic;
				saida_serial, zero, pronto, Q : out std_logic;
			
				--depuração
				db_tick	: out std_logic;
			db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(tam_ascii-1 downto 0));
	end component;
	
	component mensagem_uc is
		port(	clock, reset, enviar 		: in  std_logic;
				zero, i_pronto, Q 			: in  std_logic;
				enable, o_reset, partida, o_prepara, o_pronto 	: out std_logic;
			
				--Depuração
				db_estado 	: out std_logic_vector(3 downto 0));
	end component;
	
	signal s_enable, s_reset, s_partida, s_prepara, s_zero, s_pronto, s_Q : std_logic;
begin
	
	FD : mensagem_fd
		generic map(ratio,log2_ratio, tam_ascii)
		port map(clock, reset,
					i_mensagem,
					jogada,
					s_enable, s_reset, s_partida, s_prepara,
					saida_serial, s_zero, s_pronto, s_Q,
					db_tick, 
					db_ascii_dec, db_ascii_jogada, db_ascii);
	
	UC : mensagem_uc
		port map(clock, reset, enviar,
					s_zero, s_pronto, s_Q,
					s_enable, s_reset, s_partida, s_prepara, pronto,
					db_estado);
					
	db_enable <= s_enable;
	db_Q <= s_Q;
end mensagem_arc;