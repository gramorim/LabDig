
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity teste is
	generic(	constant M: integer := 434;
				constant N: integer := 9);
	port(	clock, reset, start	: in  std_logic;
			serial, o_pronto		: out std_logic;
			db_pronto				: out std_logic;
			db_end 					: out std_logic_vector(2 downto 0));
end teste;

architecture teste_arc of teste is
	signal s_pronto, s_start, s_reset : std_logic;
	signal s_ascii : std_logic_vector(6 downto 0);

	component mensagem is
		generic(	constant M : integer := 8;
					constant N : integer := 3);
		port(	clock, start, pronto, reset 	: in  std_logic;
				o_pronto, o_start					: out std_logic;
				ascii									: out std_logic_vector(6 downto 0);
				db_end 								: out std_logic_vector(N-1 downto 0));
	end component;
	
	component tx_serial is
    port (	clock, reset, partida, paridade: in std_logic;
				dados_ascii: in std_logic_vector (6 downto 0);
				saida_serial, pronto : out std_logic);
	end component;
	
begin
	
	s_reset <= not reset;

	MEN : mensagem
		generic map(8,3)
		port map(	clock, not start, s_pronto, s_reset,
						o_pronto, s_start,
						s_ascii,
						db_end);
						
	TX : tx_serial
		 port map(	clock, s_reset, s_start, '0',
						s_ascii,
						serial, s_pronto);
						
	db_pronto <= s_pronto;
			
end teste_arc;
