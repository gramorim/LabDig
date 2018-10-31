
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity teste is
	generic(	constant M: integer := 5208;
				constant N: integer := 13);
	port(	clock, reset, start	: in  std_logic;
			serial, o_andamento	: out std_logic);
end teste;

architecture teste_arc of teste is
	signal s_andamento, s_start, s_reset : std_logic;
	signal s_ascii : std_logic_vector(6 downto 0);

	component mensagem is
		generic(	constant M : integer := 8;
					constant N : integer := 3);
		port(	clock, start, andamento, reset 	: in  std_logic;
				o_andamento, o_start					: out std_logic;
				ascii										: out std_logic_vector(6 downto 0));
	end component;
	
	component tx_serial is
		 generic(constant Ratio_m : integer := 100;
					constant Ratio_n : integer := 7);
		 port(clock, reset, partida, paridade                : in  std_logic;
				dados_ascii                                    : in  std_logic_vector (6 downto 0);
				saida_serial, pronto, o_tick, transm_andamento : out std_logic;
				o_estado                                       : out std_logic_vector(3 downto 0));
	end component;
	
begin
	
	s_reset <= not reset;

	MEN : mensagem
		generic map(8,3)
		port map(	clock, not start, S_andamento, s_reset,
						o_andamento, s_start,
						s_ascii);
						
	TX : tx_serial
		 generic map(M,N)
		 port map(	clock, s_reset, s_start, '0',
						s_ascii,
						serial, open, open, s_andamento,
						open);
			
end teste_arc;
