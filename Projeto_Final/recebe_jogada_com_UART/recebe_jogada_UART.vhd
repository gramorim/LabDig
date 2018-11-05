library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity recebe_jogada_UART is
	port(
		clock, reset, enable:     in std_logic;
		entrada_serial:   		  in std_logic;
		erro:             		  out std_logic;
		hex0, hex1, hex2, hex3:   out std_logic_vector(6 downto 0);
		pronto:			  		  out std_logic
	);
end entity;

architecture recebe_jogada_UART_arch of recebe_jogada_UART is
	signal s_tem_dado_rec, s_recebe_dado, s_erro: std_logic;
	signal s_jogada_parcial: std_logic_vector (6 downto 0);
	signal s_jogada: std_logic_vector (13 downto 0);
	signal s_hex1, s_hex3: std_logic_vector (3 downto 0);

	constant debug : std_logic := '0';
	component recebe_jogada is
		port(
			clock, reset, enable:     in std_logic;
			tem_dado_rec:     		  in std_logic;
			jogada_parcial:   		  in std_logic_vector(6 downto 0);
			jogada:           		  out std_logic_vector(13 downto 0);
			pronto:			  		  out std_logic;
			recebe_dado:              out std_logic
		);
	end component;

	component UART is
		generic(constant Ratio_m : integer := 25000000;
				  constant Ratio_n : integer := 25);
		port(i_dado_ascii             : in  std_logic_vector(6 downto 0);
			  transmite_dado           : in  std_logic;
			  transm_andamento, pronto : out std_logic;
			  serial_saida             : out std_logic;
			  
			  o_dado_ascii              : out std_logic_vector(6 downto 0);
			  paridade_ok, tem_dado_rec : out std_logic;
			  recebe_dado               : in  std_logic;
			  serial_entrada            : in  std_logic;
			  hex_dado_1, hex_dado_0    : out std_logic_vector(6 downto 0);
			  
			  clock, reset : in std_logic;
			  
			  --Depuracao rx
			  --o_estado_rx : out std_logic_vector(3 downto 0);
			  --o_tick_rx   : out std_logic);
			  o_serial_entrada, o_fim : out std_logic;
			  hex_estado       : out std_logic_vector(6 downto 0));
	end component;
	component hex7seg is
		port (
			binary : in std_logic_vector(3 downto 0);
			enable : in std_logic;
			hex_output : out std_logic_vector(6 downto 0)
		);
	end component;
begin
	R_JOG: recebe_jogada port map (clock, reset, enable, s_tem_dado_rec, s_jogada_parcial,
									s_jogada, pronto, s_recebe_dado);
	UART_RX: UART port map ("0000000", '0', open, open, open, s_jogada_parcial, s_erro, s_tem_dado_rec, s_recebe_dado,
						entrada_serial, open, open, clock, reset, open, open);
	erro <= not s_erro;
	
	s_hex3(3) <= '0';
	s_hex3(2 downto 0) <= s_jogada(13 downto 11);

	s_hex1(3) <= '0';
	s_hex1(2 downto 0) <= s_jogada(6 downto 4);

	J_HEX3: hex7seg port map (s_hex3, '1', hex3);
	J_HEX2: hex7seg port map (s_jogada(10 downto 7), '1', hex2);
	J_HEX1: hex7seg port map (s_hex1, '1', hex1);
	J_HEX0: hex7seg port map (s_jogada(3 downto 0), '1', hex0);

end architecture;