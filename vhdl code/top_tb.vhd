----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2019 11:07:55 PM
-- Design Name: 
-- Module Name: top_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;


entity top_tb is

end top_tb;

architecture Behavioral of top_tb is
component top_design 
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_vector(3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal clk : std_logic;
signal btn, sw, led : std_logic_vector(3 downto 0):=(others => '0');
begin

uut: top_design
port map(
btn => btn,
clk => clk,
sw => sw,
led => led
);
clock: process
begin
clk <= '1';
wait for 4ns;
clk <= '0';
wait for 4 ns;
end process;

stimulus: process
begin
wait for 50 ns ;
btn(0) <= '0';
btn(1) <='1';
btn(2) <='1';
btn(3) <='1';
sw<="0100";
wait for 50 ns;
btn(3) <='0';
wait for 150 ms;
btn(0)<='1';
wait for 100 ms;
btn (0) <='0';

wait for 1005 ms;



end process;


end Behavioral;
