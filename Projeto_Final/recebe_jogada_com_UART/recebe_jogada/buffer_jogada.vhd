library ieee;
use ieee.std_logic_1164.all;

entity buffer_jogada is
	generic(constant tam_ascii 	: integer := 8);
	port(
		clock, reset:   in std_logic;
		endereco:       in std_logic;
		jogada_parcial: in std_logic_vector (tam_ascii-1 downto 0);
		escreve:        in std_logic;
		jogada:         out std_logic_vector (2*tam_ascii-1 downto 0);
		teste: 			 out std_logic
	);
end entity;

architecture buffer_jogada_arch of buffer_jogada is
	signal saida_0, saida_1: std_logic_vector(tam_ascii-1 downto 0);
	component registrador_n is
		generic (constant N: integer);
		port (clock, clear, enable: in STD_LOGIC;
			  D: in STD_LOGIC_VECTOR(N-1 downto 0);
			  Q: out STD_LOGIC_VECTOR (N-1 downto 0));
	end component;

begin
	teste <= escreve AND NOT endereco;
	REG0: registrador_n generic map(N => tam_ascii)
							  port map (clock, reset, escreve AND NOT endereco, jogada_parcial, saida_0);
	REG1: registrador_n generic map(N => tam_ascii)
							  port map (clock, reset, escreve AND endereco, jogada_parcial, saida_1);
	jogada(tam_ascii-1 downto 0) <= saida_1;
	jogada(2*tam_ascii-1 downto tam_ascii) <= saida_0;
	
end buffer_jogada_arch;

