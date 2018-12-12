library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity recebe_mensagem_UART is
	generic( constant ratio 		: integer := 7;
				constant log2_ratio 	: integer := 3);
	port(
		clock, reset, enable:     in  std_logic;
		entrada_serial:   		  in  std_logic;
		erro:             		  out std_logic;
		hex0, hex1, hex2, hex3:   out std_logic_vector(6 downto 0);
		pronto:						  out std_logic
	);
end entity;

architecture recebe_jogada_UART_arch of recebe_mensagem_UART is
	signal s_tem_dado_rec, s_recebe_dado, s_erro: std_logic;
	signal s_jogada_parcial: std_logic_vector (6 downto 0);
	signal s_jogada: std_logic_vector (13 downto 0);
	signal s_hex1, s_hex3, s_hex5: std_logic_vector (3 downto 0);
	signal s_reset: std_logic;
	
	component recebe_jogada is
		generic(	constant N_ascii  : integer;     -- Numero de characteres desejados
					constant log2N		: integer);
		port(
			clock, reset, enable:     in std_logic;
			tem_dado_rec:     		  in std_logic;
			jogada_parcial:   		  in std_logic_vector(6 downto 0);
			jogada:           		  out std_logic_vector(13 downto 0);
			pronto:			  		  out std_logic;
			recebe_dado:              out std_logic--;
			--Debugging
			--db_c:						 out std_logic_vector(1 downto 0);
			--db_escreve:               out std_logic;
			--db_estado:					out std_logic_vector(3 downto 0);
			--db_teste: 			 out std_logic
		);
	end component;

	component rx_serial is
		 generic(constant Ratio_m : integer;
					constant Ratio_n : integer;
					constant tam_ascii : integer);
		 port (clock, reset                                 : in  std_logic;
				 entrada_serial, recebe_dado, paridade        : in  std_logic;
				 hex1, hex0, hex_est, hex_cont, hex_ticker    : out std_logic_vector(6 downto 0);
				 tem_dado_recebido, paridade_ok, o_tick       : out std_logic;
				 o_serial, O_FIM                              : out std_logic;
				 o_estado                                     : out std_logic_vector(3 downto 0);
				 o_dados                                      : out std_logic_vector(tam_ascii+2 downto 0);
				 o_dado_recebido                              : out std_logic_vector(tam_ascii-1 downto 0));
	end component;
	
	component hex7seg is
		port (
			binary : in std_logic_vector(3 downto 0);
			enable : in std_logic;
			hex_output : out std_logic_vector(6 downto 0)
		);
	end component;
	
	
begin
	s_reset <= reset;
	
	R_JOG: recebe_jogada generic map(1,1) port map (clock, s_reset, enable, s_tem_dado_rec, s_jogada_parcial,
									s_jogada, pronto, s_recebe_dado);
	RX :  rx_serial
		 generic map(Ratio,log2_Ratio,7)
		 port map(clock, reset,
					 entrada_serial, s_recebe_dado, '0',
					 open, open, open, open, open,
					 s_tem_dado_rec, s_erro, open,
					 open, open,
					 open,
					 open,
					 s_jogada_parcial);
					 
	erro <= not s_erro;
	

end architecture;