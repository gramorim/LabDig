library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity rx_serial is
	 generic(constant Ratio_m : integer := 100;
				constant Ratio_n : integer := 7);
    port (clock, reset                                 : in  std_logic;
          entrada_serial, recebe_dado, paridade        : in  std_logic;
		    hex1, hex0, hex_est, hex_cont, hex_ticker    : out std_logic_vector(6 downto 0);
          tem_dado_recebido, paridade_ok, o_tick       : out std_logic;
			 o_serial, O_FIM                              : out std_logic;
		    o_estado                                     : out std_logic_vector(3 downto 0);
		    o_dados                                      : out std_logic_vector(9 downto 0);
		    o_dado_recebido                              : out std_logic_vector(6 downto 0));
end rx_serial;

architecture rx_serial_arch of rx_serial is
    signal s_zera, s_conta, s_carrega, s_desloca : std_logic;
	 signal s_tick, s_fim, s_reset, s_registra    : std_logic;
	 signal s_paridade_ok                         : std_logic;
	 signal s_estado                              : std_logic_vector(3 downto 0);
	 signal s_dado_recebido                       : std_logic_vector(7 downto 0);
	 
    component rx_serial_uc 
		  port(clock, reset, tick, fim, recebe_dado                  : in STD_LOGIC;
				 zerar, contar, carregar, deslocar, pronto, o_registra : out STD_LOGIC;
				 Estado : out std_logic_vector(3 downto 0));
    end component;

    component rx_serial_fd
		 generic(constant Ratio_m : integer := 100;
					constant Ratio_n : integer := 7);
		 port (clock, reset                                : in  std_logic;
				 zerar, contar, carregar, deslocar, paridade : in  std_logic;
				 entrada_serial, registra                    : in  std_logic;
				 estado                                      : in  std_logic_vector(3 downto 0);
				 fim, paridade_ok, tick                      : out std_logic;
				 hex1, hex0, hex_est, hex_cont, hex_ticker   : out std_logic_vector(6 downto 0);
				 o_dados                                     : out std_logic_vector(9 downto 0);
				 o_reg1                                      : out std_logic_vector(7 downto 0));
	 end component;

begin

	s_reset <= reset;

    -- sinais reset e partida mapeados em botoes ativos em alto
    UC: rx_serial_uc 
	 port map(clock, s_reset, s_tick, s_fim, recebe_dado,
             s_zera, s_conta, s_carrega, s_desloca, 
			    tem_dado_recebido, s_registra, s_estado);
    
	 FD: rx_serial_fd 
	 generic map(Ratio_m,Ratio_n)
	 port map(clock, s_reset, s_zera, s_conta, s_carrega, 
				 s_desloca, paridade, entrada_serial, s_registra,
             s_estado, s_fim, s_paridade_ok, s_tick, 
				 hex1, hex0, hex_est, hex_cont, hex_ticker,
				 o_dados, s_dado_recebido);
				 
    o_tick   <= s_tick;
	 o_serial <= entrada_serial;
	 o_fim    <= s_fim;
	 o_estado <= s_estado;
	 paridade_ok <= s_paridade_ok;
	 
	 o_dado_recebido <= s_dado_recebido(6 downto 0);
	 
end rx_serial_arch;

