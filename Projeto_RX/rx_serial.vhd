library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity rx_serial is
	 generic(constant Ratio_m : integer := 100;
				constant Ratio_n : integer := 7);
    port (clock, reset: in std_logic;
          entrada_serial, partida: in std_logic;
		    hex1, hex0, hex_est, hex_cont, hex_ticker    : out std_logic_vector(6 downto 0);
          pronto, paridade_ok, o_tick, o_serial, O_FIM : out std_logic;
		    o_estado                                     : out std_logic_vector(3 downto 0);
		    o_dados                                      : out std_logic_vector(9 downto 0);
		    o_reg1, o_reg2                               : out std_logic_vector(6 downto 0));
end rx_serial;

architecture rx_serial_arch of rx_serial is
    signal s_zera, s_conta, s_carrega, s_desloca : std_logic;
	 signal s_tick, s_fim, s_reset, s_registra    : std_logic;
	 signal s_estado                              : std_logic_vector(3 downto 0);
	 
    component rx_serial_uc 
		port ( clock, reset, tick, fim, partida                      : in  STD_LOGIC;
             zerar, contar, carregar, deslocar, pronto, o_registra : out STD_LOGIC;
			    Estado                                                : out std_logic_vector(3 downto 0));
    end component;

    component rx_serial_fd
    port (clock, reset                              : in std_logic;
          zerar, contar, carregar, deslocar         : in std_logic;
          entrada_serial, registra                  : in std_logic;
			 estado                                    : in std_logic_vector(3 downto 0);
			 fim, paridade_ok, tick                    : out std_logic;
		    hex1, hex0, hex_est, hex_cont, hex_ticker : out std_logic_vector(6 downto 0);
			 o_dados                                   : out std_logic_vector(9 downto 0);
			 o_reg1, o_reg2                            : out std_logic_vector(6 downto 0));
	 end component;
	 
    

    
begin

	s_reset <= reset;

    -- sinais reset e partida mapeados em botoes ativos em alto
    U1: rx_serial_uc port map (clock, s_reset, s_tick, s_fim, partida,
                               s_zera, s_conta, s_carrega, s_desloca, 
										 pronto, s_registra, s_estado);
    
	 U2: rx_serial_fd port map (clock, s_reset, s_zera, s_conta, s_carrega, 
										 s_desloca, entrada_serial, s_registra, 
                               s_estado, s_fim, paridade_ok, s_tick, 
										 hex1, hex0, hex_est, hex_cont, hex_ticker,
										 o_dados, o_reg1, o_reg2);
    o_tick   <= s_tick;
	 o_serial <= entrada_serial;
	 o_fim    <= s_fim;
	 o_estado <= s_estado;
	 
end rx_serial_arch;

