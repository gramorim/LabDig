library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity UART is
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
		--hex_dado_1, hex_dado_0    : out std_logic_vector(6 downto 0);
		  
		  clock, reset : in std_logic);
		  
		  --Depuracao rx
		--o_estado_rx : out std_logic_vector(3 downto 0);
		--o_tick_rx   : out std_logic);
		--o_serial_entrada, o_fim : out std_logic;
		--hex_estado       : out std_logic_vector(6 downto 0));
end UART;

Architecture UART_ark of UART is
	signal s_dados: std_logic_vector(9 downto 0);
	signal s_transmite, s_recebe, s_reset : std_logic;

	component tx_serial
		 generic(constant Ratio_m : integer;
					constant Ratio_n : integer);
		 port(clock, reset, partida, paridade                : in  std_logic;
				dados_ascii                                    : in  std_logic_vector (6 downto 0);
				saida_serial, pronto, o_tick, transm_andamento : out std_logic);
	end component;
	
	component rx_serial
	 generic(constant Ratio_m : integer;
				constant Ratio_n : integer);
    port (clock, reset                                 : in  std_logic;
          entrada_serial, recebe_dado, paridade        : in  std_logic;
		    hex1, hex0, hex_est, hex_cont, hex_ticker    : out std_logic_vector(6 downto 0);
          tem_dado_recebido, paridade_ok, o_tick       : out std_logic;
			 o_serial, O_FIM                              : out std_logic;
		    o_estado                                     : out std_logic_vector(3 downto 0);
		    o_dados                                      : out std_logic_vector(9 downto 0);
		    o_dado_recebido                              : out std_logic_vector(6 downto 0));
	end component;

begin

	TX: tx_serial
	generic map(Ratio_m,Ratio_n)
	port map(clock, s_reset, s_transmite, '0',
				i_dado_ascii,
				serial_saida, pronto, open, transm_andamento);
	
	RX: rx_serial
	generic map(Ratio_m,Ratio_n)
	port map(clock, s_reset,
            serial_entrada, s_recebe, '0',
		    --hex_dado_1, hex_dado_0, hex_estado, open, open,
		      open, open, open, open, open,
          --tem_dado_rec, paridade_ok, o_tick_rx,
            tem_dado_rec, paridade_ok, open,
			 --open, o_fim,
			   open, open,
		    --o_estado_rx,
		      open,
				open,
		      o_dado_ascii);
				
	s_transmite <= transmite_dado;
	s_recebe    <= recebe_dado;
	s_reset     <= reset;
	
	--o_serial_entrada <= serial_entrada;
			
end UART_ark;