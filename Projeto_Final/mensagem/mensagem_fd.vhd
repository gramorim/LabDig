
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem_fd is
		generic( constant ratio 		: integer := 434;
					constant log2_ratio 	: integer := 9;
					constant tam_ascii : integer := 8);
	port(	clock, reset						: in  std_logic;
			i_mensagem 							: in  std_logic_vector( 2 downto 0);
			jogada								: in  std_logic_vector(2*tam_ascii-1 downto 0);
			enable, i_reset, partida, i_prepara					: in  std_logic;
			saida_serial, zero, pronto, Q	: out std_logic;
			
			--depuração
			db_tick								: out std_logic;
			db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(tam_ascii-1 downto 0));
end mensagem_fd;

architecture mensagem_fd_arc of mensagem_fd is

	component Mensagem_2_ascii is
		generic(constant tam_ascii : integer);
		port(	i_mensagem : in  std_logic_vector(2 downto 0);
				ascii		: out std_logic_vector(tam_ascii-1 downto 0);
				zero		: out std_logic);
	end component;
		
	component tx_serial is
		generic( constant ratio 		: integer;
					constant log2_ratio 	: integer;
					constant tam_ascii : integer);
					
		port(	clock, reset, partida, paridade	: in  std_logic;
				dados_ascii								: in  std_logic_vector (tam_ascii-1 downto 0);
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
		
	component registrador_n is
	  generic (constant N: integer);
	  port (clock, clear, enable: in STD_LOGIC;
			  D: in STD_LOGIC_VECTOR(N-1 downto 0);
			  Q: out STD_LOGIC_VECTOR (N-1 downto 0));
	end component;

	signal s_ascii_dec, s_ascii_jogada, s_ascii : std_logic_vector(tam_ascii-1 downto 0);
	signal s_zero	: std_logic;
	signal s_Q 		: std_logic_vector(0 downto 0);
	signal s_mensagem : std_logic_vector(2 downto 0);
begin

	REG : registrador_n
	  generic map(3)
	  port map(clock, reset, i_prepara,
				  i_mensagem,
				  s_mensagem);
			  
	DEC : Mensagem_2_ascii
		generic map(tam_ascii)
		port map(s_mensagem,
					s_ascii_dec,
					s_zero);
					
	with s_Q(0) select 
		s_ascii_jogada <=	jogada(2*tam_ascii-1 downto tam_ascii) when '0',
								jogada( tam_ascii-1 downto 0) when '1';
	
	
	with s_zero select
		s_ascii <=	s_ascii_dec 	when '0',
						s_ascii_jogada	when '1';
	
	TX : tx_serial
		generic map(ratio,log2_ratio,tam_ascii)
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