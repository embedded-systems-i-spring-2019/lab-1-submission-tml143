

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity debounce_tb is

end debounce_tb;

architecture Behavioral of debounce_tb is
component debounce
port (
BTN : in STD_LOGIC;
CLK : in STD_LOGIC;
DBNC : out STD_LOGIC);
end component;
signal s_btn, s_clk : std_logic :='0';
signal s_dbnc : std_logic;
begin

uut: debounce
Port map(
BTN => s_btn,
CLK => s_clk,
DBNC => s_dbnc
);
 clk_process :process
  begin
 s_clk <= '1';
 wait for 4 ns;
 s_clk <= '0';
 wait for 4ns;
  end process;

stimulus: process
  begin  
 
wait for 5 ms; 

 s_btn <= '0';
 wait for 10 ns; 
 s_btn <= '1';
 wait for 10 ms; 
 s_btn <= '0';
 wait for 5 ms; 
 s_btn <= '1';
 wait for 30 ns; 
 s_btn <= '0';
 wait for 10 ns; 
 s_btn <= '1';
 wait for 40 ns; 
 s_btn <= '0';
 wait for 10 ns; 
 s_btn <= '1';
 wait for 30 ns;  
 s_btn <= '0';
 wait for 10 ns; 
 s_btn <= '1';
 wait for 40 ms;  
 s_btn <= '0';
 wait for 10 ns; 
 s_btn <= '1';
 wait for 20 ns; 
 s_btn <= '0';
 wait for 10 ns; 
 s_btn <= '1';
 wait for 30 ns; 
 s_btn <= '0';
     wait;
  end process;
end Behavioral;
