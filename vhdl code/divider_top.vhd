----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 12:14:14 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_top is
Port (
clk  : in std_logic;
led0 :inout std_logic
 );
end divider_top;


architecture Behavioral of divider_top is

component clock_div
port(
  clk  : in std_logic;        
  new_clock : out std_logic   
);
end component;
component reg
port(
    clk : in STD_LOGIC;
    ce : in STD_LOGIC;
    data : in STD_LOGIC;
    q : out STD_LOGIC
);
end component;
component not_gate
port(
in1 : in std_logic;
out1 : out std_logic
);
end component;

signal sig1,sig2 : std_logic;
begin

clk_divider: clock_div
port map(
clk =>clk,
new_clock => sig1
);

NG: not_gate
Port map(
in1 => led0,
out1=> sig2
);

reg1 : reg
port map (  
clk => clk,
ce =>sig1,
data => sig2,
q => led0
);




end Behavioral;
