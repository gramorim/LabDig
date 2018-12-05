library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder is
	generic(constant tam_ascii : integer := 7);
    port(   input  : in  std_logic_vector(tam_ascii-1 downto 0);
            output : out std_logic_vector(1 downto 0);
				ganhei : out std_logic);
end decoder;

architecture decoder_arc of decoder is
begin
	--versão 7 bits
	with input select
        output <=	"01" when "1000001",
						"10" when "1011000",
                  "00" when "1011111",
						"11" when others;
						
	with input select
        ganhei <=	'1' when "1000111",
						'0' when others;
	
	
		--versao 8 bits
--	with input select
 --       output <=	"01" when "11000001",
	--					"10" when "11011000",
     --             "11" when others;
end decoder_arc;