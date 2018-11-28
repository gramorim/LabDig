
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem_fd is
		generic( constant ratio 		: integer := 434;
					constant log2_ratio 	: integer := 9);
	port(	clock, reset						: in  std_logic;
			i_mensagem 							: in  std_logic_vector( 2 downto 0);
			jogada								: in  std_logic_vector(13 downto 0);
			enable, i_reset, partida					: in  std_logic;
			saida_serial, zero, pronto, Q	: out std_logic;
			
			--depuração
			db_tick								: out std_logic;
			db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(6 downto 0));
end mensagem_fd;

architecture mensagem_fd_arc of mensagem_fd is

	component MensagemDecodificador is
		port(	i_mensagem : in  std_logic_vector(2 downto 0);
				ascii		: out std_logic_vector(6 downto 0);
				zero		: out std_logic);
	end component;
		
	component tx_serial is
		generic( constant ratio 		: integer;
					constant log2_ratio 	: integer);
					
		port(	clock, reset, partida, paridade	: in  std_logic;
				dados_ascii								: in  std_logic_vector (6 downto 0);
				saida_serial, pronto 				: out std_logic;
				db_tick									: out std_logic);
	end component;
	
	component contador_m is
		 generic(constant M: integer;
					constant N: integer);
		 port(CLK, zera, conta: in STD_LOGIC;
				Q: out STD_LOGIC_VECTOR (N-1 downto 0);
				fim: out STD_LOGIC);
	end component;
	
	signal s_ascii_dec, s_ascii_jogada, s_ascii : std_logic_vector(6 downto 0);
	signal s_zero	: std_logic;
	signal s_Q 		: std_logic_vector(0 downto 0);
begin
	DEC : MensagemDecodificador
		port map(i_mensagem,
					s_ascii_dec,
					s_zero);
					
	with s_Q(0) select 
		s_ascii_jogada <=	jogada(13 downto 7) when '0',
								jogada( 6 downto 0) when '1';
	
	
	with s_zero select
		s_ascii <=	s_ascii_dec 	when '0',
						s_ascii_jogada	when '1';
	
	TX : tx_serial
		generic map(ratio,log2_ratio)
		port map(clock, reset, partida, '0',
					s_ascii,
					saida_serial, pronto,
					db_tick);
					
	cont : contador_m
		generic map(2,1)
		port map(clock, i_reset, enable,
					s_Q,
					open);
	
	zero 	<= s_zero;
	Q 		<= s_Q(0);
	db_ascii_dec <= s_ascii_dec;
	db_ascii_jogada <= s_ascii_jogada;
	db_ascii <= s_ascii;
end mensagem_fd_arc;