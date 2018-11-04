library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity registra_jogada is
	port(
		clock, reset, enable:     in std_logic;
		tem_dado_rec:     		  in std_logic;
		jogada_parcial:   		  in std_logic_vector(6 downto 0);
		erro:             		  out std_logic;
		jogada:           		  out std_logic_vector(13 downto 0);
		pronto:			  		     out std_logic
	);
end entity;

architecture registra_jogada_arch of registra_jogada is
	signal fim_c, enable_c, escreve: std_logic;
	component recebe_jogada_uc is
		port(
			tem_dado_recebido:      in std_logic;
			fim_c, clock:           in std_logic;
			reset, enable:          in std_logic;
			recebe_dado:            out std_logic;
			enable_c:			    out std_logic;
			reg_write:              out std_logic;
			pronto:					out std_logic
		);
	end component;

	component recebe_jogada_fd is
		port(
			clock, escreve:       in std_logic;
			enable_c: 			  in std_logic;
			reset_c, reset_r:     in std_logic;
			jogada_parcial:       in std_logic_vector (6 downto 0);
			fim_c:                out std_logic;
			jogada:               out std_logic_vector (13 downto 0)
		);
	end component;
begin
	FD: recebe_jogada_fd port map (clock, escreve, enable_c, reset, reset,
									jogada_parcial, fim_c);
	UC: recebe_jogada_uc port map (tem_dado_rec, fim_c, clock, reset, enable,
									recebe_dado, enable_c, escreve, pronto);
end architecture;