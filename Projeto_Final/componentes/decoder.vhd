library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder is
    port(   input  : in  std_logic_vector(6 downto 0);
            output : out std_logic_vector(1 downto 0));
end decoder;

architecture decoder_arc of decoder is
begin
	with input select
        output <=	"01" when "1000001",
						"10" when "1011000",
                  "11" when others;
end decoder_arc;