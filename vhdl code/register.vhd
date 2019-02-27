
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity reg is
    Port ( clk : in STD_LOGIC;
           ce : in STD_LOGIC;
           data : in STD_LOGIC;
           q : out STD_LOGIC);
end reg;

architecture Behavioral of reg is

begin

process(clk)
begin
if (rising_edge(clk)) then

if ce = '1' then
q <= data;
else
q <= '0';
end if;
end if;
end process;

end Behavioral;
