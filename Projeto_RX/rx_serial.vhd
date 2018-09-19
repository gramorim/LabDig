library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity rx_serial is
    port (
        clock, reset: in std_logic;
        entrada_serial: in std_logic;
		  hex1, hex0: out std_logic_vector (6 downto 0);
        pronto, paridade_ok, o_tick, o_serial : out std_logic
    );
end rx_serial;

architecture rx_serial_arch of rx_serial is
    signal s_zera, s_conta, s_carrega, s_desloca, s_tick, s_fim, s_reset: std_logic;
    component rx_serial_uc port ( 
			clock, reset, tick, fim: in STD_LOGIC;
         zerar, contar, carregar, deslocar, pronto: out STD_LOGIC );
    end component;

    component rx_serial_fd
    port (clock, reset                      :  in std_logic;
          zerar, contar, carregar, deslocar :  in std_logic;
          entrada_serial                    :  in std_logic;
			 fim, paridade_ok, tick            :  out std_logic;
		    hex1, hex0                        :  out std_logic_vector(6 downto 0));
	 end component;
	 
    

    
begin

	s_reset <= reset;

    -- sinais reset e partida mapeados em botoes ativos em alto
    U1: rx_serial_uc port map (clock, s_reset, s_tick, s_fim,
                               s_zera, s_conta, s_carrega, s_desloca, pronto);
    U2: rx_serial_fd port map (clock, s_reset, s_zera, s_conta, s_carrega, s_desloca, entrada_serial, 
                               s_fim, paridade_ok, s_tick, hex1, hex0);
    o_tick   <= s_tick;
	 o_serial <= entrada_serial;
	 
end rx_serial_arch;

