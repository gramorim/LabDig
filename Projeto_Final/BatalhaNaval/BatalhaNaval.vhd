library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity BatalhaNaval is
  port (
    clock, reset                : in std_logic;
    vez, jogar                  : in std_logic;
    entrada_serial_terminal     : in std_logic;
    entrada_serial_adversario   : in std_logic;

    saida_serial_terminal       : out std_logic;
    saida_serial_adversario     : out std_logic;
    fazer_jogada                : out std_logic;
    pronto                      : out std_logic    
  );
end BatalhaNaval;

architecture BatalhaNavalArch of BatalhaNaval is

	component batalha_naval_fd is
		 port ( 	clock, reset : in std_logic;
					entrada_serial : in std_logic;
					enableRecJog, enableRecMen, enableEnvMen : in std_logic;
					
					end1, end0 : out std_logic_vector(3 downto 0);
					mensagem : out std_logic_vector(6 downto 0);
					saida_serial : OUT STD_LOGIC);
	end component;

begin

end BatalhaNavalArch ; -- BatalhaNavalArch