
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity rx_serial_fd is
    port (clock, reset                      :  in std_logic;
          zerar, contar, carregar, deslocar :  in std_logic;
          entrada_serial                    :  in std_logic;
			 fim, paridade_ok, tick            :  out std_logic;
		    hex1, hex0                        :  out std_logic_vector(6 downto 0));
end rx_serial_fd;

architecture rx_serial_fd of rx_serial_fd is
   signal D, S   : std_logic_vector (9 downto 0);
	signal s_hex1 : std_logic_vector (3 downto 0);
     
	component deslocador_n
	generic (constant N: integer); -- numero de bits
   port (clock, reset                     : in std_logic;
			carrega, desloca, entrada_serial : in std_logic; 
         dados                            : in std_logic_vector (N-1 downto 0);
         saida                            : out  std_logic_vector (N-1 downto 0));
   end component;

   component contador_m
	generic(constant M: integer;    -- modulo do contador
		     constant N: integer);   -- numero de bits da sa�da
   port (CLK, zera, conta : in STD_LOGIC;
         Q                : out STD_LOGIC_VECTOR (N-1 downto 0);
         fim              : out STD_LOGIC);
   end component;
	 
	component hex7seg
	port (binary     : in std_logic_vector(3 downto 0);
         enable     : in std_logic;
         hex_output : out std_logic_vector(6 downto 0));
	end component;
	
   component gerador_paridade_n
   generic (constant N: integer := 7);
   port (dado      : in STD_LOGIC_VECTOR (N-1 downto 0);
         par, impar: out STD_LOGIC);
   end component; 
	
	component ticker
	generic(Constant Clk_BRate_m : integer := 100;
			  Constant Clk_BRate_n : integer := 7;
			  Constant Total_m     : integer := 11;
			  Constant Total_n     : integer := 4);
	port(serial, CLK, Reset : in  std_logic;
	     tick               : out std_logic);
	end component;
	 
begin
	D <= (others=>'1');
	
   U1: deslocador_n 
	generic map (N => 10)  
	port map (clock, 
	          reset, 
				 carregar, 
				 deslocar, 
				 entrada_serial,D,S);
				 
   U2: contador_m 
	generic map (M => 10, 
	             N => 4) 
	port map (clock, 
	          zerar, 
				 contar, 
				 open, 
				 fim);
	U3: gerador_paridade_n
	port map (S(6 downto 0), paridade_ok, open);
	
	U4: ticker
	port map (entrada_serial, clock, reset, tick);
	
	s_hex1(3) <= '0';
	S_hex1(2 downto 0) <= S(6 downto 4);
	 
	H1: hex7seg 
	port map(s_hex1,'1',hex1);
	
	H0: hex7seg 
	port map(S(3 downto 0),'1',hex0);
   
end rx_serial_fd;
