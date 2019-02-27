

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity clock_div_tb is
end clock_div_tb;

architecture Behavioral of clock_div_tb is

component clock_div
Port(
clk  : in std_logic;        
new_clock : out std_logic  
);
end component;

signal clk_in : std_logic :='0';
signal clk_out : std_logic :='0';




begin

uut: clock_div
Port map(
clk => clk_in,
new_clock => clk_out
);

clk_process: process
begin 
clk_in <= '1';
wait for 4ns;
clk_in <='0';
wait for 4ns;
end process;

end Behavioral;
