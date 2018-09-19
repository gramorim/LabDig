library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity rx_serial is
    port (
        clock, reset: in std_logic;
        entrada_serial: in std_logic;
		  hex1, hex0: out std_logic_vector (6 downto 0);
        pronto, paridade_ok : out std_logic
    );
end rx_serial;

architecture rx_serial_arch of rx_serial is
    signal s_zera, s_conta, s_carrega, s_desloca, s_tick, s_fim: std_logic;
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

    -- sinais reset e partida mapeados em botoes ativos em alto
    U1: rx_serial_uc port map (clock, reset, '1', s_fim,
                               s_zera, s_conta, s_carrega, s_desloca, pronto);
    U2: rx_serial_fd port map (clock, reset, s_zera, s_conta, s_carrega, s_desloca, entrada_serial, 
                               s_fim, paridade_ok, s_tick, hex1, hex0);
    
end rx_serial_arch;

