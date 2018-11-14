library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

component batalha_naval is
	generic(	constant M: integer; --Baud rate
				constant N: integer);
	port(	clock, reset, jogar, vez														: in  std_logic;
			entrada_serial_terminal, entrada_serial_adversario 					: in  std_logic;
			saida_serial_terminal, saida_serial_adversario							: out  std_logic;
			jogada_1, jogada_0, resultado, placar_jogador, placar_adversario 	: out std_logic_vector(6 downto 0);
			fazer_jogada, pronto		 														: out std_logic);
end batalha_naval;

architecture batalha_naval_arc of batalha_naval is

	
	
	begin
		envia_mensagem_adversario: envia_mensagem 	generic map (M, N);
													port map (clock, reset, )
end batalha_naval_arc;