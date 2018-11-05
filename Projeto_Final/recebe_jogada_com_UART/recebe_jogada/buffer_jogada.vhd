library ieee;
use ieee.std_logic_1164.all;

entity buffer_jogada is
	port(
		clock, reset:   in std_logic;
		endereco:       in std_logic;
		jogada_parcial: in std_logic_vector (6 downto 0);
		escreve:        in std_logic;
		jogada:         out std_logic_vector (13 downto 0)
	);
end entity;

architecture buffer_jogada_arch of buffer_jogada is
	signal saida_0, saida_1: std_logic_vector(6 downto 0);
	
	component registrador_n is
		generic (constant N: integer := 8);
		port (clock, clear, enable: in STD_LOGIC;
			  D: in STD_LOGIC_VECTOR(N-1 downto 0);
			  Q: out STD_LOGIC_VECTOR (N-1 downto 0));
	end component;

begin
	REG0: registrador_n generic map(N => 7)
							  port map (clock, reset, escreve AND NOT endereco, jogada_parcial, saida_0);
	REG1: registrador_n generic map(N => 7)
							  port map (clock, reset, escreve AND endereco, jogada_parcial, saida_1);
	jogada(6 downto 0) <= saida_0;
	jogada(13 downto 7) <= saida_1;
	
end buffer_jogada_arch;

