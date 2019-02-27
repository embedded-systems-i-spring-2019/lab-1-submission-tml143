----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 05:46:43 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.


entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is

signal direction : std_logic:='0';
signal value : std_logic_vector(3 downto 0);
signal counter : std_logic_vector(3 downto 0):= "0000";
begin


process(clk)
begin

if en ='1' then

 if (rising_edge(clk)) then
       if (rst = '1') then counter <= (others => '0'); else
       if clk_en ='1' then 

       if ld ='1' then value <=val; end if;    

        if updn ='1' then 
        direction <= dir;
        end if;
        if direction = '0' then 
            if (counter = value) then counter<= (others => '0');
            else counter <= std_logic_vector((unsigned(counter)+1)); end if;
        end if;
        if direction ='1' then 
            if (counter>"0000") then counter<= std_logic_vector((unsigned(counter)-1));
            else counter<= value; end if;
        end if;
        
         
        end if;
        
        end if;
    
      end if;
   

end if;



end process;
cnt <= counter;
end Behavioral;
