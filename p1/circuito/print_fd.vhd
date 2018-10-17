
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity printf_fd is
	generic(constant N_char  : integer := 16;    -- quantidade caracteres
			  constant N_end   : integer := 4;     -- quantidade bits endereçamento
			  constant Ratio_m : integer := 7;
			  constant Ratio_n : integer := 3);
	port(clock, carrega, conta, zera, transmite : in  std_logic;
		  dados                                  : in  std_logic_vector(N_end-1 downto 0);
		  we, ce                                 : in  std_logic;
		  dado_entrada                           : in  std_logic_vector(6 downto 0);
		  fim, pronto, saida_serial, transm      : out std_logic;
		  o_estado_tx                            : out std_logic_vector(3 downto 0);
		  o_mem                						  : out std_logic_vector(6 downto 0);
		  o_hex_mem_1, o_hex_mem_0, o_hex_end    : out std_logic_vector(6 downto 0));
end printf_fd;

architecture printf_fd_arc of printf_fd is
	signal s_Q          : std_logic_vector(N_end-1 downto 0);
	signal s_dado_saida : std_logic_vector(6 downto 0);
	signal hex1, hex0, hexend   : std_logic_vector(3 downto 0);

	component contador_m_load is
		generic (
			constant M: integer := 16;  -- módulo do contador
			constant N: integer := 4    -- número de bits da saída
		);
		 port (
			  CLK, zera, conta, carrega: in STD_LOGIC;
			  dados                    : in std_logic_vector (N-1 downto 0);
			  Q                        : out STD_LOGIC_VECTOR (N-1 downto 0);
			  fim                      : out STD_LOGIC
		 );
	end component;

	component ram_MxN IS
		GENERIC (
			constant M   : integer := 16;
			constant N   : integer := 7;
			constant ADR : integer := 4
		);
		PORT (dado_entrada : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				dado_saida   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				endereco     : IN  STD_LOGIC_VECTOR(ADR-1 DOWNTO 0);         
				we, L_ce     : IN  STD_LOGIC);
	END component;
	
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
			  
			  clock, reset : in std_logic;
			  
			  o_estado_tx : out std_logic_vector(3 downto 0));
	end component;
	
	component hex7seg is
		 port (
			  binary : in std_logic_vector(3 downto 0);
			  enable : in std_logic;
			  hex_output : out std_logic_vector(6 downto 0)
		 );
	end component;

begin

	CONT: contador_m_load
	generic map(N_char,N_end)
	port map(clock, zera, conta, carrega,
			   dados,
			   s_Q,
			   fim);
				
	RAM: ram_MxN
	GENERIC map(N_char,7,N_end)
	PORT map(dado_entrada,
				s_dado_saida,
				s_Q,         
				we, ce);
				
	UART1: UART
	generic map(Ratio_m,Ratio_n)
	port map(s_dado_saida,
			   transmite,
			   transm, pronto,
			   saida_serial,
			  
			   open,
			   open, open,
			   '0',
			   '1',
			  
			   clock, '0',
				
				o_estado_tx);
				
	hex1(3) <= '0';
	hex1(2 downto 0) <= s_dado_saida(6 downto 4);
	
	uHex1: hex7seg
	port map(hex1,
				'1',
				o_hex_mem_1);
	
	hex0 <= s_dado_saida(3 downto 0);
	
	uHex0: hex7seg
	port map(hex0,
				'1',
				o_hex_mem_0);
	
	 			
	o_mem <= s_dado_saida;
	
	hexend <= s_Q(3 downto 0);
	
	uHexcont: hex7seg
	port map(s_Q,
				'1',
				o_hex_end);

end printf_fd_arc;